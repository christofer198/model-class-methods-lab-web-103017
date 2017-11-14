require 'pry'
class Captain < ActiveRecord::Base
  has_many :boats
  def self.catamaran_operators
    Boat.joins(:classifications).group('captain_id').select('ca')
    binding.pry
  end
end
