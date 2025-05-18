import Foundation


struct Product: Identifiable, Codable {
    var id = UUID()
    var name: String
    var image: String
    var description: String
    var type: String
    var price: Int
}


var productList = [
    Product(
        name: "Black Top",
        image: "IMG_0142",
        description: "Unleash your style with the perfect mix of edge and elegance. This top redefines comfort with a sleek design that’s ready to shine on the streets or at the party. Your statement piece awaits!",
        type: "Top",
        price: 5
    ),
    Product(
        name: "Jeans",
        image: "IMG_0143",
        description: "Step into timeless cool with jeans that fit like a dream. Designed for all-day comfort and effortless style, these are more than denim—they’re your wardrobe essential.",
        type: "Pant",
        price: 15
    ),
    Product(
        name: "Winter Sweater",
        image: "IMG_0183",
        description: "Wrap yourself in coziness with a sweater that doesn’t just keep you warm but also turns heads. Soft, stylish, and perfect for any occasion—your go-to layer for sweater weather.",
        type: "Jacket",
        price: 30
    ),
    Product(
        name: "Small Hand Bag",
        image: "IMG_0199",
        description: "Carry your world in style! This chic and versatile handbag is the ultimate blend of fashion and function—perfect for elevating your everyday or completing your night-out look.",
        type: "Bag",
        price: 30
    ),
    Product(
        name: "Fur Coat",
        image: "IMG_0194",
        description: "Turn up the luxury with a fur coat that commands attention. Sumptuously soft and effortlessly glamorous, this piece is your ultimate statement for cozy sophistication.",
        type: "Jacket",
        price: 30
    ),
    Product(
        name: "Coat",
        image: "IMG_0195",
        description: "Classic, sleek, and endlessly versatile. This coat is your trusted companion for braving the chill while looking effortlessly polished, no matter the occasion.",
        type: "Jacket",
        price: 30
    ),
    
    
    Product(
        name: "Sneakers",
        image: "IMG_0144",
        description: "These sneakers feature cutting-edge designs, premium materials, and cushioned soles to keep you moving in style all day long. Whether you're running errands or meeting friends for brunch, these sneakers will take you everywhere with ease and flair.",
        type: "Shoes",
        price: 30
    ),
    Product(
        name: "Hand Bag",
        image: "IMG_0151",
        description: "Elegance Meets Practicality \n our big handbags are the perfect blend of practicality and luxury. With spacious interiors designed to carry everything from your tablet to your makeup bag, these bags offer ample room without sacrificing style. Crafted from high-quality materials and available in a range of chic designs, these bags are a statement piece that will effortlessly elevate your outfit, whether you're heading to work or out on the town ",
        type: "Bag",
        price: 30
    ),
    Product(
        name: "Long Boots",
        image: "IMG_0185",
        description: "Embrace the colder months with our long boots, designed to add height, confidence, and warmth to your look. Whether you're pairing them with a cozy sweater dress or your favorite skinny jeans, these boots offer the perfect balance of style and practicality. With rich leather finishes, elegant designs, and sturdy soles, our long boots will keep you striding in style through every season.",
        type: "Shoes",
        price: 30
    ),
    Product(
        name: "Boots",
        image: "IMG_0186",
        description: "Add a touch of edge to any outfit with our stylish short boots. These versatile boots are the perfect combination of comfort and fashion. Ideal for transitioning between seasons, they pair seamlessly with everything from skirts to leggings, giving you the freedom to dress up or down. Crafted from premium materials and designed for all-day wear, these short boots are your go-to choice for effortless chic.",
        type: "Jacket",
        price: 30
    ),
    Product(
        name: "Bag",
        image: "IMG_0191",
        description: "For those moments when you want to carry only the essentials, our small handbags are the perfect companion. Sleek and sophisticated, these bags are designed to hold just what you need—your phone, cards, and a touch of lipstick—while offering a polished, refined look. Whether it's for a night out or a day of shopping, these small handbags add a pop of elegance to any outfit without weighing you down.",
        type: "Zara",
        price: 30
    ),
   
    Product(
        name: "Gloves",
        image: "IMG_0197",
        description: "Stay cozy and chic with our leather and fur winter gloves, the ultimate winter accessory. Crafted from soft, supple leather and lined with luxurious fur, these gloves provide warmth and comfort without compromising on style. Perfect for chilly mornings or snowy afternoons, they add a sophisticated touch to your winter wardrobe while keeping your hands toasty all season long. Whether you're sipping a hot cocoa or navigating the cold city streets, these gloves are your go-to for warmth with a dash of glamour.",
        type: "Zara",
        price: 30
    )
    
]
