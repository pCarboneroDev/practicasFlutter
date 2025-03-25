import 'package:flutter/material.dart';
import 'package:practicas_flutter/providers/theme_provider.dart';
import 'package:practicas_flutter/share_preferences/preferences.dart';
import 'package:practicas_flutter/widgets/side_menu.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {

  static const routerName = 'Settings';
   
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  //bool isDarkmode = false;
  //int gender = 1;
  //String name = 'Lucifer';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
        title: Text('Settings'),
      ),

      drawer: const SideMenu(),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Ajustes',
                style: TextStyle(fontSize: 45, fontWeight: FontWeight.w300),
              ),
              Divider(),

              SwitchListTile.adaptive(
                value: Preferences.isDarkmode, 
                title: const Text('Darkmode'),
                onChanged: (value) {
                  Preferences.isDarkmode = value;
                  final themeProvider = Provider.of<ThemeProvider>(context, listen: false);

                  value ? themeProvider.setDarkMode() : themeProvider.setLightMode();

                  setState(() {});
                },
              ),

              Divider(),

              RadioListTile<int>(
                value: 1, 
                groupValue: Preferences.gender, 
                title: const Text('Masculino'),
                onChanged: (value) {
                  Preferences.gender = value ?? 1;
                  setState(() {});
                },
              ),

              RadioListTile<int>(
                value: 2, 
                groupValue: Preferences.gender, 
                title: const Text('Femenino'),
                onChanged: (value) {
                  Preferences.gender = value ?? 2;
                  setState(() {});
                },
              ),

              const Divider(),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  initialValue: Preferences.name,
                  decoration: const InputDecoration(
                    labelText: 'Nombre',
                    helperText: 'Nombre de usuario'
                  ),
                  onChanged: (value) {
                    Preferences.name = value;
                    setState(() {});
                  },
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}