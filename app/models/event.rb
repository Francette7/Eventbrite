class Event < ApplicationRecord
	belongs_to :user
	has_many :attendances
	has_many :users, through: :attendances
	
	validates_numericality_of :duration, presence: true
	validates :title, presence: true, length: { in: 5..140 }
	validates :event_description, presence: true, length: { in: 20..1000 }
	validates :price, presence: true, length: { in: 1..1000 }
	validates :location, presence: true
	validates :start_date, presence: true
	def event_dates_must_in_the_future
		if start_date <= date.now 
			errors.add(:start_date, 'has to be before the date now')
		end
	end


end
