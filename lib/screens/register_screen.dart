import 'package:flutter/material.dart';
import 'package:practicas_flutter/providers/login_form_provider.dart';
import 'package:practicas_flutter/services/services.dart';
import 'package:practicas_flutter/ui/input_decorations.dart';
import 'package:practicas_flutter/widgets/widgets.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
   
  const RegisterScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBg(
        child:SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 250),

              CardContainer(
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Text('Crear cuenta', style: Theme.of(context).textTheme.headlineMedium),
                    SizedBox(height: 30),

                    ChangeNotifierProvider(
                      create: (context) => LoginFormProvider(),
                      child: _LoginForm(),
                    )
                    
                  ]
                )
              ),

              SizedBox(height: 50,),
              TextButton(
                onPressed: () => Navigator.pushReplacementNamed(context, 'login'), 
                child: Text('¿Ya tienes una cuenta?', style: TextStyle(fontWeight: FontWeight.bold),)
              ),
              SizedBox(height: 50,),

              SizedBox(height: 50,),
              SizedBox(height: 50,),
              SizedBox(height: 50,),
              SizedBox(height: 50,),
            ],
          ),
        )
      )
    );
  }
}


class _LoginForm extends StatelessWidget {
  const _LoginForm({super.key});

  @override
  Widget build(BuildContext context) {

    final loginForm = Provider.of<LoginFormProvider>(context);

    return Container(
      child: Form(
        
        key: loginForm.formKey,

        autovalidateMode: AutovalidateMode.onUserInteraction,

        child: Column(
          children: [

            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoratio(
                hintText: 'gon.freecs@gmail.com',
                labelText: 'Correo electrónico',
                prefixIcon: Icons.alternate_email_outlined
              ),
              onChanged: (value) => loginForm.email = value,
              validator: (value) {
                String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                RegExp regExp = new RegExp(pattern);
                return regExp.hasMatch(value ?? '') ? null : 'No tiene formato de correo';
              },
            ),

            SizedBox(height: 30),

            TextFormField(
              autocorrect: false,
              obscureText: true,
              decoration: InputDecorations.authInputDecoratio(
                hintText: '****',
                labelText: 'Password',
                prefixIcon: Icons.lock_outlined
              ),
              onChanged: (value) => loginForm.password = value,
              validator: (value) {
                if (value != null && value.length >= 6){
                  return null;
                }
                return 'Mínimo 6 chars';
              },
            ),

            SizedBox(height: 30,),

            MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              ),
              disabledColor: Colors.grey,
              elevation: 0,
              color: Colors.deepPurple,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 80),
                child: Text(
                  'Entrar', 
                  style: TextStyle(color: Colors.white),)
                ),
              onPressed: () async {
                final authService = Provider.of<AuthService>(context, listen: false);

                if (!loginForm.isValidForm()) return;

                final String? errorMsg = await authService.createUser(loginForm.email, loginForm.password);

                if (errorMsg == null )
                  Navigator.pushReplacementNamed(context, 'home');
                else
                  print(errorMsg);
              },
            )
          ],
        ) 
      )
    );
  }
}