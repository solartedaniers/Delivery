// Modelo de datos para los productos (Hamburguesas)
class Product {
  final String id;
  final String name;
  final String brand;
  final double rating;
  final int time;
  final String description;
  final double price;
  final String imageUrl;

  Product({
    required this.id,
    required this.name,
    required this.brand,
    required this.rating,
    required this.time,
    required this.description,
    required this.price,
    required this.imageUrl,
  });
}

// Datos de prueba (Mock Data)
List<Product> mockProducts = [
  Product(
    id: '1',
    name: 'Cheeseburger',
    brand: "Wendy's Burger",
    rating: 4.9,
    time: 26,
    description: "The Cheeseburger Wendy's Burger is a classic fast food burger that packs a punch of flavor in every bite. Made with a juicy beef patty cooked to perfection, it's topped with melted American cheese, crispy lettuce, ripe tomato, and crunchy pickles.",
    price: 8.24,
    // Usamos una imagen de muestra similar
    imageUrl: 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?q=80&w=600&auto=format&fit=crop',
  ),
  Product(
    id: '2',
    name: 'Hamburger',
    brand: 'Veggie Burger',
    rating: 4.8,
    time: 14,
    description: "Enjoy our delicious Hamburger Veggie Burger, made with a savory blend of fresh vegetables and herbs, topped with crisp lettuce, juicy tomatoes, and tangy pickles, all served on a soft, toasted bun.",
    price: 9.99,
    imageUrl: 'https://images.unsplash.com/photo-1550547660-d9450f859349?q=80&w=600&auto=format&fit=crop',
  ),
  Product(
    id: '3',
    name: 'Hamburger',
    brand: 'Chicken Burger',
    rating: 4.6,
    time: 42,
    description: "Our chicken burger is a delicious and healthier alternative to traditional beef burgers, perfect for those looking for a lighter meal option. Try it today and experience the mouth-watering flavors of our Hamburger Chicken Burger!",
    price: 12.48,
    imageUrl: 'https://images.unsplash.com/photo-1606755962773-d324e0a13086?q=80&w=600&auto=format&fit=crop',
  ),
  Product(
    id: '4',
    name: 'Hamburger',
    brand: 'Fried Chicken Burger',
    rating: 4.5,
    time: 30,
    description: "Crispy fried chicken breast topped with fresh lettuce, mayo and pickles on a toasted brioche bun.",
    price: 11.20,
    imageUrl: 'https://images.unsplash.com/photo-1615719413546-198b25453f85?q=80&w=600&auto=format&fit=crop',
  ),
];
