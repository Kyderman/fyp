class Organisation < ActiveRecord::Base
  # has many users
  # has many owners... user with organiser role
  # has many teams... organisation id
  # has many competitions.... organisation id
end
