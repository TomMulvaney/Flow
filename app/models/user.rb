require 'bcrypt'

class User < ApplicationRecord
  # users.password_hash in the database is a :string
  include BCrypt

  attr_accessor :password

  attr_accessible :username, :email, :password, :password_confirmation

  EMAIL_REGEX = /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\z/i

  validates :username, presence: true, uniqueness: true, length: { maximum: 30 }
  validates :email, presence: true, uniqueness: true, format: EMAIL_REGEX
  #validates :hashed_password, presence: true, uniqueness: true
  validates :is_admin, inclusion: { in: [true, false], message: "%{value} is not valid for is_admin boolean" }

  validates :password, confirmation: true #password_confirmation attr
  validates_length_of :password, in: 6..20, on: :create

  before_save :encrypt_password
  after_save :clear_password

  def encrypt_password
    if password.present?
      self.salt = BCrypt::Engine.generate_salt
      self.encrypted_password = BCrypt::Engine.hash_secret(password, salt)
    end
  end

  def clear_password
    self.password = nil
  end
end
