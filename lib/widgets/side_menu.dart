import 'package:flutter/material.dart';
import 'package:practicas_flutter/screens/screens.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          _DrawerHeader(),

          ListTile(
            leading: Icon(Icons.pages_outlined),
            title: const Text('Home'),
            onTap: () {
              Navigator.pushReplacementNamed(context, HomeScreen.routerName);
            },
          ),

          ListTile(
            leading: Icon(Icons.people_outline),
            title: const Text('People'),
            onTap: () {

            },
          ),

          ListTile(
            leading: Icon(Icons.settings_outlined),
            title: const Text('Settings'),
            onTap: () {
              // cerrar menu
              //Navigator.pop(context);
              Navigator.pushReplacementNamed(context, SettingsScreen.routerName);
            },
          )
        ],
      ),
    );
  }
}

class _DrawerHeader extends StatelessWidget {
  const _DrawerHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/menu-img.jpg'),
          fit: BoxFit.cover
        ),
      ),
      child: Container(),
    );
  }
}