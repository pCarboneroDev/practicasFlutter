import 'package:flutter/material.dart';

class ScrollScreen extends StatelessWidget {
   
  const ScrollScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        children: [
          Page1(),
          Page2(),
          Page1(),
          Page1(),
        ],
      )
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //bg image
        BackGround(),
        //main content
        MainContent()
      ],
    );
  }
}

class MainContent extends StatelessWidget {
  const MainContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(color: Colors.white, fontSize: 60, fontWeight: FontWeight.bold);
    
    return SafeArea(
      bottom: false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 30,),
          Text('11º', style: textStyle),
          Text('Miércoles', style: textStyle),
          Expanded(child: Container()),
          Icon(Icons.keyboard_arrow_down, color: Colors.white, size: 100,)
        ],
      ),
    );
  }
}

class BackGround extends StatelessWidget {
  const BackGround({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      alignment: Alignment.topCenter,
      color: Color.fromARGB(255, 97, 214, 243),
      child: Image(image: AssetImage('assets/scroll-1.png'))
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 97, 214, 243),
      child: Center(
        child: TextButton(
          onPressed: () => (), 
          style: TextButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 2, 68, 85),
          ),
          child: Text('Bienvenido', style: TextStyle(color: Colors.white, fontSize: 30),),
      ),
      ),
    );
  }
}




