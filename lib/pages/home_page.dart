import 'package:flutter/material.dart';
import 'package:practicas_flutter/pages/direcciones_page.dart';
import 'package:practicas_flutter/pages/maps_page.dart';
import 'package:practicas_flutter/providers/ui_provider.dart';
import 'package:practicas_flutter/widgets/custom_navigatorBar.dart';
import 'package:practicas_flutter/widgets/scan_button.dart';
import 'package:provider/provider.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Historial'),
        actions: [
          IconButton(
            onPressed: () {
              
            }, 
            icon: Icon(Icons.delete_forever, color: Colors.white,)
          )
        ],
      ),
      body: _HomePageBody(),
      bottomNavigationBar: CustomNavigationBar(),
      floatingActionButton: ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}


class _HomePageBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // obtener selectedMenuOpt
    final uiProvider = Provider.of<UiProvider>(context);
    
    final currentIndex = uiProvider.selectedMenuOpc;

    switch(currentIndex){
      case 0:
        return MapsPage();

      case 1:
        return DireccionesPage();

      default:
        return MapsPage();
    }
  }
}