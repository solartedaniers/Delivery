import 'package:flutter/material.dart';
import '../core/theme.dart';
import 'payment_screen.dart'; // Solo como nav utilitaria

// Pantalla de Perfil (Profile Screen)
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary, // Fondo principal será cubierto en parte 
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            // Top Bar (Rojo intenso)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: AppColors.white),
                    onPressed: () => Navigator.pop(context),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                  IconButton(
                    icon: const Icon(Icons.settings, color: AppColors.white),
                    onPressed: () {},
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                ],
              ),
            ),
            
            // Sección combinada
            Expanded(
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  // Aquí se visualiza como unas "hamburguesas naranjas" en el fondo rojo de las esquinas en tu imagen,
                  // Lo simulamos con unos elementos o lo dejamos rojo puro que se ve elegante.
                  
                  // Forma blanca inferior (ocupa el resto de la pantalla)
                  Container(
                    margin: const EdgeInsets.only(top: 60), // Margen para dejar que asome el avatar
                    decoration: const BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
                    ),
                    child: ListView(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      children: [
                        const SizedBox(height: 70), // Espacio para el avatar
                        
                        // Campos del perfil anidados (Visualmente read only como el diseño)
                        _buildProfileField('Name', 'Sophia Patel'),
                        _buildProfileField('Email', 'sophiapatel@gmail.com'),
                        _buildProfileField('Delivery address', '123 Main St Apartment 4A,New York, NY'),
                        _buildProfileField('Password', '●●●●●●●●●', suffixIcon: Icons.lock_outline),
                        
                        const SizedBox(height: 20),
                        const Divider(color: AppColors.lightGrey, thickness: 1),
                        const SizedBox(height: 10),
                        
                        // Menús de la lista
                        _buildListMenu('Payment Details', context),
                        _buildListMenu('Order history', context),
                        
                        const SizedBox(height: 40),
                        
                        // Botones de Editar Perfil y Logout
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton.icon(
                                onPressed: () {},
                                icon: const Icon(Icons.edit_square, color: AppColors.white, size: 20),
                                label: const Text('Edit Profile', style: TextStyle(color: AppColors.white)),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.darkBrown,
                                  padding: const EdgeInsets.symmetric(vertical: 16),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: OutlinedButton.icon(
                                onPressed: () {},
                                icon: const Icon(Icons.logout, color: AppColors.primary, size: 20),
                                label: const Text('Log out', style: TextStyle(color: AppColors.primary)),
                                style: OutlinedButton.styleFrom(
                                  side: const BorderSide(color: AppColors.primary, width: 1.5),
                                  padding: const EdgeInsets.symmetric(vertical: 16),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),

                  // Avatar en el centro (Superpuesto)
                  Positioned(
                    top: 10,
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.primary.withOpacity(0.5),
                            blurRadius: 15,
                            offset: const Offset(0, 5),
                          )
                        ],
                        image: const DecorationImage(
                          image: NetworkImage('https://images.unsplash.com/photo-1494790108377-be9c29b29330?q=80&w=300&fit=crop'), // Avatar chica
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget para el campo de input simulado del perfil
  Widget _buildProfileField(String label, String value, {IconData? suffixIcon}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.lightGrey),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    value,
                    style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.black, fontSize: 14),
                  ),
                ),
                if (suffixIcon != null) 
                  Icon(suffixIcon, color: AppColors.grey, size: 16),
              ],
            ),
          ),
          // Etiqueta flotante
          Positioned(
            left: 12,
            top: -8,
            child: Container(
              color: AppColors.white,
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Text(
                label,
                style: const TextStyle(color: AppColors.grey, fontSize: 12),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildListMenu(String title, BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(title, style: const TextStyle(color: AppColors.grey, fontSize: 16)),
      trailing: const Icon(Icons.chevron_right, color: AppColors.grey),
      onTap: () {
        if (title == 'Payment Details') {
          // Utilidad simple para ir al Payment Screen
           Navigator.push(context, MaterialPageRoute(builder: (_) => const PaymentScreen()));
        }
      },
    );
  }
}
