import 'package:flutter/material.dart';

class ClippingClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var firstControlPoint = new Offset(size.width / 100 * 60, size.height - 30);
    var firstEndPoint = new Offset(size.width / 100 * 50, size.height - 15);

    var secondControlPoint = new Offset(size.width / 100 * 40, size.height);
    var secondEndPoint = new Offset(size.width / 100 * 30, size.height);

    var path = Path();
    path.lineTo(0.0, 0.0);
    path.lineTo(size.width, 0.0);
    path.lineTo(size.width, size.height - 30);
    path.lineTo(size.width / 100 * 70, size.height - 30);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width / 100 * 30, size.height);
    path.lineTo(0.0, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}