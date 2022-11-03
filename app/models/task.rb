class Task < ApplicationRecord

  belongs_to :user
  validates :body, presence: true, length: { maximum: 30 }
  validates :due, presence: true
  validates :status, presence: true

  def self.sort(selection)
    case selection
    when 'near'
      return all.order(due: :asc)
    when 'desc'
      return all.order(status: :desc)
    when 'asc'
      return all.order(status: :asc)
    end
  end
end
