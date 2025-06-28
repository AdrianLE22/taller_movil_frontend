import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFEFF4),
      appBar: AppBar(
        backgroundColor: const Color(0xFFBFC7E2),
        elevation: 0,
        title: Row(
          children: [
            Image.asset(
              'assets/logo_kidneyai.png',
              height: 32,
            ),
            const SizedBox(width: 8),
            const Text(
              'KidneyAI',
              style: TextStyle(color: Colors.black),
            ),
            const Spacer(),
            const Icon(
              Icons.account_circle,
              color: Colors.black,
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Bienvenido!",  //falta que lo llame por su nombre
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  _MenuCard(
                    icon: Icons.health_and_safety,
                    title: 'Predicción CKD',
                    subtitle: 'Detección temprana de la enfermedad renal crónica.',
                    onTap: () {
                      // navega a predicción
                    },
                  ),
                  _MenuCard(
                    icon: Icons.assignment,
                    title: 'Formulario clínico',
                    subtitle: 'Complete su información clínica para la predicción.',
                    onTap: () {
                      // navega a formulario
                    },
                  ),
                  _MenuCard(
                    icon: Icons.menu_book,
                    title: 'Educación',
                    subtitle: 'Aprende más acerca de la enfermedad renal crónica.',
                    onTap: () {
                      // navega a educación
                    },
                  ),
                  _MenuCard(
                    icon: Icons.settings,
                    title: 'Ajustes',
                    subtitle: 'Ajustes de preferencia de la aplicación y perfil de usuario.',
                    onTap: () {
                      // navega a ajustes
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
}

class _MenuCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _MenuCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        leading: Icon(icon, size: 36, color: Colors.redAccent),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        onTap: onTap,
      ),
    );
  }
}
