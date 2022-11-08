class ApplicationMailer < ActionMailer::Base
  default from:ENV['SENDER_ADDRESS'],
  reply_to: ENV['SENDER_ADDRESS']
  layout 'mailer'
end
