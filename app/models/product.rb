# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  name        :string
#  description :string
#  visible     :boolean          default(TRUE)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Product < ApplicationRecord
  validates :name, presence: { message: "El nombre es requerido" }
  validates :description, presence: { message: "La description es requerida" }
  
  validates :name, length: { maximun:200, minimum:2 }



  has_many :product_categories
  has_many :categories, through: :product_categories
end
