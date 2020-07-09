class Printer < ActiveRecord::Base
    has_many :products
    has_many :designs, through: :products

    # def self.new_printer
    #     puts "What is your printer's name?"
    #     printer_name = gets.chomp 

    #     if Printer.find_by(name: printer_name)
    #         puts "This printer is already connected!"
    #     else 
    #         Printer.create(name: printer_name)
    #     end 
    # end

    # def self.connect_to_printer 
    #     puts "Enter your printer's name"
    #     printer_name = gets.chomp 
    #     if Printer.find_by(name: printer_name) 
    #         Printer.find_by(name: printer_name)
    #     else 
    #         puts "This printer is not connected"
    #     end 
    # end 

end 