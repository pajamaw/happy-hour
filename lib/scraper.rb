require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './venues.rb'


class Scraper

  def get_page
    doc = Nokogiri::HTML(open("http://www.nyhappyhours.com/index.phtml"))
  end

  def get_venues
    self.get_page.css("div.col-lg-9.listings > div")
  end
##body > div.container > form > div:nth-child(5) > div.col-lg-9.listings > div:nth-child(1) > div > div > div > h3 > a > strong  

#body > div.container > form > div:nth-child(5) > div.col-lg-9.listings > div


def assign_values
    get_venues.each do |post|
      venue = Venue.new
      venue.name = post.css("h3 > a").text
      venue.area = post.css("p:eq(1)").text
      venue.hours = post.css("p:eq(2)").text
      venue.description = post.css("p:eq(4)").text
      binding.pry
    end
  end

  def print_results
    self.assign_values
    Venue.all.each do |result|
      if result.name
        puts "#{venue.name}"
        puts "#{venue.area}"
        puts "#{venue.hours}"
        puts "#{venue.description}"
      end
    end
  end
end

Scraper.new.print_results
