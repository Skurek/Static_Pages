# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base

  has_secure_password       #wbudowana funkcja w rails sprawdzajaca zgodnosc hasel
  # haslo w bazie jest przechowywane w postaci zahashowanej przy uzyciu funckji bcrypt

  before_save { |user| user.email = email.downcase } #zapis do bazy danych email malymi literami

  before_save :create_remember_token #token sluzacy do zapamietania sesji w bazie

  validates :name, presence: true, length: {maximum: 20}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensetive: false}
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  private

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64           # stworzenie losowego tokenu dla uzytkownika
  end
end
