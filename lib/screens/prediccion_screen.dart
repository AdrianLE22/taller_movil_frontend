import 'package:flutter/material.dart';

class PrediccionScreen extends StatelessWidget {
  const PrediccionScreen({super.key});

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
          'PREDICTION',
          style: TextStyle(
            color: Color(0xFF6A6AA5),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Nivel de riesgo
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  const Icon(Icons.check_circle, color: Colors.green, size: 40),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Nivel de Riesgo',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'MODERADO',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Su riesgo de desarrollar ERC es moderado según los datos clínicos que proporcionó.',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Principales factores de riesgo',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            _FactorCard(
              icon: Icons.science,
              label: 'Creatinina',
              value: 0.7,
              iconColor: Colors.blue,
            ),
            _FactorCard(
              icon: Icons.calendar_today,
              label: 'Edad',
              value: 0.5,
              iconColor: Colors.blue,
            ),
            _FactorCard(
              icon: Icons.monitor_heart,
              label: 'Presión sanguínea',
              value: 0.4,
              iconColor: Colors.blue,
            ),
            const SizedBox(height: 20),
            const Text(
              'Recomendaciones',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                children: const [
                  Icon(Icons.light_mode, size: 30),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Siga una dieta balanceada y mantenga un peso saludable',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  // Acción para compartir
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF121C61),
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                icon: const Icon(Icons.share, color: Colors.white),
                label: const Text(
                  'Compartir resultado',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class _FactorCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final double value;
  final Color iconColor;

  const _FactorCard({
    required this.icon,
    required this.label,
    required this.value,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Icon(icon, color: iconColor),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                LinearProgressIndicator(
                  value: value,
                  backgroundColor: Colors.grey[300],
                  color: iconColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
