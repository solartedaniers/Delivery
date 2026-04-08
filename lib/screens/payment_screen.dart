import 'package:flutter/material.dart';
import '../core/theme.dart';
import '../widgets/success_popup.dart';

// Pantalla de pago
class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int selectedCard = 0; // 0 for Mastercard, 1 for Visa
  bool saveCard = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background, // Gris claro del diseño
      body: SafeArea(
        child: Column(
          children: [
            // AppBar (Botón Atrás, Título Payment y Lupa)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                   // Título centrado "Payment" puede ir o no, el diseño muestra "Payment" arriba en la captura, pero parece un encabezado del OS o Title, vamos a ponerlo alineado a la izquierda según veo.
                   Align(
                     alignment: Alignment.topLeft,
                     child: Text(
                        'Payment',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.grey.withOpacity(0.5)),
                     ),
                   ),
                   const SizedBox(height: 50),
                ],
              ),
            ),
            
            // Header con botones reales
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: AppColors.black),
                    onPressed: () => Navigator.pop(context),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                  IconButton(
                    icon: const Icon(Icons.search, color: AppColors.black),
                    onPressed: () {},
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Order Summary
                    const Text('Order summary', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                    const SizedBox(height: 15),
                    _buildSummaryRow('Order', '\$16.48'),
                    _buildSummaryRow('Taxes', '\$0.3'),
                    _buildSummaryRow('Delivery fees', '\$1.5'),
                    const SizedBox(height: 10),
                    const Divider(color: AppColors.lightGrey),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('Total:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        Text('\$18.19', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('Estimated delivery time:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                        Text('15 - 30mins', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                      ],
                    ),
                    
                    const SizedBox(height: 40),
                    
                    // Payment Methods
                    const Text('Payment methods', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                    const SizedBox(height: 20),
                    
                    // Contenedor que agrupa las tarjetas con el borde azul
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue, width: 2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          _buildCardOption(
                            index: 0,
                            logoUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b7/MasterCard_Logo.svg/1200px-MasterCard_Logo.svg.png',
                            title: 'Credit card',
                            subtitle: '5105 **** **** 0505',
                            isSelected: selectedCard == 0,
                          ),
                          _buildCardOption(
                            index: 1,
                            logoUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5e/Visa_Inc._logo.svg/2560px-Visa_Inc._logo.svg.png',
                            title: 'Debit card',
                            subtitle: '3566 **** **** 0505',
                            isSelected: selectedCard == 1,
                          ),
                        ],
                      ),
                    ),
                    
                    const SizedBox(height: 20),
                    
                    // Checkbox
                    Row(
                      children: [
                        SizedBox(
                          height: 24,
                          width: 24,
                          child: Checkbox(
                            value: saveCard,
                            activeColor: AppColors.primary,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                            onChanged: (val) {
                              setState(() => saveCard = val ?? false);
                            },
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          'Save card details for future payments',
                          style: TextStyle(color: AppColors.grey, fontSize: 13),
                        )
                      ],
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
            
            // Botón Inferior Pay Now
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
                   Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Total price',
                        style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.grey, fontSize: 12),
                      ),
                      const SizedBox(height: 2),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('\$', style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold, fontSize: 16)),
                          Text('18.19', style: TextStyle(color: AppColors.black, fontWeight: FontWeight.bold, fontSize: 24)),
                        ],
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Mostrar el popup al pagar
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => const SuccessPopup(),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.darkBrown,
                      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      elevation: 0,
                    ),
                    child: const Text(
                      'Pay Now',
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

  Widget _buildSummaryRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(color: AppColors.grey, fontSize: 14)),
          Text(value, style: const TextStyle(color: AppColors.grey, fontSize: 14)),
        ],
      ),
    );
  }

  Widget _buildCardOption({
    required int index,
    required String logoUrl,
    required String title,
    required String subtitle,
    required bool isSelected,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() => selectedCard = index);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.darkBrown : AppColors.white,
          borderRadius: BorderRadius.vertical(
            top: index == 0 ? const Radius.circular(18) : Radius.zero,
            bottom: index == 1 ? const Radius.circular(18) : Radius.zero,
          ),
        ),
        child: Row(
          children: [
            // Simulación logo Mastercard/Visa
            Container(
              width: 50,
              height: 35,
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Image.network(logoUrl, fit: BoxFit.contain),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: isSelected ? AppColors.white : AppColors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: isSelected ? AppColors.white.withOpacity(0.5) : AppColors.grey,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            // Radio button custom
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? AppColors.white : AppColors.lightGrey,
                  width: 2,
                ),
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: const BoxDecoration(
                          color: AppColors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                    )
                  : null,
            )
          ],
        ),
      ),
    );
  }
}
