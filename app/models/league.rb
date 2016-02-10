class League < ActiveRecord::Base
  has_one :competition, as: :competition_format
  accepts_nested_attributes_for :competition
end
