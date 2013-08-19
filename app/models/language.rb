class Language < ActiveRecord::Base
  attr_accessible :name

  has_many :onomas
  has_many :keys
end
