class Link < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection

  belongs_to :key
  belongs_to :onoma

  delegate :language, :to => :onoma

  accepts_nested_attributes_for :key
  accepts_nested_attributes_for :onoma

  validates :key, :presence => true
  validates :onoma, :presence => true

  def self.attr_params
    [
      :key_attributes => [:id, :word, :language_id],
      :onoma_attributes => [:id, :name, :language_id]
    ]
  end

  def duplicate?
    Link.where(:key_id => key, :onoma_id => onoma).count > 0
  end
  
end
