require_relative 'crime_scene'
require_relative 'exceptions'
require 'net/http'
require 'json'

class KittenPolice

  def initialize(email)
    raise Exceptions::InvalidEmailError unless self.is_valid_email?(email)

    @email = email
  end



  private

  def is_valid_email?(email)
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    VALID_EMAIL_REGEX.match(email) ? true : false
  end

end

class
