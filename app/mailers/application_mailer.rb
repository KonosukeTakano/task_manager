class ApplicationMailer < ActionMailer::Base
  default from: '	task.manager.kmo@gmail.com',
  reply_to: "	task.manager.kmo@gmail.com"
  layout 'mailer'
end
