# == Schema Information
#
# Table name: cats
#
#  id          :integer          not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text             not null
#

class Cat < ActiveRecord::Base
  def self.color
    ['grey', 'black', 'white', 'brown', 'orange']
  end

  validates :birth_date, :color, :sex, :name, :description, presence: true
  validates :color, inclusion: { in: self.color }
  validates :sex, inclusion: { in: ['M', 'F'] }

  has_many :cat_rental_requests, -> { order "start_date DESC" }, :dependent => :destroy
end
