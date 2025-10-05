import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:easy_ferry_app/src/requests/login.dart';
import 'package:easy_ferry_app/src/utils/shared_prefs.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        top: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 500,
              height: 300,
              child: ShaderMask(
                shaderCallback: (Rect bounds) {
                  return const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.white,
                      Colors.white,
                      Colors.transparent,
                    ],
                    stops: [0.0, 0.7, 1.0],
                  ).createShader(bounds);
                },
                blendMode: BlendMode.dstIn,
                child: Image.asset(
                  "assets/login_bg.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 50),
                      const Text(
                        "Bienvenido a Easy Ferry",
                        style: TextStyle(fontSize: 30),
                      ),
                      const SizedBox(height: 10),
                      const Text("xxxxxxxxxxxxxxxx xxxxx"),
                      const SizedBox(height: 30),
                      FormBuilder(
                        key: formKey,
                        child: Column(
                          children: [
                            FormBuilderTextField(
                              name: 'email',
                              decoration: const InputDecoration(
                                labelText: 'Email',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(30)),
                                ),
                              ),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(errorText: 'Este campo es obligatorio'),
                                FormBuilderValidators.email(errorText: 'Por favor, introduce un correo electrónico válido'),
                              ]),
                            ),
                            const SizedBox(height: 10),
                            FormBuilderTextField(
                              name: 'password',
                              obscureText: true,
                              decoration: const InputDecoration(
                                labelText: 'Contraseña',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(30)),
                                ),
                              ),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(errorText: 'Este campo es obligatorio'),
                                FormBuilderValidators.minLength(6, errorText: 'La contraseña debe tener al menos 6 caracteres'),
                              ]),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: () async {
                          if (formKey.currentState?.saveAndValidate() ?? false) {
                            final email = formKey.currentState!.value['email'];
                            final password = formKey.currentState!.value['password'];
                            debugPrint('Email: $email');
                            debugPrint('Password: $password');
                            final resp = await login(email, password);
                            // Guard context usage with mounted check
                            if (mounted) {
                              if (resp['status'] == '200') {
                                await SharedPrefs.setString('user', resp['message']!);
                                Navigator.pushReplacementNamed(context, '/home');
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Error: ${resp['message']}'),
                                  ),
                                );
                              }
                            }
                          }
                        },
                        child: const Text("Iniciar Sesión"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}