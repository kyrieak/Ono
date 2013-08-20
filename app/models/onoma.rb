class Onoma < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  
  belongs_to :language
  has_many :links
  has_many :keys, :through => :links

  def self.attr_params
    [
      :id,
      :name,
      :language_attributes => [:id, :name]
    ]
  end
  
end