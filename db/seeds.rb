Printer.destroy_all
Product.destroy_all 
Design.destroy_all

xyz = Printer.create(name: "XYZprinting")

d1 = Design.create(name: "Toy", material: "plastic", size: 12)
d2 = Design.create(name: "Cup", material: "plastic", size: 8) 
d3 = Design.create(name: "Star", material: "wood", size: 14)

star = Product.create(printer:xyz, design:d3, material: "wood")
cup = Product.create(printer:xyz, design:d2, material: "plastic")
toy = Product.create(printer:xyz, design:d1, material: "plastic")

