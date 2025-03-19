import 'package:flutter/material.dart';
import 'package:practicas_flutter/widgets/widgets.dart';

class InputsScreen extends StatelessWidget {
   
  const InputsScreen({super.key});
  
  @override
  Widget build(BuildContext context) {

    final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();

    final Map<String, String> formValues = {
      'first_name' : 'Pablo',
      'last_name'  : 'Carbonero',
      'email'      : 'pablo@gmail.com',
      'password'   : '123456',
      'role'       :  'Admin'
    };

    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs y forms'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Form(
            key: myFormKey,
            child: Column(
              children: [
                CustomInputField(
                  labelText: 'Nombre',
                  hintText: 'Nombre del usuario', 
                  formProperty: 'first_name', 
                  formValues: formValues
                ),
                SizedBox(height: 30,),
            
                CustomInputField(
                  labelText: 'Apellidos',
                  hintText: 'Apellidos del usuario',
                  formProperty: 'last_name', 
                  formValues: formValues
                ),
                SizedBox(height: 30,),
            
                CustomInputField(
                  labelText: 'Correo',
                  hintText: 'Correo del usuario',
                  keyboardType: TextInputType.emailAddress,
                  formProperty: 'email', 
                  formValues: formValues
                ),
                SizedBox(height: 30,),
            
                CustomInputField(
                  labelText: 'Contraseña',
                  hintText: 'Contraseña del usuario',
                  keyboardType: TextInputType.emailAddress,
                  obscureText: true,
                  formProperty: 'password', 
                  formValues: formValues
                ),
                SizedBox(height: 30,),

                DropdownButtonFormField(
                  items: [
                    DropdownMenuItem(value: 'Admin', child: const Text('Admin')),
                    DropdownMenuItem(value: 'Superuser', child: const Text('Super User')),
                    DropdownMenuItem(value: 'Dev', child: const Text('Developer')),
                    DropdownMenuItem(value: 'JuniorDev', child: const Text('Junior developer'))
                  ], 
                  onChanged: (value) {
                    formValues['role'] = value ?? 'Admin';
                  },
                ),
                SizedBox(height: 30,),
            
                ElevatedButton(
                  onPressed: () {
                    FocusScope.of(context).requestFocus(FocusNode());

                    if (!myFormKey.currentState!.validate()){
                      print('Form no valido');
                      return;
                    }
                    print(formValues);
                  },
                  child: SizedBox(
                    width: double.infinity,
                    child: Center(child: const Text('Guardar'))
                  )
                ),


              ],
            ),
          ),
        ),
      )
    );
  }
}