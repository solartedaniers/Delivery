import 'package:flutter/material.dart';
import '../models/product.dart';
import '../core/theme.dart';
import '../widgets/category_chip.dart';
import '../widgets/product_card.dart';
import '../widgets/custom_bottom_nav.dart';
import 'product_detail_screen.dart';

// Pantalla principal (Feed)
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedCategoryIndex = 0;
  final List<String> categories = ['All', 'Combos', 'Sliders', 'Classics'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomBottomNav(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              // Header: Logo y Avatar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Foodgo',
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                          color: AppColors.black,
                          fontSize: 38,
                        ),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: const DecorationImage(
                        image: NetworkImage(
                            'https://images.unsplash.com/photo-1494790108377-be9c29b29330?q=80&w=200&auto=format&fit=crop'), // Avatar de chica
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              // Subtitulo
              Text(
                'Order your favourite food!',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 16,
                      color: AppColors.grey.withOpacity(0.8),
                    ),
              ),
              const SizedBox(height: 24),
              // Barra de búsqueda y botón de filtro
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.04),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search',
                          hintStyle: TextStyle(
                            color: AppColors.grey.withOpacity(0.8),
                            fontWeight: FontWeight.w500,
                          ),
                          prefixIcon: const Icon(Icons.search, color: AppColors.black),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(vertical: 18),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Container(
                    width: 55,
                    height: 55,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary.withOpacity(0.3),
                          spreadRadius: 1,
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.tune, // Icono de ajustes / filtros
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              // Categorías (Filtros horizontales)
              SizedBox(
                height: 45,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return CategoryChip(
                      label: categories[index],
                      isSelected: _selectedCategoryIndex == index,
                      onTap: () {
                        setState(() {
                          _selectedCategoryIndex = index;
                        });
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 24),
              // Grid de Productos
              Expanded(
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Dos columnas
                    childAspectRatio: 0.75, // Altura un poco mayor que ancho
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemCount: mockProducts.length,
                  itemBuilder: (context, index) {
                    return ProductCard(
                      product: mockProducts[index],
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetailScreen(
                              product: mockProducts[index],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
