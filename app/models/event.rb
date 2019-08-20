class Event < ApplicationRecord
   has_one_attached :avatar
	belongs_to :admin, class_name: 'User'
	has_many :attendances
	has_many :users, through: :attendances
	
	validates :start_date, presence: true, if: :already_past
  validates :duration, presence: true, numericality: {greater_than: 0}, if: :validate_duration
  validates :title, presence: true, length: {minimum: 5, maximum: 140} 
  validates :event_description, presence: true, length: {minimum: 20, maximum: 1000}
  #validates :price, presence: true, inclusion: {in: 1..1000}
  validates :location, presence: true  

  private

  def validate_duration
    if duration != 0 || duration % 5 == 0
      return true
    else 
      errors.add("duration not valid please retry")
    end
  end
  def already_past
    if start_date.present? && start_date < Date.today
      errors.add{"Event already past"}
    end 
  
  end

end
