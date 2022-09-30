class Restaurant < ActiveRecord::Base

  acts_as_mappable :default_units => :meters,
                   :default_formula => :sphere,
                   :distance_field_name => :distance,
                   :lat_column_name => :lat,
                   :lng_column_name => :lng

  has_many :managers, -> { where(:role => "manager") }
  has_one :seats_configuration
  has_many :reviews
  has_one :menu

  validates_presence_of :title

  before_create :tap_configuration
  before_create :tap_menu

  def rating
    Review.all.where(:restaurant_id => self.id).average(:rating).to_f
  end

  private

  def tap_configuration
    self.build_seats_configuration
  end

  def tap_menu
    self.build_menu
  end

end
