class User < ApplicationRecord
  attr_writer :login

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  def self.find_for_database_authentication warden_condition
    conditions = warden_condition.dup
    login = conditions.delete(:login)
    where(conditions).where(
      ["lower(username) = :value OR lower(email) = :value",
      { value: login.strip.downcase}]).first
  end
  
  def login
    @login || self.username || self.email
  end

  validates :username, presence: true, uniqueness: { case_sensitive: false }

  # only allow letter, number, underscore and punctuation.
  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true
end
