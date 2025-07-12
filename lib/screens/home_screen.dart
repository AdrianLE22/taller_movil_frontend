import 'package:flutter/material.dart';
import 'formClinico.dart';
import 'edu_screen.dart';
import 'ajustes_screen.dart';
import 'prediccion_screen.dart';

class HomeScreen extends StatelessWidget {
  final String nombre;

  const HomeScreen({super.key, this.nombre = "Usuario"});

  @override
  Widget build(BuildContext context) {
    const appBarColor = Color(0xFFBFC7E2);
    const cardColor = Color(0xFFE3E3E3);

    return Scaffold(
      backgroundColor: const Color(0xFFEFEFF4),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: Container(
          color: appBarColor,
          padding: const EdgeInsets.only(top: 70, left: 16, right: 16),
          child: Row(
            children: [
              Icon(Icons.favorite, color: Colors.redAccent, size: 36),
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
              const Icon(Icons.account_circle, color: Colors.white, size: 32),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                Text(
                  'Bienvenido!',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                const Icon(Icons.work_outline, size: 28, color: Colors.grey),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                MenuCard(
                  icon: Icons.health_and_safety,
                  iconColor: Colors.redAccent,
                  title: 'Predicción CKD',
                  subtitle:
                      'Detección temprana de la enfermedad renal crónica.',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PrediccionScreen(),
                      ),
                    );
                  },
                ),
                MenuCard(
                  icon: Icons.assignment,
                  iconColor: Colors.indigo,
                  title: 'Formulario clínico',
                  subtitle:
                      'Complete su información clínica para la predicción.',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FormClinico(),
                      ),
                    );
                  },
                ),
                MenuCard(
                  icon: Icons.menu_book,
                  iconColor: Colors.indigo,
                  title: 'Educación',
                  subtitle:
                      'Aprende más acerca de la enfermedad renal crónica.',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const EduScreen(),
                      ),
                    );
                  },
                ),
                MenuCard(
                  icon: Icons.settings,
                  iconColor: Colors.grey,
                  title: 'Ajustes',
                  subtitle:
                      'Ajustes de preferencia de la aplicación y perfil de usuario.',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AjustesScreen(),
                      ),
                    );
                  },
                ),
              ],
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

class MenuCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const MenuCard({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFFE3E3E3),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: const EdgeInsets.symmetric(vertical: 10),
      elevation: 2,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Icon(icon, size: 40, color: iconColor),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: iconColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(subtitle, style: const TextStyle(fontSize: 14)),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios, size: 16),
            ],
          ),
        ),
      ),
    );
  }
}
