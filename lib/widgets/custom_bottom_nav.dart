import 'package:flutter/material.dart';
import '../core/theme.dart';

// Widget para la navegación inferior personalizada con curvas y botón flotante encapsulado
class CustomBottomNav extends StatelessWidget {
  const CustomBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    // Usamos Stack para sobreponer el botón "+" al fondo curvo
    return SizedBox(
      height: 90,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          // Fondo curvo
          CustomPaint(
            size: Size(MediaQuery.of(context).size.width, 65),
            painter: _BottomNavPainter(),
          ),
          // Íconos de navegación
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SizedBox(
              height: 65,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Item Home (Seleccionado)
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.home_outlined, // En el diseño real puede ser un ícono más exacto
                        color: AppColors.white,
                        size: 26,
                      ),
                      const SizedBox(height: 4),
                      Container(
                        width: 4,
                        height: 4,
                        decoration: const BoxDecoration(
                          color: AppColors.white,
                          shape: BoxShape.circle,
                        ),
                      )
                    ],
                  ),
                  const Icon(
                    Icons.person_outline,
                    color: AppColors.white,
                    size: 26,
                  ),
                  const SizedBox(width: 40), // Espacio para el FAB central
                  const Icon(
                    Icons.chat_bubble_outline,
                    color: AppColors.white,
                    size: 24,
                  ),
                  const Icon(
                    Icons.favorite_border,
                    color: AppColors.white,
                    size: 26,
                  ),
                ],
              ),
            ),
          ),
          // Botón "+" flotante central
          Positioned(
            bottom: 30, // Elevado sobre la barra
            child: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.4),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: const Center(
                child: Icon(
                  Icons.add,
                  color: AppColors.white,
                  size: 32,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Pintor personalizado para la curva suave en el centro
class _BottomNavPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = AppColors.primary
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, size.height); // Abajo izquierda
    path.lineTo(0, 0); // Arriba izquierda

    // Curva hasta el espacio para el botón central
    double center = size.width / 2;
    path.lineTo(center - 50, 0);
    
    // Curva que encapsula el centro (Bezier Curve)
    path.quadraticBezierTo(center - 35, 0, center - 35, 15);
    // Arco inferior del agujero central
    path.arcToPoint(
      Offset(center + 35, 15),
      radius: const Radius.circular(35),
      clockwise: false,
    );
    path.quadraticBezierTo(center + 35, 0, center + 50, 0);

    path.lineTo(size.width, 0); // Arriba derecha
    path.lineTo(size.width, size.height); // Abajo derecha

    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
