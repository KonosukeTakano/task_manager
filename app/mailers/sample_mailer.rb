class SampleMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.sample_mailer.send_before_deadline.subject
  #
  def send_before_deadline(user)
    @user = user
    @tasks = @user.tasks

    mail to: user.email,
         subject: '【タスクの期限をお知らせします。】'
  end
end
