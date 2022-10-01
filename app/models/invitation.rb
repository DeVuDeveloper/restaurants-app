class Invitation < ApplicationRecord
  belongs_to :user, -> { where(role: 'guest') }
  belongs_to :reservation

  has_one :review, dependent: :destroy

  delegate :date, to: :reservation
  delegate :duration, to: :reservation
  delegate :restaurant, to: :reservation

  delegate :first_name, to: :user
  delegate :last_name, to: :user

  def expired?
    date_range = date.localtime..date.localtime + duration.hours

    if !date_range.cover?(Time.now) && !review.present? && confirmed
      create_review!(restaurant_id: restaurant.id,
                     user_id: user.id)
    end

    !date_range.cover?(Time.now)
  end
end
