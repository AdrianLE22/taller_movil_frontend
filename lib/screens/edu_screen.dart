import 'package:flutter/material.dart';

class EduScreen extends StatelessWidget {
  const EduScreen({super.key});

  Widget sectionHeader(String title, String iconPath) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Image.asset(
          iconPath,
          width: 36,
          height: 36,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image, color: Colors.red),
        ),
      ],
    );
  }

  Widget sectionCard({required Widget child, Color? color}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color ?? Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFEFF4),
      appBar: AppBar(
        backgroundColor: const Color(0xFFBFC7E2),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'EDUCACIÓN',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sectionCard(
              color: Colors.pink[100],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  sectionHeader('¿Qué es la Enfermedad Renal Crónica (ERC)?', 'assets/rinon_logo.png'),
                  const SizedBox(height: 8),
                  const Text(
                    'La ERC es una afección en la que los riñones pierden gradualmente su capacidad para filtrar los desechos y el exceso de líquidos de la sangre. '
                    'Es una enfermedad progresiva y, si no se detecta a tiempo, puede llevar a insuficiencia renal.',
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            sectionCard(
              color: Colors.grey[300],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  sectionHeader('¿Cuáles son las causas más comunes?', 'assets/educacion_logo.png'),
                  const SizedBox(height: 12),
                  const Wrap(
                    spacing: 12,
                    runSpacing: 8,
                    children: [
                      Chip(label: Text("Diabetes tipo 1 y tipo 2")),
                      Chip(label: Text("Glomerulonefritis")),
                      Chip(label: Text("Enfermedades hereditarias como la poliquistosis renal")),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            sectionHeader('¿Factores de riesgo?', 'assets/factores_logo.png'),
            const BulletList(items: [
              'Diabetes e hipertensión no controladas.',
              'Antecedentes familiares de enfermedad renal.',
              'Edad avanzada.',
              'Obesidad.',
              'Tabaquismo.',
            ]),

            const SizedBox(height: 20),

            sectionHeader('¿Síntomas tempranos?', 'assets/sintomas_logo.png'),
            const BulletList(items: [
              'Fatiga.',
              'Hinchazón en pies y tobillos.',
              'Orina espumosa o cambios en la cantidad de orina.',
              'Dificultad para concentrarse.',
            ]),

            const SizedBox(height: 20),

            sectionHeader('¿Cómo prevenirla?', 'assets/prevenir_logo.png'),
            const BulletList(items: [
              'Mantener controlada la presión arterial y el azúcar en sangre.',
              'Adoptar una dieta saludable baja en sal y grasas.',
              'Hacer ejercicio regularmente.',
              'Evitar el consumo excesivo de analgésicos.',
              'No fumar ni tomar alcohol.',
            ]),

            const SizedBox(height: 20),

            sectionHeader('¿Por qué es importante la detección temprana?', 'assets/form_logo.png'),
            const BulletList(items: [
              'Una detección a tiempo puede ralentizar o detener el progreso de la enfermedad.',
              'Permite iniciar tratamientos que eviten la necesidad de diálisis o trasplante.',
            ]),

            const SizedBox(height: 20),

            sectionHeader('¿Sabías que...?', 'assets/sabias_logo.png'),
            const BulletList(items: [
              'La ERC afecta aproximadamente al 10% de la población mundial.',
              'Muchas personas no saben que la padecen hasta que ya está avanzada.',
            ]),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

class BulletList extends StatelessWidget {
  final List<String> items;
  const BulletList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, top: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: items
            .map(
              (item) => Padding(
                padding: const EdgeInsets.only(bottom: 6.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("• ", style: TextStyle(fontSize: 16)),
                    Expanded(
                      child: Text(item, style: const TextStyle(fontSize: 14)),
                    ),
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
