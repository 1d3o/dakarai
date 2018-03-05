# frozen_string_literal: true

# ApplicationMailer.
class ApplicationMailer < ActionMailer::Base

  default from: 'noreply@mail.com'
  layout 'mailer'

end
