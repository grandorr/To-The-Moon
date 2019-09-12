class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_cryptos
  has_many :crypto_currencies, through: :user_cryptos 
  has_many :articles
  has_many :comments
  has_many :conversations
  has_many :sent_messages, foreign_key: "sender_id", class_name: "Message"
  has_many :received_messages, foreign_key: "recipient_id", class_name: "Message"
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships
  has_many :friend_requests, dependent: :destroy
  has_many :pending_friends, through: :friend_requests
  has_many :likes

after_create :welcome_user_email

def welcome_user_email
    WelcomeuserMailer.welcome_user_emails(self).deliver_now
end

end
