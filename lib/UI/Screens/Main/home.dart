import 'package:bioscopify/Blocs/theme.dart';
import 'package:bioscopify/UI/Helper/clips.dart';
import 'package:bioscopify/UI/Screens/Main/movie_list.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../../settings.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context);
    return new Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Container(
            child: _themeChanger.getTheme() == ThemeData.light() ? IconButton(icon: Icon(FontAwesomeIcons.moon, color: Colors.deepOrange), onPressed: () => {_themeChanger.setTheme(ThemeData.dark())},) : IconButton(icon: Icon(FontAwesomeIcons.sun, color: Colors.deepOrange,), onPressed: () => {_themeChanger.setTheme(ThemeData.light())},) 
          ),
        ],
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
