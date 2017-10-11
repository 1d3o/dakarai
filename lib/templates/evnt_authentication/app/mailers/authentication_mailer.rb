# frozen_string_literal: true

# AuthenticationMailer.
class AuthenticationMailer < ApplicationMailer

  include AuthenticationHelpers

  def confirm_email(user_uuid)
    # set mail contents
    @user = User.find_by(uuid: user_uuid)
    @token = generate_confirm_email_token(user_uuid)
    return unless @user

    # send email
    mail(
      to: @user.email,
      subject: 'Email confirmation',
      template_path: 'mailers/authentication'
    )
  end

  def confirm_email_completed(user_uuid)
    # set mail contents
    @user = User.find_by(uuid: user_uuid)
    return unless @user

    # send email
    mail(
      to: @user.email,
      subject: 'Email confirmation completed',
      template_path: 'mailers/authentication'
    )
  end

end
