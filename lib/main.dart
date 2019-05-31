import 'package:bioscopify/UI/movie_list.dart';
import 'package:bioscopify/settings.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage()
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          leading: Icon(
            Icons.menu,
            color: Colors.deepOrange,
          ),
          backgroundColor: Colors.white,
          title: Text(
            "Bioscopify",
            style: TextStyle(color: Colors.deepOrange),
          ),
          elevation: 20,
        ),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 0.0),
                      child: ClipPath(
                        clipper: ClippingClass(),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Container(
                          height: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(Settings.API_IMAGE_URL +
                                    "/v4yVTbbl8dE1UP2dWu5CLyaXOku.jpg")),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 150,
                      right: 8.0,
                      child: SizedBox(
                        height: 70.0,
                        width: 140.0,
                        child: FittedBox(
                          child: Row(
                            children: <Widget>[
                              Text(
                                'Most Populair',
                                style: TextStyle(
                                    color: Colors.deepOrange,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                              IconButton(
                                icon: Icon(
                                  FontAwesomeIcons.fire,
                                  color: Colors.deepOrange,
                                ),
                                onPressed: () {
                                  print("xd");
                                },
                              ),
                            ],
                          ),
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(child: CurrentMoviesList(1)),
                Expanded(child: CurrentMoviesList(0)),
              ],
            ),
          ),
        ),
      );
  }
}

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
