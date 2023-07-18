# == Schema Information
#
# Table name: posts
#
#  id          :bigint           not null, primary key
#  name        :string
#  description :text
#  user_id     :bigint           not null
#  status      :integer          default(0)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Post < ApplicationRecord

  #validaciones
  validates :name, presence: true, uniqueness:true
  validates :description, presence: true
  
  #relaciones
  belongs_to :user

end
