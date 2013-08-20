class Language < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection

  has_many :onomas
  has_many :keys

  validates :name, :presence => true
  validates :name, :uniqueness => true
end
