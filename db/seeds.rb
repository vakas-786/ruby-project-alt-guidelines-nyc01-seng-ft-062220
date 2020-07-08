makerbot = Printer.create(name: "MakerBot")
xyz = Printer.create(name: "XYZprinting")

p1 = Product.create(material: "wood")
p2 = Product.create(material: "plastic")

d1 = Design.create(name: "toy", :material: "plastic", size: 12)