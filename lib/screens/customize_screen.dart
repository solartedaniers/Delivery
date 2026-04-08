import 'package:flutter/material.dart';
import '../core/theme.dart';
import '../models/ingredient.dart';
import 'payment_screen.dart';

// Pantalla para personalizar la hamburguesa
class CustomizeScreen extends StatefulWidget {
  const CustomizeScreen({super.key});

  @override
  State<CustomizeScreen> createState() => _CustomizeScreenState();
}

class _CustomizeScreenState extends State<CustomizeScreen> {
  double spicyLevel = 0.3;
  int portion = 2;

  // Variables locales para gestionar seleccion (Mock simplificado)
  final List<Ingredient> _toppings = List.from(mockToppings);
  final List<Ingredient> _sides = List.from(mockSides);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            // AppBar 
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: AppColors.black),
                    onPressed: () => Navigator.pop(context),
                  ),
                  IconButton(
                    icon: const Icon(Icons.search, color: AppColors.black),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            
            // Contenido Escroleable
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Imagen "Voladora" y lado de texto (Customize Your Burger...)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Imagen de hamburguesa deconstruída simulada
                        Expanded(
                          flex: 5,
                          child: Container(
                            height: 250,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage('https://images.unsplash.com/photo-1550547660-d9450f859349?q=80&w=500&fit=crop'), // Placeholder, idealmente es transparente png
                                fit: BoxFit.contain, // simulate floating
                              ),
                            ),
                          ),
                        ),
                        // Controles derechos
                        Expanded(
                          flex: 4,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 10),
                                RichText(
                                  text: const TextSpan(
                                    style: TextStyle(
                                      color: AppColors.grey,
                                      fontSize: 13,
                                      height: 1.5,
                                    ),
                                    children: [
                                      TextSpan(
                                          text: 'Customize ',
                                          style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.black)),
                                      TextSpan(text: 'Your Burger to Your Tastes. Ultimate Experience'),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 30),
                                // Spicy Slider
                                const Text('Spicy', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                                const SizedBox(height: 5),
                                SliderTheme(
                                  data: SliderThemeData(
                                    trackHeight: 4,
                                    activeTrackColor: AppColors.primary,
                                    inactiveTrackColor: AppColors.lightGrey,
                                    thumbColor: AppColors.primary,
                                    overlayColor: AppColors.primary.withOpacity(0.2),
                                    thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6),
                                  ),
                                  child: Slider(
                                    value: spicyLevel,
                                    onChanged: (val) => setState(() => spicyLevel = val),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: const [
                                      Text('Mild', style: TextStyle(color: Colors.green, fontSize: 10)),
                                      Text('Hot', style: TextStyle(color: AppColors.primary, fontSize: 10)),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 20),
                                // Portion Selector
                                const Text('Portion', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    _buildSmallBtn(Icons.remove, () {
                                      if (portion > 1) setState(() => portion--);
                                    }),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                      child: Text('$portion', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                                    ),
                                    _buildSmallBtn(Icons.add, () => setState(() => portion++)),
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 30),

                    // Toppings Grid
                    const Text('Toppings', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    const SizedBox(height: 15),
                    _buildIngredientGrid(_toppings, (index) {
                      setState(() {
                         _toppings[index] = Ingredient(
                            name: _toppings[index].name,
                            imageUrl: _toppings[index].imageUrl,
                            isSelected: !_toppings[index].isSelected,
                            isSide: _toppings[index].isSide,
                         );
                      });
                    }),
                    
                    const SizedBox(height: 30),

                    // Side Options Grid
                    const Text('Side options', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    const SizedBox(height: 15),
                    _buildIngredientGrid(_sides, (index) {
                      setState(() {
                         _sides[index] = Ingredient(
                            name: _sides[index].name,
                            imageUrl: _sides[index].imageUrl,
                            isSelected: !_sides[index].isSelected,
                            isSide: _sides[index].isSide,
                         );
                      });
                    }),
                    
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
            
            // Footer (Total y Order Now)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              decoration: BoxDecoration(
                color: AppColors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    offset: const Offset(0, -5),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Total Section
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Total',
                        style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.black),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('\$', style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold, fontSize: 16)),
                          Text('16.49', style: TextStyle(color: AppColors.black, fontWeight: FontWeight.bold, fontSize: 24)),
                        ],
                      ),
                    ],
                  ),
                  // Order Now Btn (Red variants in setup? design shows Red button here)
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => const PaymentScreen()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 45),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      elevation: 0,
                    ),
                    child: const Text(
                      'ORDER NOW',
                      style: TextStyle(color: AppColors.white, fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget Builder para los cuadritos de ingredientes
  Widget _buildIngredientGrid(List<Ingredient> items, Function(int) onTap) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        childAspectRatio: 0.8, // Rectángulo alto
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return GestureDetector(
          onTap: () => onTap(index),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  spreadRadius: 1,
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                )
              ],
            ),
            child: Column(
              children: [
                // Imagen superior (Fondo blanco)
                Expanded(
                  flex: 3,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                    ),
                    child: Center(
                      child: Image.network(item.imageUrl, fit: BoxFit.contain), // Simulada
                    ),
                  ),
                ),
                // Botón inferior (Fondo marrón oscuro)
                Expanded(
                  flex: 2,
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: AppColors.darkBrown,
                      borderRadius: BorderRadius.vertical(bottom: Radius.circular(12)),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            item.name,
                            style: const TextStyle(color: AppColors.white, fontSize: 10),
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(width: 4),
                          // Circulito rojo de cross o add
                          Container(
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: item.isSelected ? AppColors.primary : Colors.transparent,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.add,
                              color: item.isSelected ? AppColors.white : Colors.transparent,
                              size: 10,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSmallBtn(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: AppColors.white, size: 16),
      ),
    );
  }
}
