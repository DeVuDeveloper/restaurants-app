class Reservation < ApplicationRecord
  has_and_belongs_to_many :seats
  has_many :invitations
  has_one :review

  belongs_to :restaurant
  belongs_to :user

  validates_presence_of :date
  validates_presence_of :duration

  delegate :title, to: :restaurant

  def expired?
    date_range = date.localtime..date.localtime + duration.hours

    if !date_range.cover?(Time.now) && !review.present?
      create_review!(restaurant_id: restaurant.id,
                     user_id: user.id)
    end

    !date_range.cover?(Time.now)
  end
end
