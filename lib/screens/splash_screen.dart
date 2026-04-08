import 'package:flutter/material.dart';
import 'home_screen.dart';
import '../core/theme.dart';

// Pantalla de carga animada (Splash)
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navegar a Home después de 3 segundos
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const HomeScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFF5260), // Rojo claro arriba
              AppColors.primary, // Rojo principal abajo
            ],
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Logo de Foodgo en el centro
            Text(
              'Foodgo',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            
            // Imagen de hamburguesas en la parte inferior simulada
            Positioned(
              bottom: 0,
              left: -20, // Sobresaliendo un poco a la izquierda
              child: SizedBox(
                width: 250,
                // Usamos un placeholder de internet para simular la hamburguesa inferior.
                // Idealmente aquí va el asset.
                child: Image.network(
                  'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?q=80&w=600&auto=format&fit=crop', // Hamburger similar
                  fit: BoxFit.contain,
                  color: Colors.white.withOpacity(0.0), // Hack para mantener el espacio si no se ve bien sin fondo, 
                  colorBlendMode: BlendMode.dst,
                  loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return const SizedBox.shrink(); // Ocultamos mientras carga
                  },
                  errorBuilder: (context, error, stackTrace) => const SizedBox(),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                     image: NetworkImage('https://images.unsplash.com/photo-1550547660-d9450f859349?q=80&w=400&fit=crop'),
                     fit: BoxFit.cover,
                  ),
                  shape: BoxShape.circle, // Cortamos circular para simular mejor
                  border: Border.all(color: Colors.transparent),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
