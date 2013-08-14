class Onoma < ActiveRecord::Base
  has_many :links
  has_many :keys, :through => :links
end