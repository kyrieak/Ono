class Key < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  validate :unique_attributes

  belongs_to :language
  has_many :links
  has_many :onoma, :through => :links

  validates :word, :presence => true

  def self.attr_params
    [
      :id,
      :word,
      :language_attributes => [:id, :name]
    ]
  end

  def unique_attributes
    if Key.where({ :word => word, :language => language }).count > 0
      errors.add(:word, "#{word} is already in our #{language.name} dictionary")
    end
  end

end