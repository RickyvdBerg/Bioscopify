import 'package:bioscopify/Blocs/theme.dart';
import 'package:bioscopify/UI/Helper/clips.dart';
import 'package:bioscopify/UI/Screens/Main/movie_list.dart';
import 'package:bioscopify/UI/Themes/night.dart';
import 'package:bioscopify/UI/Themes/sunrise.dart';
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
            child: _themeChanger.getTheme() == sunriseTheme() ? IconButton(icon: Icon(FontAwesomeIcons.moon, color: Colors.deepOrange), onPressed: () => {_themeChanger.setTheme(nightTheme())},) : IconButton(icon: Icon(FontAwesomeIcons.sun, color: Colors.deepOrange,), onPressed: () => {_themeChanger.setTheme(sunriseTheme())},) 
          ),
        ],
        leading: Icon(
          Icons.menu,
          color: Colors.deepOrange,
        ),
        backgroundColor: _themeChanger.getTheme().backgroundColor,
        title: Text(
          "Bioscopify",
          style: _themeChanger.getTheme().textTheme.title,
        ),
        elevation: 20,
      ),
      backgroundColor: _themeChanger.getTheme().backgroundColor,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      border: Border(bottom: BorderSide(width: 1, color: Colors.deepOrange))
                      ),
                    child: Padding(
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
                              style: _themeChanger.getTheme().textTheme.title,
                            ),
                            IconButton(
                              icon: Icon(
                                FontAwesomeIcons.fire,
                                color: Colors.white,
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
