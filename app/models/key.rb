class Key < ActiveRecord::Base

  belongs_to :language
  has_many :links
  has_many :onoma, :through => :links

  def self.attr_params
    [
      :id,
      :word,
      :language_attributes => [:id, :name]
    ]
  end

end