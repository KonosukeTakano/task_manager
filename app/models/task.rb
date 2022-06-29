class Task < ApplicationRecord
  validates :body, presence: true

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
