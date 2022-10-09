class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  acts_as_mappable default_units: :meters,
                   default_formula: :sphere,
                   distance_field_name: :distance,
                   lat_column_name: :lat,
                   lng_column_name: :lng

 

  has_many :friendships
  has_many :invitations
  has_many :reservations
  has_many :reviews

  before_create :set_role
  before_save :set_full_name

  def admin?
    role == 'admin'
  end

  def guest?
    role == 'guest'
  end

  def manager?
    role == 'manager'
  end

  def restaurant_manager(restaurant)
    restaurant_id == restaurant.id
  end

  def friends_rating(restaurant_id)
    ratings = []

    friendships.each do |friendship|
      avg_rating = friendship.friend.reviews.where(restaurant_id:).average(:rating).to_f
      ratings << avg_rating unless avg_rating.zero?
    end

    if ratings.count.zero?
      'Not rated yet'
    else
      rating = ratings.sum / ratings.count
      rating.round(2)
    end
  end

  def friend?(guest)
    !friendships.where(user_id: id, friend_id: guest.id).empty?
  end

  def friendship(friend)
    Friendship.where(user_id: id, friend_id: friend.id).first
  end

  def common_visits(friend)
    if reviews || !reviews.empty?
      visits = 0
      reviews.each do |review|
        visits = if review.reservation.user.id == friend.id
                   visits + 1
                 else
                   visits + review.reservation.invitations.where(user_id: friend.id, confirmed: true).count
                 end
      end
      visits
    else
      "You haven't been anywhere"
    end
  end

  private

  def set_role
    self.role ||= 'guest'
  end

  def set_full_name
    self.full_name = "#{first_name} #{last_name}" if first_name && last_name
  end
end
