import 'package:flutter/material.dart';
import 'package:practicas_flutter/themes/app_theme.dart';

class ListView2Screen extends StatelessWidget {

  final options = const ['Bayonetta', 'TES V: Skyrim', 'TES IV: Oblivion', 'TES III: Morrowind'];
   
  const ListView2Screen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView 2'),
      ),

      body: ListView.separated(
        itemBuilder: (context, index) => ListTile(
          title: Text(options[index]),
          leading: Icon(Icons.gamepad, color: AppTheme.primaryColor2),
          trailing: Icon(Icons.arrow_forward_ios_outlined, color: AppTheme.primaryColor2),
          onTap: () {
            print(options[index]);
          },
        ), 
        separatorBuilder: (_, __) => const Divider(), 
        itemCount: options.length
      )
    );
  }
}