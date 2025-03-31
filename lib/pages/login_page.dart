import 'package:flutter/material.dart';
import 'package:practicas_flutter/widgets/custom_elevated_button.dart';
import 'package:practicas_flutter/widgets/custom_input.dart';
import 'package:practicas_flutter/widgets/labels.dart';
import 'package:practicas_flutter/widgets/logo.dart';


class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 228, 228, 228),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        
        child: Container(
          height: MediaQuery.of(context).size.height * 0.9,

          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          
            children: [
              Logo(titulo: 'Messenger',),
              _Form(),
              Labels(ruta: 'register', textoCambioRuta: '!Crea una ahora!', textoInfo: '¿No tienes cuenta?',),
          
              Text('Terminos y condiciones de uso', style: TextStyle(
                fontWeight: FontWeight.bold
              ))
            ],
          ),
        ),
      )
   );
  }
}


class _Form extends StatefulWidget {
  const _Form();

  @override
  State<_Form> createState() => __FormState();
}

class __FormState extends State<_Form> {
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 50),

      child: Column(

        children: [
          CustomInput(
            icon: Icons.mail_outline,
            placeholder: 'Mail', 
            textController: emailCtrl,
            keyboardType: TextInputType.emailAddress,
          ),

          CustomInput(
            icon: Icons.lock_outline,
            placeholder: 'Password', 
            textController: passwordCtrl,
            keyboardType: TextInputType.text,
            isPassword: true,
          ),

          CustomElevatedButton(text: 'Ingresar', onPressed: () {
            print(emailCtrl.text);
            print(passwordCtrl.text);
          })
        ],
      ),
    );
  }
}

