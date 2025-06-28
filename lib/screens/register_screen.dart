import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _nombreController = TextEditingController();
  final _apellidoController = TextEditingController();
  final _dniController = TextEditingController();
  final _correoController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _ciudadController = TextEditingController();
  final _departamentoController = TextEditingController();

  bool _isLoading = false;
  String _errorMessage = '';

  Future<void> _registrarUsuario() async {
    final nombre = _nombreController.text.trim();
    final apellidos = _apellidoController.text.trim();
    final correo = _correoController.text.trim();
    final password = _passwordController.text.trim();
    final confirmar = _confirmPasswordController.text.trim();

    if (nombre.isEmpty ||
        apellidos.isEmpty ||
        correo.isEmpty ||
        password.isEmpty ||
        confirmar.isEmpty) {
      setState(() => _errorMessage = 'Completa todos los campos');
      return;
    }

    if (password != confirmar) {
      setState(() => _errorMessage = 'Las contraseñas no coinciden');
      return;
    }

    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });

    final url = Uri.parse('http://24.144.84.85:8081/api/usuarios/');
    final body = jsonEncode({
      "nombre": nombre,
      "apellidos": apellidos,
      "password": password,
      "correo": correo,
      "fechaNacimiento": "2000-01-01", // aún fijo
      "genero": 1,
    });

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: body,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        if (!mounted) return;

        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Registro exitoso')));
        Navigator.pop(context); // Volver al login
      } else {
        if (!mounted) return;
        setState(() => _errorMessage = 'No se pudo registrar el usuario');
      }
    } catch (e) {
      if (!mounted) return;
      setState(() => _errorMessage = 'Error de conexión: $e');
    } finally {
      if (!mounted) return;
      setState(() => _isLoading = false);
    }
  }

  Widget _campo(
    String label,
    TextEditingController controller, {
    bool obscure = false,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscure,
      decoration: InputDecoration(
        labelText: label,
        border: const UnderlineInputBorder(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        child: Column(
          children: [
            Image.asset('assets/logo_kidneyai.png', height: 100),
            const SizedBox(height: 10),
            const Text(
              '¡Bienvenido! Regístrate para predecir tu riesgo de enfermedad renal y cuidar tu salud desde hoy',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  _campo('Nombres', _nombreController),
                  _campo('Apellidos', _apellidoController),
                  Row(
                    children: [
                      Expanded(child: _campo('DNI', _dniController)),
                      const SizedBox(width: 10),
                      Expanded(child: _campo('Correo', _correoController)),
                    ],
                  ),
                  _campo('Contraseña', _passwordController, obscure: true),
                  _campo(
                    'Confirmar contraseña',
                    _confirmPasswordController,
                    obscure: true,
                  ),
                  Row(
                    children: [
                      Expanded(child: _campo('Ciudad', _ciudadController)),
                      const SizedBox(width: 10),
                      Expanded(
                        child: _campo('Departamento', _departamentoController),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  _isLoading
                      ? const CircularProgressIndicator()
                      : ElevatedButton(
                          onPressed: _registrarUsuario,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 40,
                              vertical: 14,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            'Registrarse',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                  const SizedBox(height: 10),
                  if (_errorMessage.isNotEmpty)
                    Text(
                      _errorMessage,
                      style: const TextStyle(color: Colors.red, fontSize: 14),
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
