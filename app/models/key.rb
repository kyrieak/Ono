class Key < ActiveRecord::Base
  attr_accessible :word, :language_id
  
  belongs_to :language
  has_many :links
  has_many :onoma, :through => :links
end