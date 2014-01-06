class ClientValTestClass < ActiveRecord::Base
  attr_accessible :name, :nickname, :bad, :password, :username
  
  validates_presence_of :bad, client: true
  validates_presence_of :name, client: true, message: "is required right now"
  validates_presence_of :nickname

  validates_format_of :password, client: true, with: /\A[^\s,]+\Z/, message: "no spaces or comma allowed"
  validates_length_of :username, minimum: 2, maximum: 10, client: true, message: "must be between 2 and 10 characters in length"
end

