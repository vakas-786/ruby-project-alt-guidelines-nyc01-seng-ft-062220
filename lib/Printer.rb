class Printer < ActiveRecord::Base
    has_many :product
    has_many :design, through: :product
end 