# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  role                   :integer          default("normal_user")
#  name                   :string
#  lastName               :string
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #cadena de caracteres que son numerados, 0 y 1
  #0->normal_user
  #1->admin
  enum :role, [:normal_user, :admin]

  #relaciones
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
end
