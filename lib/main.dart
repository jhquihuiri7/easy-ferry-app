import 'package:flutter/material.dart';
import 'package:easy_ferry_app/src/pages/login.dart';
import 'package:easy_ferry_app/src/pages/home.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:easy_ferry_app/src/utils/shared_prefs.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); 
  SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
  await SharedPrefs.init();
  String? user = await SharedPrefs.getString('user');
  String initialRoute = (user != null && user.isNotEmpty) ? '/home' : '/login';
  runApp(MyApp(initialRoute: initialRoute));
}

class MyApp extends StatelessWidget {
  final String initialRoute;
  const MyApp({required this.initialRoute, super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        FormBuilderLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('es', 'EC'), // Spanish
      ],
      title: 'Easy Ferry',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
      ),
      routes: Map<String, WidgetBuilder>.from({
        '/login': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
      }),
      initialRoute: initialRoute,
    );
  }
}

