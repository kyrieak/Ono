class Link < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection

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
