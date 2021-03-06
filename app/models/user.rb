require 'openssl'

class User < ApplicationRecord
  ITERATIONS = 20000
  DIGEST = OpenSSL::Digest::SHA256.new

  has_many :questions

  validates :email, :username, presence: true
  validates :email, :username, uniqueness: true
  validates :email, 'valid_email_2/email': true
  validates :username, length: { maximum: 40 }
  validates :username, format: { with: /\A\w+\Z/,
                                 message: "only allows letters, numbers or _" }

  attr_accessor :password

  validates_presence_of :password, on: :create
  validates_confirmation_of :password

  before_validation :to_downcase
  before_save :encrypt_password

  def to_downcase
    self.username.downcase!
  end

  def encrypt_password
    if self.password.present?
      self.password_salt = User.hash_to_string(OpenSSL::Random.random_bytes(16))
      self.password_hash = User.hash_to_string(
        OpenSSL::PKCS5.pbkdf2_hmac(password, password_salt, ITERATIONS, DIGEST.length, DIGEST)
      )
    end
  end

  def self.hash_to_string(password_hash)
    password_hash.unpack('H*')[0]
  end

  def self.authenticate(email, password)
    # Finding user by email
    user = find_by(email: email)

    # If none is found return nil
    return nil unless user.present?

    # Making hash of the password that is transfered
    hashed_password = User.hash_to_string(
      OpenSSL::PKCS5.pbkdf2_hmac(
        password, user.password_salt, ITERATIONS, DIGEST.length, DIGEST
      )
    )

    # Compare password_hash
    return user if user.password_hash == hashed_password

    # If no, return nil
    nil
  end
end
