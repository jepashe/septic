import 'package:flutter/material.dart';

class SepticPaint extends StatefulWidget {
  final double septicLevel;
  final int firstAlarmLevel;
  final int secondAlarmLevel;

  const SepticPaint(
      {Key? key,
      required this.septicLevel,
      required this.firstAlarmLevel,
      required this.secondAlarmLevel})
      : super(key: key);

  @override
  SepticPaintState createState() => SepticPaintState();
}

class SepticPaintState extends State<SepticPaint> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height * 0.7;
    return Center(
      child: CustomPaint(
        painter: SepticCuston(
            firstAlarmLevel: widget.firstAlarmLevel,
            secondAlarmLevel: widget.secondAlarmLevel,
            septicLevel: widget.septicLevel),
        size: Size(width, height),
      ),
    );
  }
}

class SepticCuston extends CustomPainter {
  final double septicLevel;
  final int firstAlarmLevel;
  final int secondAlarmLevel;

  SepticCuston(
      {required this.septicLevel,
      required this.firstAlarmLevel,
      required this.secondAlarmLevel});

  @override
  void paint(Canvas canvas, Size size) {
    var paintWater = Paint()
      ..color = Colors.blueAccent
      ..style = PaintingStyle.fill;
    var paintWaterTop = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;
    var paintSecondAlarmLevel = Paint()
      ..color = Colors.yellowAccent
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke;
    var paintFirstAlarmLevel = Paint()
      ..color = Colors.redAccent
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke;
    var voidSeptic = Paint()
      ..color = Colors.grey
      ..style = PaintingStyle.fill;
    var voidSepticIn = Paint()
      ..color = Colors.blueGrey
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke;

    const aspect = 0.3;
    const aspectIn = 0.8;

    late Size sizeBigOval;
    if (size.height > size.width) {
      sizeBigOval = Size(size.width, size.width * aspect);
    } else {
      sizeBigOval = Size(size.width, size.height);
    }

    final sizeSmallOval =
        Size(sizeBigOval.width * aspectIn, sizeBigOval.height * aspectIn);

    final smallOvalOffset = Offset(
        (sizeBigOval.width - sizeSmallOval.width) / 2,
        (sizeBigOval.height - sizeSmallOval.height) / 2);

    final currentLevel =
        (size.height - sizeBigOval.height - smallOvalOffset.dy) *
            (1 - (septicLevel / 100));
    final firstLevel = (size.height - sizeBigOval.height - smallOvalOffset.dy) *
        (1 - (firstAlarmLevel / 100));

    final secondLevel =
        (size.height - sizeBigOval.height - smallOvalOffset.dy) *
            (1 - (secondAlarmLevel / 100));

    //Большой цилиндр
    for (double i = 0; i <= size.height - sizeBigOval.height; i++) {
      canvas.drawOval(Offset(0.0, i) & sizeBigOval, voidSeptic);
    }

    //Рисуем внутрянку

    for (double i = 0;
        i <= (size.height - sizeBigOval.height - smallOvalOffset.dy);
        i++) {
      canvas.drawArc(
          Offset(smallOvalOffset.dx, smallOvalOffset.dy + i) & sizeSmallOval,
          3.14,
          3.14,
          false,
          voidSepticIn);
    }

    // Первый уровень

    canvas.drawArc(Offset(smallOvalOffset.dx, firstLevel) & sizeSmallOval, 3.14,
        3.14, false, paintFirstAlarmLevel);

    // Второй уровень
    canvas.drawArc(Offset(smallOvalOffset.dx, secondLevel) & sizeSmallOval,
        3.14, 3.14, false, paintSecondAlarmLevel);

    // Вода
    for (double i = currentLevel;
        i <= (size.height - sizeBigOval.height - smallOvalOffset.dy);
        i++) {
      canvas.drawOval(
          Offset(smallOvalOffset.dx, smallOvalOffset.dy + i) & sizeSmallOval,
          paintWater);
    }
    // Поверхность воды
    canvas.drawOval(Offset(smallOvalOffset.dx, currentLevel) & sizeSmallOval,
        paintWaterTop);
    // Текст
    const textStyle = TextStyle(
      color: Colors.white70,
      fontWeight: FontWeight.w500,
      fontSize: 70,
    );
    final textSpan = TextSpan(
      text: '$septicLevel %',
      style: textStyle,
    );
    final textPainter = TextPainter(
        text: textSpan,
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center);

    textPainter.layout(
      minWidth: 0,
      maxWidth: size.width,
    );
    final xCenter = (size.width - textPainter.width) / 2;
    final yCenter = (size.height - textPainter.height) / 2;
    final offset = Offset(xCenter, yCenter);
    textPainter.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
