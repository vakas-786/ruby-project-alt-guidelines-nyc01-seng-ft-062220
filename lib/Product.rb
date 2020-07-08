class Product < ActiveRecord::Base
    belongs_to :printer
    belongs_to :design 
end 