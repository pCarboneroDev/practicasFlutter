
import 'package:flutter/material.dart';
import 'package:practicas_flutter/models/models.dart';

import '../screens/screens.dart';

class AppRoutes {
  static const initialRoute = 'home';

  static final menuOptions = <MenuOption>[
    //MenuOption(route: 'home', icon: Icons.home, name: 'homeScreen', screen: const HomeScreen()),
    MenuOption(route: 'listView1', icon: Icons.stairs_outlined, name: 'List View 1', screen: const ListView1Screen()),
    MenuOption(route: 'listView2', icon: Icons.stairs_rounded, name: 'List View 2', screen: const ListView2Screen()),
    MenuOption(route: 'alert', icon: Icons.bus_alert, name: 'Alerta', screen: const AlertScreen()),
    MenuOption(route: 'card', icon: Icons.card_giftcard, name: 'Cards', screen: const CardScreen()),
    MenuOption(route: 'avatar', icon: Icons.people, name: 'Avatar', screen: AvatarScreen()),
    MenuOption(route: 'animated', icon: Icons.play_arrow_outlined, name: 'Animación', screen: AnimatedScreen()),
    MenuOption(route: 'input', icon: Icons.input_rounded, name: 'Inputs', screen: InputsScreen()),
    MenuOption(route: 'slider', icon: Icons.social_distance_rounded, name: 'Slider screen', screen: SliderScreen()),
    MenuOption(route: 'listviewBuilder', icon: Icons.build_circle, name: 'Infinite Scroll', screen: ListviewBuilderScreen()),
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes(){
    Map<String, Widget Function(BuildContext)> appRoutes = {};
    appRoutes.addAll({'home': (BuildContext context) => HomeScreen()});

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