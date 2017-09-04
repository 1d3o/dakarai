# frozen_string_literal: true

# AuthenticationMailer.
class AuthenticationMailer < ApplicationMailer

  include AuthenticationHelpers

  def confirm_email(user)
    # set mail contents
    @user = user
    @token = generate_confirm_email_token(user.uuid)

    # send email
    mail(
      to: user.email,
      subject: 'Email confirmation',
      template_path: 'mailers/authentication'
    )
  end

  def confirm_email_completed(user)
    # set mail contents
    @user = user

    # send email
    mail(
      to: user.email,
      subject: 'Email confirmation completed',
      template_path: 'mailers/authentication'
    )
  end

end
