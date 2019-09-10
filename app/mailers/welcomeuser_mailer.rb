class WelcomeuserMailer < ApplicationMailer
  default from: 'tothemoon.website@gmail.com'

  def welcome_user_emails(user)
    @user = user
    @url = "https://ToTheMoon.herokuapp.com/"

    mail(to: @user.email, subject: 'Welcome to the moon !')
  end
end
