class Onoma < ActiveRecord::Base
  attr_accessible :name, :language_id
  
  belongs_to :language
  has_many :links
  has_many :keys, :through => :links
end