import 'package:bioscopify/Model/movie.dart';
import 'package:bioscopify/Service/api_service.dart';
import 'package:bioscopify/UI/movie_detail.dart';
import 'package:bioscopify/settings.dart';
import 'package:bioscopify/util/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CurrentMoviesList extends StatelessWidget {
  final int code;
  CurrentMoviesList(this.code);

  @override
  Widget build(BuildContext context) {
    var service = new APIService();
    return Container(
      child: FutureBuilder(
          future: code == 1
              ? service.getMoviePlayingList()
              : service.getMovieUpcomingList(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return new Text('loading...');
              default:
                if (snapshot.hasError)
                  return new Text('Error: ${snapshot.error}');
                else
                  return createListView(context, snapshot);
            }
          }),
    );
  }

  Widget createListView(BuildContext context, AsyncSnapshot snapshot) {
    final List<Movie> values = snapshot.data;
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.fromLTRB(15, 20, 20, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                code == 1 ? "In theathers" : "Upcoming",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.deepOrange,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "More ...",
                textAlign: TextAlign.end,
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.deepOrange,
                    fontWeight: FontWeight.w300),
              ),
            ],
          ),
        ),
        Flexible(
          child: ListView.builder(
            itemCount: values.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.fromLTRB(6, 6, 6, 6),
                child: new Stack(
                  children: <Widget>[
                    Ink(
                      child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        MovieDetail(values[index])));
                          },
                          splashColor: Colors.deepOrangeAccent,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 3,
                          ),
                        ],
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: BioscopifyUtils.imageCheck(values[index].urlPoster)),
                      ),
                      width: 130,
                      height: 190,
                    ),
                    Positioned(
                        bottom: 15,
                        right: 0,
                        child: Container(
                          padding: EdgeInsets.fromLTRB(4, 2, 4, 2),
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 2,
                                    spreadRadius: 3,
                                    color: Colors.black45)
                              ],
                              color: BioscopifyUtils.ratingcheck(values[index].score),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              border:
                                  Border.all(color: Colors.white10, width: 1)),
                          child: Text(values[index].score.toString(), style: TextStyle(color: Colors.white),),
                        )),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }


}
