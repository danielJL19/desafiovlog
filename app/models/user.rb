class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #cadena de caracteres que son numerados, 0 y 1
  #0->normal_user
  #1->admin
  enum :role, [:normal_user, :admin]
end
