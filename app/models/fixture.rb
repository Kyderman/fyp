class Fixture < ActiveRecord::Base
  has_many :scores
  has_many :teams, through: :score
  belongs_to :competition
end
