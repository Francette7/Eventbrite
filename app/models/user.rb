class User < ApplicationRecord
  after_create :welcome_send
  has_one_attached :profil

    def welcome_send
      UserMailer.welcome_email(self).deliver_now
    end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
	has_many :events
	has_many :events, through: :attendances

end
