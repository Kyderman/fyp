class Score < ActiveRecord::Base
  belongs_to :fixture
  belongs_to :team
end
