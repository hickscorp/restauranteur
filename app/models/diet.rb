class Diet < ActiveRecord::Base
  belongs_to    :user
  has_many      :courses,       dependent: :destroy
  has_many      :meals,         dependent: :destroy
end
