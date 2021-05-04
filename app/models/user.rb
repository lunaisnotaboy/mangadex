# frozen_string_literal: true

class User < ApplicationRecord
  attr_writer :login

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :trackable

  def self.find_for_database_authentication(warden_condition)
    conditions = warden_condition.dup
    login = conditions.delete(:login)
    where(conditions).where(
      ['lower(username) = :value OR lower(email) = :value',
       { value: login.strip.downcase }]
    ).first
  end

  def login
    @login || username || email
  end

  validates :username, presence: true, uniqueness: { case_sensitive: false }

  # only allow letter, number, underscore and punctuation.
  validates :username, format: { with: /^[a-zA-Z0-9_.]*$/, multiline: true }

  has_many :chapters
end
