class Game < ApplicationRecord
  has_many :points

  validates :title, presence: true

  after_create do
    10.times do |n|
      10.times do |k|
        points.create(x: n + 1, y: k + 1)
      end
    end
  end
end
