import 'package:bioscopify/Model/movie.dart';
import 'package:bioscopify/UI/Helper/clips.dart';
import 'package:bioscopify/util/utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class MovieDetail extends StatelessWidget {
  final Movie movie;

  MovieDetail(this.movie);

  @override
  Widget build(BuildContext context) {
    var formatter = new DateFormat('yyyy');
    var releaseDate = formatter.format(movie.releaseDate);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
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
                        height: 220,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: BioscopifyUtils.imageCheck(
                                    movie.urlBackdrop))),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 170,
                    right: 8.0,
                    child: SizedBox(
                      height: 70.0,
                      width: 140.0,
                      child: FittedBox(
                        child: Row(
                          children: <Widget>[
                            Text(
                              movie.score.toString() + ' / 10 ',
                              style: TextStyle(
                                  color: Colors.deepOrange,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ],
                        ),
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 30,
                    left: 8.0,
                    child: SizedBox(
                      width: 38,
                      height: 38,
                      child: FloatingActionButton(
                        child: Icon(
                          FontAwesomeIcons.arrowLeft,
                          color: Colors.deepOrange,
                          size: 20,
                        ),
                        backgroundColor: Colors.white,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.fromLTRB(16, 5, 16, 5),
                decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black87,
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      movie.title,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 6, 0, 6),
                      color: Colors.deepOrange[50],
                      width: MediaQuery.of(context).size.width * 0.2,
                      height: 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          releaseDate,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontStyle: FontStyle.italic),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black87,
                          blurRadius: 3,
                        ),
                      ],
                    ),
                    height: MediaQuery.of(context).size.height * 0.60,
                  ),
                  Container(
                    color: Colors.white,
                    child: Container(
                      margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.all(10),
                                width: 140,
                                height: 210,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 3,
                                      ),
                                    ],
                                    image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: BioscopifyUtils.imageCheck(
                                            movie.urlPoster))),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(8, 16, 8, 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "Genres",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(right: 5),
                                          decoration: BoxDecoration(
                                              color: Colors.green[300],
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          padding: EdgeInsets.all(5),
                                          child: Text(
                                            "Drama",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 9,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(right: 5),
                                          decoration: BoxDecoration(
                                              color: Colors.red[900],
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          padding: EdgeInsets.all(5),
                                          child: Text(
                                            "Action",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 9,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(right: 5),
                                          decoration: BoxDecoration(
                                              color: Colors.blue[600],
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          padding: EdgeInsets.all(5),
                                          child: Text(
                                            "Comedy",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 9,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 10),
                                      child: Text(
                                        "Director",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      child: Text(
                                        "Chad Stahelski",
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontSize: 11,
                                            fontWeight: FontWeight.w400),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 3,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 10),
                                      child: Text(
                                        "Cast",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      child: Text(
                                        "Keanu Reeves, Halle Berry, Ian McShane, Laurence Fishburne, Anjelica Huston",
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontSize: 11,
                                            fontWeight: FontWeight.w400),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 3,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 10),
                                      child: Text(
                                        "Screentime",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      child: Text(
                                        "2h 11min",
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontSize: 11,
                                            fontStyle: FontStyle.italic,
                                            fontWeight: FontWeight.w400),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 3,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(
                                MediaQuery.of(context).size.width * 0.05,
                                0,
                                MediaQuery.of(context).size.width * 0.05,
                                0),
                            child: Text(
                              "Overview",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(
                                MediaQuery.of(context).size.width * 0.05,
                                0,
                                MediaQuery.of(context).size.width * 0.05,
                                0),
                            color: Colors.deepOrange[500],
                            width: MediaQuery.of(context).size.width * 0.2,
                            height: 2,
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(
                                MediaQuery.of(context).size.width * 0.05,
                                10,
                                MediaQuery.of(context).size.width * 0.05,
                                10),
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: Text(
                              movie.overview,
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 6,
                            ),
                          ),
                          Center(
                            child: OutlineButton(
                              borderSide: BorderSide(color: Colors.deepOrange),
                              child: Text("Continue reading"),
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      new BorderRadius.circular(30.0)),
                              onPressed: () {},
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
