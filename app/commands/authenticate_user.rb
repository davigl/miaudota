# frozen_string_literal: true

class AuthenticateUser
  prepend SimpleCommand

  attr_accessor :email, :password, :type_user

  def initialize(email, password, type_user)
    @email = email
    @password = password
    @type_user = type_user
  end

  def call
    JsonWebToken.encode(user_id: user.id) if user
  end

  private

  def user
    user = User.find_by_email(email)

    if @type_user.eql? ("shelter")
      return user if user&.authenticate(password).shelter.present?
    else
      return user if user&.authenticate(password).adopter.present?
    end

    errors.add :user_authentication, 'invalid credentials'
  end
end
