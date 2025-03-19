import 'package:flutter/material.dart';
import 'package:practicas_flutter/router/app_routes.dart';
import 'package:practicas_flutter/themes/app_theme.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Componentes en Flutter'),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => 
        ListTile(
          leading: Icon(AppRoutes.menuOptions[index].icon, color: AppTheme.primaryColor2),
          title: Text(AppRoutes.menuOptions[index].name),
          onTap: () {
            Navigator.pushNamed(context, AppRoutes.menuOptions[index].route);
          },
        ), 
        separatorBuilder: (_, __) => Divider(), 
        itemCount: AppRoutes.menuOptions.length)
    );
  }
}