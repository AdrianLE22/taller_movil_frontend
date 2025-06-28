import 'package:flutter/material.dart';

class AjustesScreen extends StatefulWidget {
  const AjustesScreen({super.key});

  @override
  State<AjustesScreen> createState() => _AjustesScreenState();
}

class _AjustesScreenState extends State<AjustesScreen> {
  bool pushNotifications = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD9D9D9),
      appBar: AppBar(
        backgroundColor: const Color(0xFFD9D9D9),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Logo y título
                Row(
                  children: [
                    Image.asset(
                      'assets/logo_kidneyai.png',
                      height: 40,
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      "KidneyAI",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF001F54),
                      ),
                    ),
                    const Spacer(),
                    const CircleAvatar(
                      backgroundColor: Color(0xFFE0E0E0),
                      child: Icon(Icons.person, color: Colors.black),
                    )
                  ],
                ),
                const SizedBox(height: 24),

                const Text(
                  "Ajustes",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),

                const Text("Cuenta", style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),

                _ajusteOpcion(
                  icon: Icons.person_outline,
                  label: "Gestionar cuenta",
                  onTap: () {},
                ),
                _ajusteOpcion(
                  icon: Icons.lock_outline,
                  label: "Código de acceso",
                  iconColor: Colors.green,
                  onTap: () {},
                ),
                _ajusteOpcion(
                  icon: Icons.security,
                  label: "Two-factor Authentication",
                  iconColor: Colors.green,
                  onTap: () {},
                ),

                const SizedBox(height: 16),
                const Text("Notificaciones", style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),

                Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF2F2F2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.notifications, color: Colors.blue),
                      const SizedBox(width: 10),
                      const Text("Push Notifications"),
                      const Spacer(),
                      Switch(
                        value: pushNotifications,
                        activeColor: Colors.blue,
                        onChanged: (value) {
                          setState(() {
                            pushNotifications = value;
                          });
                        },
                      )
                    ],
                  ),
                ),

                const SizedBox(height: 8),
                const Text("Soporte", style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),

                _ajusteOpcion(
                  icon: Icons.help_outline,
                  label: "Ayuda",
                  iconColor: Colors.blue,
                  onTap: () {},
                ),
                _ajusteOpcion(
                  icon: Icons.logout,
                  label: "Sign Out",
                  iconColor: Colors.red,
                  onTap: () {},
                ),
              ],
            ),
          ),

          const Spacer(),

          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Image.asset(
              'assets/logo_kidneyai.png',
              height: 100,
              color: Colors.red[200]?.withOpacity(0.4),
            ),
          ),
        ],
      ),
    );
  }

  Widget _ajusteOpcion({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    Color iconColor = Colors.black,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFF2F2F2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Icon(icon, color: iconColor),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                label,
                style: const TextStyle(fontSize: 14),
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
