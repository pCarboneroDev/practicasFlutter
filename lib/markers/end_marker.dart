import 'package:flutter/material.dart';

class EndMarkerPainter extends CustomPainter {

  final int kilometers;
  final String destination;

  EndMarkerPainter({
    required this.kilometers,
    required this.destination,
  });


  @override
  void paint(Canvas canvas, Size size) {
    final blackPen = Paint()
                      ..color = Colors.black;
    final whitePen = Paint()
                      ..color = Colors.white;
    
    const double circleBlackRadius = 20;
    const double circleWhitekRadius = 7;

    canvas.drawCircle(Offset(size.width * 0.5, size.height - circleBlackRadius), circleBlackRadius, blackPen);
    canvas.drawCircle(Offset(size.width * 0.5, size.height - circleBlackRadius), circleWhitekRadius, whitePen);
  
    // dibujar caja 

    final path = Path();
    path.moveTo(10, 20);
    path.lineTo(size.width - 10, 20);
    path.lineTo(size.width - 10, 100);
    path.lineTo(10, 100);



    // sombra
    canvas.drawShadow(path, Colors.black, 10, false);
  
    canvas.drawPath(path, whitePen);


    // caja negra 
    const blackBox = Rect.fromLTWH(10, 20, 70, 80);
    canvas.drawRect(blackBox, blackPen);


    //textos 55
    final textSpan = TextSpan(
      style: const TextStyle(color: Colors.yellow, fontSize: 30, fontWeight: FontWeight.w400),
      text: '$kilometers'
    );

    final kmPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center
    )..layout(
      minWidth: 70,
      maxWidth: 70
    );

    kmPainter.paint(canvas, const Offset(10, 35));

    //textto minutos
    const textSpanKm = TextSpan(
      style: TextStyle(color: Colors.yellow, fontSize: 20, fontWeight: FontWeight.w200),
      text: 'Km'
    );

    final minutesPainterMinutes = TextPainter(
      text: textSpanKm,
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center
    )..layout(
      minWidth: 70,
      maxWidth: 70
    );

    minutesPainterMinutes.paint(canvas, const Offset(10, 68));


    //Descripcion

    final locationText = TextSpan(
      style: const TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w300),
      text: destination
    );

    final locationPainter = TextPainter(
      maxLines: 2,
      ellipsis: '...',
      text: locationText,
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.left
    )..layout(
      minWidth: size.width - 95,
      maxWidth: size.width - 95
    );

    final double offsetY = (destination.length > 25) ? 35 : 48;

    locationPainter.paint(canvas, Offset(90, offsetY));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(covariant CustomPainter oldDelegate) => false;

}