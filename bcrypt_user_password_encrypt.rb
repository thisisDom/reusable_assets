class User < ApplicationRecord
  include BCrypt

  def self.authenticate?(email, password)
    user = User.where('email = ? AND password_hash = ?', email, Password.create(password))
  end

  def password
    @password ||= Password.new(self.password_hash)
  end

  def password=(new_password)
    self.password_hash = Password.create(new_password)
  end

  def authenticate?(entered_password)
    self.password == entered_password
  end

end
