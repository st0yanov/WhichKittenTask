require_relative 'crime_scene'
require_relative 'exceptions'
require 'net/http'
require 'json'

class KittenPolice

  def initialize(email)
    raise Exceptions::InvalidEmailError unless self.is_valid_email?(email)

    @email = email
    @directions = nil
  end

  def find_directions
    uri = URI("http://which-technical-exercise.herokuapp.com/api/#{@email}/directions")
    response = Net::HTTP.get_response(uri)
    return [] unless response.is_a?(Net::HTTPSuccess)
    @directions = JSON.parse(response.body)['directions']
  end

  def check_crime_scene
    crime_scene = CrimeScene.new(@directions)
    puts "Crime Scene Coordinates:"
    puts "x: #{crime_scene.x}"
    puts "y: #{crime_scene.y}"

    uri = URI("http://which-technical-exercise.herokuapp.com/api/#{@email}/location/#{crime_scene.x}/#{crime_scene.y}")
    response = Net::HTTP.get_response(uri)
    body = JSON.parse(response.body)
    return [] unless response.is_a?(Net::HTTPSuccess)
    puts body['message']
  end

  protected

  def is_valid_email?(email)
    /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.match(email) ? true : false
  end

end
