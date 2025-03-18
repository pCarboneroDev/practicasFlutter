
import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget{
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int clicks = 0;

    void increaseClicks(){
      clicks++;
      setState(() {});
    }

    void decreaseClicks(){
      clicks--;
      setState(() {});
    }

    void resetClicks(){
      clicks = 0;
      setState(() {});
    }

  @override
  Widget build(BuildContext context) {
    const fontSize35 = const TextStyle(fontSize: 35);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        title: const Text('COUNTER SCREEN', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),), 
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget> [
            const Text('Contador de clicks:', style: fontSize35),
            Text('$clicks', style: TextStyle(fontSize: 45))
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: rowButtons(
        increaseFn: increaseClicks,
        decreaseFn: decreaseClicks,
        resetFn: resetClicks,
      ),
    );
  }
}

class rowButtons extends StatelessWidget {
  final Function increaseFn;
  final Function decreaseFn;
  final Function resetFn;

  const rowButtons({
    super.key, 
    required this.increaseFn, 
    required this.decreaseFn, 
    required this.resetFn,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // boton de restar
        FloatingActionButton(
          backgroundColor: Colors.blue,
          child: const Icon(Icons.minimize, color: Colors.white,),
          onPressed: () => decreaseFn()
          ),
    
          // boton de resetear
          FloatingActionButton(
          backgroundColor: Colors.blue,
          child: const Icon(Icons.restore, color: Colors.white,),
          onPressed: () => resetFn()
          ),
    
        // boton de sumar
        FloatingActionButton(
          backgroundColor: Colors.blue,
          child: const Icon(Icons.add, color: Colors.white,),
          onPressed: () => increaseFn()
          ),
      ],
    );
  }
}