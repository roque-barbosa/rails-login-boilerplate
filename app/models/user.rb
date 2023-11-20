class User < ApplicationRecord
  # Make model use the revocation strategy 
  include Devise::JWT::RevocationStrategies::JTIMatcher

  enum role:  %i(client worker admin)
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self
end
