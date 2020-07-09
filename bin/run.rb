require_relative '../config/environment'
require 'pry'
cli = CommandLineInterface.new()
printer = cli.run()

cli.printer = printer
cli.main_menu






# cli.printer = printer 
# cli.main_menu 


