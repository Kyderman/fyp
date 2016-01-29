class Organisation < ActiveRecord::Base
  # has many users
  has_many :users
  # has many owners... user with organiser role
  has_many :owners, -> { where(users: { role: 2 }) }

  # has many teams... organisation id
  # has many competitions.... organisation id
end
