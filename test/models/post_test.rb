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
require "test_helper"

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
