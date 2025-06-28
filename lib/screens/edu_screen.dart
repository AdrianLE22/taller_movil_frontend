import 'package:flutter/material.dart';

class EduScreen extends StatelessWidget {
  const EduScreen({super.key});

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
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.pink[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Row(
                    children: [
                      Icon(Icons.info, color: Colors.redAccent),
                      SizedBox(width: 8),
                      Text(
                        '¿Qué es la Enfermedad Renal Crónica (ERC)?',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    'La ERC es una afección en la que los riñones pierden gradualmente su capacidad para filtrar los desechos y el exceso de líquidos de la sangre. '
                    'Es una enfermedad progresiva y, si no se detecta a tiempo, puede llevar a insuficiencia renal.',
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    '¿Cuáles son las causas más comunes?',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 12),
                  Wrap(
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
            const Text(
              '¿Factores de riesgo?',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const BulletList(items: [
              'Diabetes e hipertensión no controladas.',
              'Antecedentes familiares de enfermedad renal.',
              'Edad avanzada.',
              'Obesidad.',
              'Tabaquismo.',
            ]),
            const SizedBox(height: 20),
            const Text(
              '¿Síntomas tempranos?',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const BulletList(items: [
              'Fatiga.',
              'Hinchazón en pies y tobillos.',
              'Orina espumosa o cambios en la cantidad de orina.',
              'Dificultad para concentrarse.',
            ]),
            const SizedBox(height: 20),
            const Text(
              '¿Cómo prevenirla?',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const BulletList(items: [
              'Mantener controlada la presión arterial y el azúcar en sangre.',
              'Adoptar una dieta saludable baja en sal y grasas.',
              'Hacer ejercicio regularmente.',
              'Evitar el consumo excesivo de analgésicos.',
              'No fumar ni tomar alcohol.',
            ]),
            const SizedBox(height: 20),
            const Text(
              '¿Por qué es importante la detección temprana?',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const BulletList(items: [
              'Una detección a tiempo puede ralentizar o detener el progreso de la enfermedad.',
              'Permite iniciar tratamientos que eviten la necesidad de diálisis o trasplante.',
            ]),
            const SizedBox(height: 20),
            const Text(
              '¿Sabías que...?',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items
          .map((item) => Padding(
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
              ))
          .toList(),
    );
  }
}
