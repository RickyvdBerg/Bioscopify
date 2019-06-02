import 'package:flutter/material.dart';

class Skeleton extends StatefulWidget {
  final double height;
  final double width;

  Skeleton({Key key, this.height = 20, this.width = 200}) : super(key: key);

  createState() => SkeletonState();
}

class SkeletonState extends State<Skeleton>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  Animation gradientPosition;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: Duration(milliseconds: 1500), vsync: this);

    gradientPosition = Tween<double>(
      begin: -3,
      end: 10,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.linear),
    )..addListener(() {
        setState(() {});
      });

    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
    
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey[700],
              blurRadius: 3,
            ),
          ],
          borderRadius: BorderRadius.all(Radius.circular(20)),
          gradient: LinearGradient(
              begin: Alignment(gradientPosition.value, 0),
              end: Alignment(-1, 0),
              colors: [Colors.grey[500], Colors.grey[400], Colors.grey[300]])),
    );
  }
}
