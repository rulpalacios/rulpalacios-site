# == Schema Information
#
# Table name: courses
#
#  id          :bigint           not null, primary key
#  cost        :float
#  course_type :integer
#  description :text
#  status      :integer
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Course < ApplicationRecord
  has_many :lessons, dependent: :destroy

  enum course_type: %i[free premium].freeze
  enum status: %i[draft premiere published].freeze

  accepts_nested_attributes_for :lessons, allow_destroy: true
end
