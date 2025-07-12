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

    return Scaffold(
      backgroundColor: const Color(0xFFEFEFF4),
      body: Column(
        children: [
          // Encabezado
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: appBarColor,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            padding: const EdgeInsets.fromLTRB(16, 40, 16, 20),
            child: Row(
              children: [
                SizedBox(
                  height: 50,
                  width: 50,
                  child: Image.asset(
                    'assets/logo_kidneyai.png',
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(width: 10),
                Flexible(
                  child: Text(
                    'KidneyAI',
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                const Spacer(),
                const CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, color: Colors.black),
                ),
              ],
            ),
          ),

          // Bienvenida
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Text(
             // 'Bienvenido, $nombre',
              'Bienvenido!',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),

          // Menú
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                MenuCard(
                  iconPath: 'assets/rinon_logo.png',
                  iconColor: Colors.redAccent,
                  title: 'Predicción CKD',
                  subtitle: 'Detección temprana de la enfermedad renal crónica.',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const PrediccionScreen()),
                    );
                  },
                ),
                MenuCard(
                  iconPath: 'assets/form_logo.png',
                  iconColor: Colors.indigo,
                  title: 'Formulario clínico',
                  subtitle: 'Complete su información clínica para la predicción.',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const FormClinico()),
                    );
                  },
                ),
                MenuCard(
                  iconPath: 'assets/educacion_logo.png',
                  iconColor: Colors.indigo,
                  title: 'Educación',
                  subtitle: 'Aprende más acerca de la enfermedad renal crónica.',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const EduScreen()),
                    );
                  },
                ),
                MenuCard(
                  iconPath: 'assets/ajustes_logo.png',
                  iconColor: Colors.grey,
                  title: 'Ajustes',
                  subtitle: 'Ajustes de preferencia de la aplicación y perfil de usuario.',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AjustesScreen()),
                    );
                  },
                ),
              ],
            ),
          ),

          // Footer
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

// SOLO MODIFICADO: altura, fuente y padding
class MenuCard extends StatelessWidget {
  final String iconPath;
  final Color iconColor;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const MenuCard({
    super.key,
    required this.iconPath,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final cardHeight = (screenHeight - 280) / 4; // Distribuye el alto entre las 4 tarjetas

    return SizedBox(
      height: cardHeight,
      child: Card(
        color: const Color(0xFFE3E3E3),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        margin: const EdgeInsets.symmetric(vertical: 8),
        elevation: 3,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(20),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  child: Image.asset(
                    iconPath,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          color: iconColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        subtitle,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.arrow_forward_ios, size: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
