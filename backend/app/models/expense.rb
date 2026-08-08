class Expense < ApplicationRecord
  belongs_to :category

  validate :date_not_in_future

  private

  def date_not_in_future
    return if date.blank?
    return unless date > Date.current

    errors.add(:date, "can't be in the future")
  end
end
