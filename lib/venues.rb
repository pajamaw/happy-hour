class Venue
  attr_accessor :name, :area, :hours, :description
  attr_reader :name, :area, :hours, :description

    @@all = []
  def initialize
    @@all << self
  end

  def self.all
    @@all 
  end

  def self.reset_all
    @@all.clear
  end
end