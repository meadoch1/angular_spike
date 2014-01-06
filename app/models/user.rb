class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :first_name, :last_name, :username, :last4ssn, :dob

  validates_presence_of :username, :email, client: true, message: "This field is required."
  validates_presence_of :password, :password_confirmation, client: true, message: "This field is required.", on: :create
  validates_format_of :username, with: /\A[^\s,]+\Z/, client: true, message: "Username cannot contain any spaces or commas."
  validates_length_of :username, minimum: 6, maximum: 50, client: true, message: "Username must be between 6 and 50 characters in length."
  validates_length_of :password, minimum: 8, client: true, message: "Password must be at least 8 characters in length.", on: :create
  validates_format_of :password, with: /\A(?=.*[0-9])(?=.*[A-Z])(?=.*[a-z])([^\s,]+)\Z/, client: true, message: "Password must include at least one number, one uppercase letter, one lowercase letter, and cannot contain spaces or commas.", on: :create
  
  validates_presence_of :last_name, :dob, :last4ssn, on: :update, client: true, message: "This field is required"
  validates_format_of :last4ssn, on: :update, with: /\A\d{4}\Z/, client: true, message: "This field required 4 digits. eg., 1234."
end
