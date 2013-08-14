class Key < ActiveRecord::Base
  has_many :links
  has_many :onoma, :through => :links
end