class UserMailer < ApplicationMailer
  default from: "appacademy@io.com"

  def welcome_email(user)
    @user = user

    mail(to: @user.username, subject: "welcome to my awesome site")
  end
end
