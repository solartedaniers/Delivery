import 'package:flutter/material.dart';
import '../models/product.dart';
import '../core/theme.dart';

// Widget que muestra la información resumida de la hamburguesa
class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;

  const ProductCard({
    super.key,
    required this.product,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              spreadRadius: 2,
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Imagen del producto
              Expanded(
                child: Center(
                  child: Hero(
                    tag: product.id, // Para animación de transición
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        product.imageUrl,
                        fit: BoxFit.cover,
                        // Un placeholder para mientras carga
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: CircularProgressIndicator(
                              color: AppColors.primary,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              // Nombre
              Text(
                product.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: AppColors.black,
                ),
              ),
              // Marca o subtitulo
              Text(
                product.brand,
                style: const TextStyle(
                  color: AppColors.grey,
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 8),
              // Calificación y botón de favorito
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.star_rounded,
                        color: AppColors.orange,
                        size: 16,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        product.rating.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  const Icon(
                    Icons.favorite_border_rounded,
                    color: AppColors.black,
                    size: 20,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
