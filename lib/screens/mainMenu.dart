import 'package:flutter/material.dart';
import 'formClinico.dart';
import 'edu_screen.dart';
import 'ajustes_screen.dart';
import 'prediccion_screen.dart';

class MainMenu extends StatelessWidget {
  final String nombre;

  const MainMenu({super.key, this.nombre = "Usuario"});

  @override
  Widget build(BuildContext context) {
    const appBarColor = Color(0xFFBFC7E2);

    return Scaffold(
      backgroundColor: const Color(0xFFEFEFF4),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(85),
        child: AppBar(
          backgroundColor: appBarColor,
          elevation: 0,
          title: Row(
            children: [
              Image.asset(
                'assets/logo_kidneyai.png',
                height: 48,
              ),
              const SizedBox(width: 8),
              const Text(
                'KidneyAI',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              const Icon(
                Icons.account_circle,
                color: Colors.black,
                size: 32,
              )
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: ListView(
                children: [
                  Text(
                    "Bienvenido, $nombre",
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _MenuCard(
                    icon: Icons.health_and_safety,
                    title: 'Predicción CKD',
                    subtitle:
                        'Detección temprana de la enfermedad renal crónica.',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const PrediccionScreen()),
                        );
                      },
                  ),
                  _MenuCard(
                    icon: Icons.assignment,
                    title: 'Formulario clínico',
                    subtitle:
                        'Complete su información clínica para la predicción.',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const FormClinico()),
                      );
                    },
                  ),
                _MenuCard(
                  icon: Icons.menu_book,
                  title: 'Educación',
                  subtitle: 'Aprende más acerca de la enfermedad renal crónica.',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const EduScreen()),
                    );
                  },
                ),
                _MenuCard(
                  icon: Icons.settings,
                  title: 'Ajustes',
                  subtitle: 'Ajustes de preferencia de la aplicación y perfil de usuario.',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AjustesScreen()),
                    );
                  },
                ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
          Container(
            color: appBarColor,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: const Center(
              child: Text(
                '© 2025 KidneyAI - Todos los derechos reservados',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ],
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
    return SizedBox(
      width: double.infinity,
      child: Card(
        margin: const EdgeInsets.only(bottom: 16),
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
            child: Row(
              children: [
                Icon(icon, size: 40, color: Colors.redAccent),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        subtitle,
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.arrow_forward_ios, size: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
