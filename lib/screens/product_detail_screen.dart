import 'package:flutter/material.dart';
import '../models/product.dart';
import '../core/theme.dart';

// Pantalla de detalle del producto
class ProductDetailScreen extends StatefulWidget {
  final Product product;

  const ProductDetailScreen({
    super.key,
    required this.product,
  });

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int portion = 2; // Valor inicial como en el mockup
  double spicyLevel = 0.3; // Valor inicial (Mild a Hot)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white, // Fondo blanco total para detalles
      body: SafeArea(
        child: Column(
          children: [
            // Header (Botones de Atrás y Búsqueda, sin SafeArea arriba para el Hero)
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
            
            // Contenido escroleable
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Imagen grande del producto
                      Center(
                        child: Hero(
                          tag: widget.product.id,
                          child: Container(
                            height: 250,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  spreadRadius: 2,
                                  blurRadius: 15,
                                  offset: const Offset(0, 10),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                widget.product.imageUrl,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      
                      // Título
                      Text(
                        '${widget.product.name} ${widget.product.brand}',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontSize: 26,
                            ),
                      ),
                      const SizedBox(height: 8),
                      
                      // Rating y Tiempo
                      Row(
                        children: [
                          const Icon(Icons.star_rounded, color: AppColors.orange, size: 20),
                          const SizedBox(width: 6),
                          Text(
                            '${widget.product.rating}',
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          const SizedBox(width: 8),
                          const Text('—', style: TextStyle(color: AppColors.grey)),
                          const SizedBox(width: 8),
                          Text(
                            '${widget.product.time} mins',
                            style: const TextStyle(color: AppColors.grey, fontSize: 16),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      
                      // Descripción
                      Text(
                        widget.product.description,
                        style: const TextStyle(
                          color: AppColors.grey,
                          height: 1.6, // Mayor espacio entre líneas para lectura
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 30),
                      
                      // Opciones interactivas: Spicy y Portion
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Slider de Picante
                          Expanded(
                            flex: 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Spicy',
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                                ),
                                const SizedBox(height: 8),
                                SliderTheme(
                                  data: SliderThemeData(
                                    trackHeight: 4,
                                    activeTrackColor: AppColors.primary,
                                    inactiveTrackColor: AppColors.lightGrey,
                                    thumbColor: AppColors.primary,
                                    overlayColor: AppColors.primary.withOpacity(0.2),
                                    thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8),
                                  ),
                                  child: Slider(
                                    value: spicyLevel,
                                    onChanged: (val) {
                                      setState(() => spicyLevel = val);
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: const [
                                      Text('Mild', style: TextStyle(color: Colors.green, fontSize: 12)),
                                      Text('Hot', style: TextStyle(color: AppColors.primary, fontSize: 12)),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(width: 20), // Separador
                          
                          // Control de Porciones
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Portion',
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                                ),
                                const SizedBox(height: 12),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    _buildPortionBtn(
                                      icon: Icons.remove,
                                      onTap: () {
                                        if (portion > 1) setState(() => portion--);
                                      },
                                    ),
                                    Text(
                                      '$portion',
                                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                    ),
                                    _buildPortionBtn(
                                      icon: Icons.add,
                                      onTap: () {
                                        setState(() => portion++);
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30), // Espacio al final
                    ],
                  ),
                ),
              ),
            ),
            
            // Área Inferior: Botón de Precio y "Order Now"
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
                children: [
                  // Botón de Precio
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 24),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary.withOpacity(0.3),
                          spreadRadius: 1,
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        )
                      ],
                    ),
                    child: Text(
                      '\$${widget.product.price.toStringAsFixed(2)}',
                      style: const TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  // Botón ORDER NOW
                  Expanded(
                    child: InkWell(
                      onTap: () {}, // Acción de orden
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        decoration: BoxDecoration(
                          color: AppColors.darkBrown, // Color oscuro del diseño
                          borderRadius: BorderRadius.circular(15),
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          'ORDER NOW',
                          style: TextStyle(
                            color: AppColors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
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

  // Widget auxiliar para los botones de + y - en "Portion"
  Widget _buildPortionBtn({required IconData icon, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withOpacity(0.3),
              blurRadius: 5,
              offset: const Offset(0, 3),
            )
          ],
        ),
        child: Icon(icon, color: AppColors.white, size: 20),
      ),
    );
  }
}
