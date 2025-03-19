import 'package:flutter/material.dart';
import 'package:practicas_flutter/themes/app_theme.dart';

class SliderScreen extends StatefulWidget {
   
  const SliderScreen({super.key});

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {

  double _sliderValue = 100;
  bool _sliderEnable = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Slider & Checks'),
      ),
      body: Column(
        children: [
          Slider.adaptive(
            min: 50,
            max: 400,
            value: _sliderValue, 
            onChanged: _sliderEnable ?
             (value) {
              _sliderValue = value;
              setState(() {});
            }
            : null,
          ),

          Checkbox(
            value: _sliderEnable, 
            onChanged: (value) {
              _sliderEnable = value ?? true;
              setState(() {});
            },
          ),

          Switch.adaptive(
            activeColor: AppTheme.primaryColor2,
            value: _sliderEnable, 
            onChanged: (value) {
              _sliderEnable = value;
              setState(() {});
            },
          ),

          CheckboxListTile(
            title: const Text('Habilitar slider'),
            activeColor: AppTheme.primaryColor2,
            value: _sliderEnable, 
            onChanged: (value) {
              _sliderEnable = value ?? true;
              setState(() {});
            },
          ),

          SwitchListTile.adaptive(
            title: Text('Habilitar slider'),
            activeColor: AppTheme.primaryColor2,
            value: _sliderEnable, 
            onChanged: (value) {
              _sliderEnable = value;
              setState(() {});
            },
          ),

          const AboutListTile(),
      
      
          Expanded(
            child: SingleChildScrollView(
              child: Image(
                fit: BoxFit.contain,
                width: _sliderValue,
                image: NetworkImage('https://static.wikia.nocookie.net/dragonballmultiverse/images/a/a9/Vegeta.png/revision/latest?cb=20130727033745&path-prefix=es'),
              )
            ),
          )
        ],
      )
    );
  }
}