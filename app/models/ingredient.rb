# == Schema Information
#
# Table name: ingredients
#
#  id                 :integer          not null, primary key
#  name               :string(255)      not null
#  category           :string(255)      not null
#  created_at         :datetime
#  updated_at         :datetime
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  image_updated_at   :datetime
#

class Ingredient < ActiveRecord::Base
  CATEGORIES = %w( Protein Vegetables Fruit Dairy Grains\ &\ Legumes Other)

  validates :name, :category, presence: true
  validates :name, uniqueness: true

  has_many :ingredient_uses

  has_many :recipes, through: :ingredient_uses

  def self.categories
    CATEGORIES
  end
end
