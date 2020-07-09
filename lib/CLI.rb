class CommandLineInterface 

    #The CLI messed up file is where I struggled on the old format and changed it to this one.
    #That file also contains the sources that helped me 

    #place reader for the printer since it will be responsible for grabbing the id's for the other classes later on. 
    #no actions are possible without connecting to a printer 
    attr_reader :printer 

    def run
        @prompt = TTY::Prompt.new
        puts "\n\n===================="
        puts "3D Printing!"
        puts "========================"
        puts "3D Printer Status: Ready"
        puts "========================"
        while true 
            main_menu
        end 
    end 

    def main_menu
        choices = ["Connect/Add New Printer", "Print a 3D model", "Update 3D model", "Search for printed models", "Delete 3D Printer", "EXIT"]
        #prompt enum will allow the user to select any of the options by entering the number of the option which will take them to a method
        #that will carry out the task
        choice = @prompt.enum_select("Select an option to begin:", choices)
        if choice == "Setup/Connect to Printer"
            connect 
        elsif choice == "Print a 3D model"
            print_model 
        elsif choice == "Update 3D model"
            update_model 
        elsif choice == "View printed models"
            design_search
        elsif choice == "Delete 3D Printer"
            delete_printer 
        elsif choice == "EXIT"
            puts "Have a nice day!"
            exit 
        end
    end

        def connect 
            choice = @prompt.enum_select("Set up your printer to begin:", ["Connect", "Add New"])
            #here the user will have to connect by entering a printers name and .chomp will take in the string and search for a corresponding name
            if choice == "Connect"
                puts "Enter the printer's name"
                name = gets.chomp 
                if Printer.find_by(name: name)
                    #placed a @printer = to set the instance of the printer equal to the name entered
                @printer = Printer.find_by(name: name)
                puts "The printer #{name} has been connected"
                else puts "This printer is not available try adding a new one"
                end 
            elsif choice == "Add New"
                name = nil 
                puts "Enter the name of the new printer"
                until Printer.find_by(name: name)
                    name = gets.chomp
                    if Printer.find_by(name: name)
                        #if the name set to this printer is already the inputted name it will return this string and name will be set nil
                        puts "This printer is already connected. Please enter a new device"
                        name = nil 
                    else 
                        puts "Printer #{name} is connected!"
                        #make sure duplicate printers are not made using find_or_create
                        @printer = Printer.find_or_create_by(name: name)
                        #sleep delays the output to give a better aesthetic 
                        sleep 2 
                    end 
                end 
            end 
        end 

        def print_model
                puts "Enter the name of the 3D model you would like to print"
                design_name = gets.chomp 
                #this takes in the name of the design file being printed
                designz = Design.find_or_create_by(name: design_name)
                #then it is set equal to the instance of the design
                if Product.find_by(design_id: designz, printer_id: self.printer.id)
                    #then the product will take search for the design by using the id's of the printer and design which are attributed to
                    #the product
                    puts "This model has already been printed, choose a different file"
                    sleep 2 
                    return 
                else 
                    choices = ["Toy car", "Knife", "Return to Main Menu"]
                    choices = @prompt.eunum_select("Choose an object to print", choices)
                    if choice == "Toy car"
                        toy_car = Product.new(printer_id: self.printer.id, design_id: designz.id , material: plastic)
                    elsif choice == "Knife"
                        knife = Product.new()
                    elsif choice == "Return to Main Menu"
                        puts "Wait one moment please"
                        sleep 2 
                        return 
                    end 
                end
        end
        
        def design_search 
            choices = []
            Product.all.each do |print_design|
                design = Design.find_by(id: product.design_id)
                printer = Printer.find_by(id: product.design_id)
                choices << "#{design.name}"
            end 

            choice = @prompt.enum_select("Please select 3D model to view", choices.uniq.sort)
            design_selected = Design.find_by(name: choice) 
            product = Product.where(design_id: design_selected.id)
            product.each do |printed|
                printing = Printer.find_by(id: printed.printer_id)
                puts "#{product.name} printed..."
                puts "Name: #{printed.name}"
                puts "Material #{printed.material}"
            end 
        end

        def update_model 
            choices = []
                if Product.find_by(printer_id: self.printer.id)
                    printer_models = Product.where(printer_id: self.printer.id)
                    printer_models.each do |review|
                        printer_design = Design.find_by(id: product.design_id)
                        choices << "#{printer_design.name}"
                    end 
                    choice = @prompt.enum_select("List of all models. Select which one you want to edit")
                    chosen_model = Design.find_by(name: choice)
                    next_choice = @prompt.enum_select("Do you want to Update or delete this model?", ["Update", "Delete", "Cancel"])
                    if next_choice == "Update"
                        selected_product = Product.where(printer_id: self.printer.id, design_id: chosen_model)
                        selected_product = selected_product[0]
                        puts "The material is #{selected_product.material} what updates would you like to make?"
                        new_material = gets.chomp 
                        selected_product.update(material: new_material)
                    elsif selection == "Cancel"
                        puts "Returning to the Main Menu"
                        sleep 2 
                        main_menu
                    end 
                elsif next_choice == "Delete"
                    delete_model = Product.where(printer_id: printer.self.id, design_id: chosen_model.id)[0]
                    delete_model.destroy
                    puts "This 3D model has been removed"
                    sleep 2 
                elsif next_choice == "Cancel"
                    puts "Please wait one moment"
                    sleep 2 
                    return 
                end  
                return 
            
        end

        def delete_printer 
                choice = @prompt.enum_select("Do you want to disconnect from this printer?", ["Yes", "No"])
                if choice == "Yes"
                    disconnect = Printer.find_by(id: self.printer.id)[0]
                    disconnect.destroy 
                    delete_products = Product.where(printer_id: self.printer.id)[0]
                    if delete_products
                        delete_products.destroy 
                        exit 
                    end 
                elsif choice == "No"
                    return 
                end 
             
        end 
     
    
    
 end
        
        
        

        
