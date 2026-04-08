import 'package:flutter/material.dart';
import '../core/theme.dart';

// Pantalla del historial / Soporte del cliente (Chat)
class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
         child: Column(
           children: [
              // Encabezado
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: AppColors.black),
                      onPressed: () => Navigator.pop(context),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                    const Icon(Icons.menu, color: AppColors.black), // Simula el menú de opciones
                  ],
                ),
              ),
              
              const SizedBox(height: 10),

              // Chat
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  children: [
                    // Bot
                    _buildChatBubble(text: 'Hi, how can I help you?', isUser: false),
                    // Usuario
                    _buildChatBubble(
                        text: 'Hello, I ordered two fried chicken burgers. can I know how much time it will get to arrive?',
                        isUser: true),
                    // Bot
                    _buildChatBubble(text: 'Ok, please let me check!', isUser: false),
                    // Usuario
                    _buildChatBubble(text: 'Sure...', isUser: true),
                    // Bot
                    _buildChatBubble(text: "It'll get 25 minutes to arrive to your address", isUser: false),
                    // Marca de tiempo
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Text(
                          '26 minutes ago',
                          style: TextStyle(color: AppColors.grey.withOpacity(0.5), fontSize: 10),
                        ),
                      ),
                    ),
                    // Usuario
                    _buildChatBubble(text: 'Ok, thanks you for your support', isUser: true),
                  ],
                ),
              ),

              // Input Bottom Area
              Container(
                margin: const EdgeInsets.only(left: 24, right: 24, bottom: 20, top: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue, width: 2), // El marco azul
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Type here...',
                          hintStyle: TextStyle(color: AppColors.lightGrey),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 20),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(4),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(
                        Icons.send_rounded,
                        color: AppColors.white,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              )
           ],
         ),
      ),
    );
  }

  // Burbuja de chat
  Widget _buildChatBubble({required String text, required bool isUser}) {
    // Configuración del avatar
    Widget avatar = Container(
      width: 40,
      height: 40,
      margin: EdgeInsets.only(
        right: isUser ? 0 : 12,
        left: isUser ? 12 : 0,
      ),
      decoration: BoxDecoration(
        color: isUser ? Colors.transparent : AppColors.darkBrown,
        shape: BoxShape.circle,
        image: isUser
            ? const DecorationImage(
                image: NetworkImage('https://images.unsplash.com/photo-1494790108377-be9c29b29330?q=80&w=200&fit=crop'), // Avatar usuario
                fit: BoxFit.cover,
              )
            : null,
      ),
      child: isUser
          ? null
          : const Icon(Icons.person_outline, color: AppColors.white, size: 20),
    );

    // Contenido de la burbuja
    return Padding(
      padding: const EdgeInsets.only(bottom: 25.0),
      child: Row(
        mainAxisAlignment: isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (!isUser) avatar,
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isUser ? AppColors.primary : AppColors.background,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(15),
                  topRight: const Radius.circular(15),
                  bottomLeft: Radius.circular(isUser ? 15 : 0),
                  bottomRight: Radius.circular(isUser ? 0 : 15),
                ),
                boxShadow: isUser
                    ? [
                        BoxShadow(
                          color: AppColors.primary.withOpacity(0.3),
                          spreadRadius: 1,
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        )
                      ]
                    : null,
              ),
              child: Text(
                text,
                style: TextStyle(
                  color: isUser ? AppColors.white : AppColors.black,
                  fontSize: 14,
                  height: 1.4,
                ),
              ),
            ),
          ),
          if (isUser) avatar,
        ],
      ),
    );
  }
}
