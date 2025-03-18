
import 'package:flutter/material.dart';
import 'package:practicas_flutter/models/models.dart';

import '../screens/screens.dart';

class AppRoutes {
  static const initialRoute = 'home';

  static final menuOptions = <MenuOption>[
    // TODO: borrar home
    MenuOption(route: 'home', icon: Icons.home, name: 'homeScreen', screen: const HomeScreen()),
    MenuOption(route: 'listView1', icon: Icons.stairs_outlined, name: 'listView1', screen: const ListView1Screen()),
    MenuOption(route: 'listView2', icon: Icons.stairs_rounded, name: 'listView2', screen: const ListView2Screen()),
    MenuOption(route: 'alert', icon: Icons.bus_alert, name: 'alert', screen: const AlertScreen()),
    MenuOption(route: 'card', icon: Icons.card_giftcard, name: 'card', screen: const CardScreen())
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes(){
    Map<String, Widget Function(BuildContext)> appRoutes = {};

    for (var option in menuOptions) {
      appRoutes.addAll({option.route: (BuildContext context) => option.screen});
    }

    return appRoutes;
  }
  /*static Map<String, Widget Function(BuildContext)> routes = {
        'home': (BuildContext context) => HomeScreen(),
        'listView1': (BuildContext context) => ListView1Screen(),
        'listView2': (BuildContext context) => ListView2Screen(),
        'alert': (BuildContext context) => AlertScreen(),
        'card': (BuildContext context) => CardScreen(),
  };*/

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
        return MaterialPageRoute(builder: (context) => const AlertScreen());
      }
}