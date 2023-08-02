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

  has_one_attached :photo

  #validaciones
  validates :name, presence: true, uniqueness:true
  validates :description, presence: true
  
  #relaciones
  belongs_to :user
  has_many :comments, dependent: :destroy

  def self.ransackable_attributes(auth_object = nil)
    ["name"]
  end

end
