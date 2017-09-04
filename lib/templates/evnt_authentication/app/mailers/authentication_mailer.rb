# frozen_string_literal: true

# AuthenticationMailer.
class AuthenticationMailer < ApplicationMailer

  def confirm_email(user)
    @user = user
    mail(
      to: user.email,
      subject: 'Email confirmation',
      template_path: 'mailers/authentication'
    )
  end

end
