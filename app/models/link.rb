class Link < ActiveRecord::Base
  attr_accessible :key_id, :onoma_id

  belongs_to :key
  belongs_to :onoma
  belongs_to :language, :through => :onoma
end
