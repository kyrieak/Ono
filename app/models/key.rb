class Key < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection

  belongs_to :language
  has_many :links
  has_many :onoma, :through => :links

  accepts_nested_attributes_for :language

  validates :word, :presence => true
  validates :language_id, :presence => true

  def self.attr_params
    [
      :id,
      :word,
      :language_attributes => [:id, :name]
    ]
  end

  def duplicate?
    Key.where(:word => word, :language_id => language_id).count > 0
  end

end