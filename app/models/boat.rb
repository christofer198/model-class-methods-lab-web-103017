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

  def self.without_a_captain
    #binding.pry
    Boat.where(:captain_id => nil)
  end

  def self.sailboats
    #binding.pry
    Boat.joins(:classifications).where("classifications.name = 'Sailboat'")
  end

  def

end
