import 'package:bioscopify/Blocs/theme.dart';
import 'package:bioscopify/Model/movie.dart';
import 'package:bioscopify/Service/api_service.dart';
import 'package:bioscopify/UI/Helper/skeleton.dart';
import 'package:bioscopify/UI/Screens/Detail/movie_detail.dart';
import 'package:bioscopify/util/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
                return createListView(context, snapshot, true);
              default:
                if (snapshot.hasError)
                  return new Text('Error: ${snapshot.error}');
                else
                  return createListView(context, snapshot, false);
            }
          }),
    );
  }

  Widget createListView(
      BuildContext context, AsyncSnapshot snapshot, bool isLoading) {
    ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context);
    final List<Movie> values = snapshot.data ?? new List<Movie>();

    if (isLoading) {
      for (int i = 0; i < 10; i++) {
        values.add(new Movie());
      }
    }

    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.fromLTRB(10, 20, 20, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    code == 1 ? "In theathers" : "Upcoming",
                    textAlign: TextAlign.start,
                    style: _themeChanger.getTheme().textTheme.display1,
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 2, 0, 5),
                    width: 50,
                    height: 2,
                    color: Colors.deepOrange,
                  ),
                ],
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
                child: isLoading
                    ? Container(
                        child: Skeleton(
                          width: 130,
                          height: 190,
                        ),
                    )
                    : Stack(
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              boxShadow: [
                                BoxShadow(
                                  color: _themeChanger
                                      .getTheme()
                                      .dialogBackgroundColor,
                                  blurRadius: 3,
                                ),
                              ],
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: BioscopifyUtils.imageCheck(
                                      values[index].urlPoster)),
                            ),
                            width: 130,
                            height: 190,
                          ),
                          Positioned.fill(
                            child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(4, 2, 4, 2),
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 2,
                                            spreadRadius: 3,
                                            color: Colors.black45)
                                      ],
                                      color: BioscopifyUtils.ratingcheck(
                                          values[index].score),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      border: Border.all(
                                          color: Colors.white10, width: 1)),
                                  child: Text(
                                    values[index].score.toString(),
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )),
                          ),
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
