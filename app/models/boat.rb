require 'pry'
class Boat < ActiveRecord::Base
  belongs_to  :captain
  has_many    :boat_classifications
  has_many    :classifications, through: :boat_classifications

  def self.first_five
    #binding.pry
    Boat.select(:name).limit(5)
  end

  def self.dinghy
    Boat.select(:name).where("length<20")
  end

  def self.ship
    Boat.select(:name).where("length>=20")
  end

  def self.last_three_alphabetically
    Boat.order('name DESC').limit(3)
  end

end
