import 'package:flutter/material.dart';

class DemoCustomPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {

    var paint = Paint()
    ..strokeWidth = 2.0
    ..color = Colors.green
        ..style = PaintingStyle.fill;

    var circlePaint = Paint()
      ..strokeWidth = 2.0
      ..color = Colors.yellow
      ..style = PaintingStyle.fill;

    canvas.drawRect(Rect.fromCircle(center: Offset(size.width/2, size.height/2), radius: 88), paint);
    canvas.drawCircle(Offset(size.width/2, size.height/2), 88, circlePaint);

    // canvas.drawLine(Offset(0,200), Offset(50,0), paint);
    // canvas.drawLine(Offset(50,0), Offset(250,0), paint);
    // canvas.drawLine(Offset(250,0), Offset(250,200), paint);
    // canvas.drawLine(Offset(250,200), Offset(0,200), paint);


  }


  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
  
}

class CustomPainterDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: CustomPaint(
          size: Size(300,300),
          painter: DemoCustomPainter(),
        ),
      ),
    );
  }
}
