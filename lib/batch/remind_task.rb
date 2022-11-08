class Batch::RemindTask
  def self.remind_task
    tasks = Task.all
    tasks.each do |task|
      time_difference = (task.due - Time.now.in_time_zone("Tokyo")) / 3600 # AM9:00との時間差を時間単位で算出する
      if task.reminder_active == true && time_difference <= 24 && time_difference >= 0
        SampleMailer.send_before_deadline(task.user).deliver_now # メールを送信するためのメソッド
        p "メールを#{task.user.name}に送信しました" # ログに表示するメッセージ
      end
    end
  end
end