#source:https://medium.com/@reireynoso/tty-prompt-select-for-handling-user-inputs-aed13f46c8bc
#source:https://medium.com/@bellex0/beautify-your-command-line-project-with-tty-gems-4a563948b23a
#source:https://medium.com/@sachafrosell/tty-a-ruby-terminal-apps-toolkit-ba66f67ca667
#^above articles provided guidance for how I designed the CLI
#require 'pry'
 

#     attr_accessor :printer, :prompt, :design, :product

#     def initialize()
#         @prompt = TTY::Prompt.new(active_color: :magenta)
#         # @spinner = TTY::Spinner.new("[:spinner] Deleting ...", format: :pulse_2)
#         # @font = TTY::Font.new(:starwars)
#     end 
    
#     def greeting
#         puts "Welcome to ..."
#         puts "3D Printing"
#         prompt.select ("What would you like to do today?") do |menu|
#             menu.choice "Register a new printer", -> { Printer.new_printer }
#             menu.choice "Connect to a new printer", -> { Printer.connect_to_printer }
#     end 
# end 

#     def main_menu 
#         system "clear"
#         self.printer.reload
#         puts "Welcome, #{self.printer.name} is ready to print!"
#         prompt.select("What would you like to do today?") do |menu|
#             menu.choice "Print a new 3D model", -> { self.print_product }
#             menu.choice "Edit a 3D model", -> { self.update_design }
#             menu.choice "Delete a 3D model", -> { self.delete_design }
#             menu.choice "Find printed models", -> { self.product_search}
#             menu.choice "Exit", -> { self.aborting }  
#         end 
#     end 

#     def print_product
#         puts "What is the model's name?"
#         design_name = gets.chomp 
#         puts "What material does the 3D Model require?"
#         material_type = gets.chomp 
#         puts "What is the file's size?"
#         file_size = gets.chomp.to_i 
#         new_design = Design.new(name: "#{design_name}", material: "#{material_type}", size: "#{file_size}")
#         new_product = Product.new(printer_id: self.printer.id, design_id: new_design.id, material: "#{material_type}")
#         puts "Your model has been printed"
#         #get rid of material from Product update migrate
#         #puts drawing ASCII after series of puts saying printing noises and printing in progress
#         #puts empty spaces to delay printing of image
#         self.main_menu
#     end 

#     def update_design
#         puts "Enter new 3D model name"
#         edit_design_name = gets.chomp 
#         updated_design = Design.find_by(name: edit_design_name).id
#         puts "Enter new material here"
#         edit_design_material = gets.chomp 
#         Design.update(material: edit_design_material)
#         puts "Congratulations your model has been updated"
#         self.main_menu
#     end 

#     def delete_design 
#         puts "Enter the name of the design to delete"
#         design_name = gets.chomp 
#         design_name = Design.find_by(name: "#{design_name}")
#         if design_name 
#             design_name.destroy 
#             puts "\n" 
#             puts " ============================== "
#             prompt.select ("Return to Main Menu") do |menu|
#                 menu.choice "Main Menu", -> { self.main_menu }
#             end 
#         else 
#             puts "#{design_name} doesn't exist"
#             self.main_menu 
#         end
#     end 
# #need to fix delete method 
#     # def delete_design
#     #     all_designs = self.printer.designs.each do |design_queue|
#     #         puts design_queue.list
#     #         if all_designs == [] 
#     #             puts "No 3D models present"
#     #             self.main_menu
#     #         else 
#     #             puts "Enter the name of the model you would like to delete"
#     #             garbage_design = gets.chomp 
#     #             deleted_design = Design.find_by(name: garbage_design) 
#     #             deleted_design.destroy 
#     #             # spinner.auto_spin
#     #             # sleep(2)
#     #             # spinner.stop("Deleted")
#     #         end
#     #     end
#     # end 

#     def product_search
#         puts "Enter the name of the 3D model"
#         three_d_model_name = gets.chomp 
#         puts "Enter the material of the printed model"
#         material_model = gets.chomp 
#         searching = Product.find_by(name: three_d_model_name, material: material_model)   
#         self.main_menu
#     end 

#     def aborting 
#         puts "Exiting"
#         puts "Have a nice day!"
#     end 




 
