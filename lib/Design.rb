class Design < ActiveRecord::Base
    has_many :products
    has_many :printers, through: :products    
end 