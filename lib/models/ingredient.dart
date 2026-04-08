// Modelo para los ingredientes seleccionables
class Ingredient {
  final String name;
  final String imageUrl;
  final bool isSelected;
  final bool isSide;

  Ingredient({
    required this.name,
    required this.imageUrl,
    this.isSelected = false,
    this.isSide = false,
  });
}

// Datos de prueba para personalización
List<Ingredient> mockToppings = [
  Ingredient(
    name: 'Tomato',
    imageUrl: 'https://images.unsplash.com/photo-1592924357228-91a4daadcfea?q=80&w=200&fit=crop',
    isSelected: true,
  ),
  Ingredient(
    name: 'Onions',
    imageUrl: 'https://images.unsplash.com/photo-1618512496248-a07ce83aa8cb?q=80&w=200&fit=crop',
    isSelected: false,
  ),
  Ingredient(
    name: 'Pickles',
    imageUrl: 'https://plus.unsplash.com/premium_photo-1662999478427-4ce57849e6f1?q=80&w=200&fit=crop',
    isSelected: false,
  ),
  Ingredient(
    name: 'Bacons',
    imageUrl: 'https://images.unsplash.com/photo-1606851094050-205fb0dce9fa?q=80&w=200&fit=crop',
    isSelected: false,
  ),
];

List<Ingredient> mockSides = [
  Ingredient(
    name: 'Fries',
    imageUrl: 'https://images.unsplash.com/photo-1576107222164-cd9bf424a56a?q=80&w=200&fit=crop',
    isSelected: true,
    isSide: true,
  ),
  Ingredient(
    name: 'Coleslaw',
    imageUrl: 'https://images.unsplash.com/photo-1597022091490-af9685e9e03d?q=80&w=200&fit=crop',
    isSelected: false,
    isSide: true,
  ),
  Ingredient(
    name: 'Salad',
    imageUrl: 'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?q=80&w=200&fit=crop',
    isSelected: false,
    isSide: true,
  ),
  Ingredient(
    name: 'Onion',
    imageUrl: 'https://images.unsplash.com/photo-1639024472658-0118eb3d0859?q=80&w=200&fit=crop', // Aros de cebolla aprox
    isSelected: false,
    isSide: true,
  ),
];
