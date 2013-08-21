class Onoma < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  
  belongs_to :language
  has_many :links
  has_many :keys, :through => :links

  accepts_nested_attributes_for :language

  validates :name, :presence => true
  validates :language_id, :presence => true

  def self.attr_params
    [
      :id,
      :name,
      :language_attributes => [:id, :name]
    ]
  end

  def duplicate?
    Onoma.where(:name => name, :language_id => language_id).count > 0
  end
  
end