class Link < ActiveRecord::Base
  attr_accessible :key_id, :onoma_id

  belongs_to :key
  belongs_to :onoma
  belongs_to :language, :through => :onoma

  def self.attr_params
    [
      :key_attributes => Key.attr_params,
      :onoma_attributes => Onoma.attr_params
    ]
  end
  
end
