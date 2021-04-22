class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  after_create :send_mail

  has_and_belongs_to_many :events

end

def send_mail
  UserMailer.new_user(self).deliver_later
end