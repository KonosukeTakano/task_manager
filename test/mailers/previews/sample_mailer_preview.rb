# Preview all emails at http://localhost:3000/rails/mailers/sample_mailer
class SampleMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/sample_mailer/send_before_deadline
  def send_before_deadline
    SampleMailer.send_before_deadline
  end

end
