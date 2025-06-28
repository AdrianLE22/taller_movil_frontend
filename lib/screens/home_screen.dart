import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final String userName;

  const HomeScreen({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Encabezado superior con logo y perfil
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: const BoxDecoration(
                color: Color(0xFFE0E6FF),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(16),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/logo_kidneyai.png', height: 50),
                  const Icon(
                    Icons.account_circle,
                    size: 40,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),

            // Bienvenida con nombre
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: const BoxDecoration(
                color: Color(0xFF3C3C89),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(16),
                ),
              ),
              child: Text(
                'Bienvenido, $userName',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Menú de opciones
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  _menuCard(
                    context,
                    iconPath: 'assets/icon_ckd.png',
                    title: 'Predicción CKD',
                    subtitle:
                        'Detección temprana de la enfermedad renal crónica.',
                    onTap: () {
                      Navigator.pushNamed(context, '/predict');
                    },
                  ),
                  _menuCard(
                    context,
                    iconPath: 'assets/icon_form.png',
                    title: 'Formulario clínico',
                    subtitle: 'Completa tu información médica.',
                    onTap: () {
                      Navigator.pushNamed(context, '/formulario');
                    },
                  ),
                  _menuCard(
                    context,
                    iconPath: 'assets/icon_book.png',
                    title: 'Educación',
                    subtitle: 'Aprende más sobre la enfermedad renal.',
                    onTap: () {
                      Navigator.pushNamed(context, '/educacion');
                    },
                  ),
                  _menuCard(
                    context,
                    iconPath: 'assets/icon_ajustes.png',
                    title: 'Ajustes',
                    subtitle: 'Configuraciones de tu cuenta.',
                    onTap: () {
                      Navigator.pushNamed(context, '/ajustes');
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _menuCard(
    BuildContext context, {
    required String iconPath,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: Colors.grey.shade100,
      margin: const EdgeInsets.symmetric(vertical: 10),
      elevation: 2,
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: Image.asset(iconPath, width: 40),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        onTap: onTap,
      ),
    );
  }
}
