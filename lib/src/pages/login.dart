import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}



class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormBuilderState>();
    return Scaffold(
      body: SafeArea(
        child:Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset("assets/login_bg.jpg"),
                Expanded(child: SizedBox()),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Bienvenido a Easy Ferry", style: TextStyle(fontSize: 30)),
                    Text("xxxxxxxxxxxxxxxx xxxxx"),
                  ],
                ),
                SizedBox(height: 30),
                FormBuilder(
                  key: formKey,
                  child: Column(  
                    children: [
                      FormBuilderTextField(
                        name: 'email',
                        decoration: InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))
                        ),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.email(),
                        ]),
                      ),
                      SizedBox(height: 10),
                      FormBuilderTextField(
                        name: 'password',
                        decoration: InputDecoration(
                          labelText: 'Contraseña', 
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))
                        ),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.password(minLength: 6),
                        ]),
                      ),
                    ],
                  )
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: (){
                    formKey.currentState?.saveAndValidate();
                    debugPrint(formKey.currentState?.value['email']);
                    debugPrint(formKey.currentState?.value['password']);
                  }, 
                  child: Text("Iniciar Sesión")
                  
                ),
                SizedBox(height: 50)
              ]
            )
          )
        ),
      )
    );
  }
}
