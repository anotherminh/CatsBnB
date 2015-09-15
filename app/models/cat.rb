class Cat < ActiveRecord::Base
  def self.color
    ['grey', 'black', 'white', 'brown', 'orange']
  end

  validates :birth_date, :color, :sex, :name, :description, presence: true
  validates :color, inclusion: { in: self.color }
  validates :sex, inclusion: { in: ['M', 'F'] }
end
