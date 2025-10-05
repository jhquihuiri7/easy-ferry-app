import 'package:flutter/material.dart';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isTracking = false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/login');
        },
        child: const Icon(Icons.login),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                child: const Text(
                  'Tracking de recorrido',
                  style: TextStyle(fontSize: 24),
                )
              ),
              AnimatedToggleSwitch<bool>.dual(
                current: isTracking,
                first:false,
                second:true,
                spacing: 50.0,
                style: const ToggleStyle(
                  borderColor: Colors.transparent,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: Offset(0, 1.5),
                    ),
                  ],
                ),
                borderWidth: 5.0,
                height: 55,
                onChanged: (value) {
                  isTracking = value;
                  setState(() {});
                },
                styleBuilder: (b) => ToggleStyle(
                      indicatorColor: b ? Colors.green : Colors.red),
                  iconBuilder: (value) => value
                      ? const Icon(Icons.sailing)
                      : const Icon(Icons.stop),
                  textBuilder: (value) => value
                      ? const Center(child: Text('Transmitiendo'))
                      : const Center(child: Text('Detenido')),
              )

            ]
          ),
        ),
      ),
    );
  }
}
