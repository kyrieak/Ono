class Onoma < ActiveRecord::Base
  attr_accessible :name, :language_id
  
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