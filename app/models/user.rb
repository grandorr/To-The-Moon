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
  has_many :favorites, foreign_key: "interested_user"
  has_many :favorite_articles, through: :favorites, foreign_key: "interested_user"

  after_create :welcome_user_email

  def welcome_user_email
      WelcomeuserMailer.welcome_user_emails(self).deliver_now
  end

  def self.has_unread_messages?(messages)
    senders = []
    unread_messages = 0
    messages.each do |message|
      if message.has_been_read == false
        senders.append(message.sender.email)
        unread_messages += 1
      end
    end
    senders = senders.uniq
    messages_infos = [senders, unread_messages]
    return messages_infos
  end

end
