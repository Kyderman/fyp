class Cup < ActiveRecord::Base
  has_one :competition, as: :competition_format
end
