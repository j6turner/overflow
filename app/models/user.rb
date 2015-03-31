class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :questions
  has_many :responses

  attr_accessor :password
  validates_confirmation_of :password
  validates :email, :presence => true
  validates :name, :presence => true
  validates :password, :presence => true
  before_save :encrypt_password
  after_create :send_welcome_message

  def send_welcome_message
    ScienceMailer.signup_confirmation(self).deliver
  end

  def encrypt_password
    self.password_salt = BCrypt::Engine.generate_salt
    self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
  end

  def self.authenticate(email, password)
    user = User.where(email: email).first
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
end
