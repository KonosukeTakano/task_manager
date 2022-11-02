require "test_helper"

class SampleMailerTest < ActionMailer::TestCase
  test "send_before_deadline" do
    mail = SampleMailer.send_before_deadline
    assert_equal "Send before deadline", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
