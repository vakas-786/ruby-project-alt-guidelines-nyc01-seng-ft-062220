class Design < ActiveRecord::Base
    has_many :product
    has_many :printer, through: :product
end 