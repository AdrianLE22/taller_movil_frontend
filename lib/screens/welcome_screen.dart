import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              Image.asset('assets/logo_kidneyai.png', height: 300),
              const SizedBox(height: 30),

              // Título
              const Text(
                'Bienvenido a KidneyAI',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 12),

              // Descripción
              const Text(
                'Detección temprana y prevención de la enfermedad renal crónica con ayuda de la inteligencia artificial',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(height: 30),

              // Botón "Empezamos"
              OutlinedButton(
                style:
                    OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 14,
                      ),
                      side: const BorderSide(color: Colors.black87, width: 2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      foregroundColor: Colors.black87,
                    ).copyWith(
                      mouseCursor: MaterialStateProperty.all(
                        SystemMouseCursors.click,
                      ),
                      overlayColor: MaterialStateProperty.resolveWith<Color?>((
                        Set<MaterialState> states,
                      ) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.black12;
                        }
                        if (states.contains(MaterialState.hovered)) {
                          return Colors.black.withOpacity(0.04);
                        }
                        return null;
                      }),
                    ),
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                child: const Text('Empezamos', style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
