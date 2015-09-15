require 'byebug'
# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :integer          not null, primary key
#  cat_id     :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  status     :string           default("PENDING"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CatRentalRequest < ActiveRecord::Base
  def self.status
    status = ['PENDING', 'APPROVED', 'DENIED']
  end

  validates :cat_id, :start_date, :end_date, :status, presence: true
  validates :status, inclusion: { in: self.status }
  validate :valid_dates
  validate :overlapping_requests


  private
  def valid_dates
    if end_date - start_date < 0
      errors.add(:invalid_date, "End date must be after start date")
    end
  end

  def overlapping_requests
    params = {cat_id: self.cat_id, start: self.start_date, endd: self.end_date}

    overlaps = CatRentalRequest.where(
      "(:id IS NULL OR id != :id) AND cat_id = :cat_id AND status = \'APPROVED\'",
      { id: self.id, cat_id: self.cat_id }
    )
    .where(
      "start_date BETWEEN :start AND :endd OR end_date BETWEEN :start AND :endd",
      {start: self.start_date, endd: self.end_date }
    )

    unless overlaps.empty?
      errors.add(:overlapping_requests, "Cat is already reserved for those dates")
    end
  end
end