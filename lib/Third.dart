import 'package:flutter/material.dart';
import 'data.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class third extends StatelessWidget {
  final int index;
  third(this.index);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        extendBodyBehindAppBar: true,
        body: Stack(
          children: [
            fullinfo(index),
          ],
        ));
  }
}

class fullinfo extends StatelessWidget {
  Movies myMovies = new Movies();
  final int index;
  fullinfo(this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff0b151f),
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              child: Image.network(
                myMovies.movies[index].link,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    myMovies.movies[index].name,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      RatingBar.builder(
                        initialRating: myMovies.movies[index].rating,
                        itemSize: 15,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: false,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.cyan,
                        ),
                        onRatingUpdate: (rating) {},
                      ),
                      Text(
                        '2.6k review',
                        style: TextStyle(color: Colors.grey, fontSize: 15),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    child: Row(
                      children: [
                        Icon(
                          Icons.access_alarm,
                          color: Colors.grey,
                          size: 15,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text('2h 14m',
                            style: TextStyle(color: Colors.grey, fontSize: 10)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today_outlined,
                        color: Colors.grey,
                        size: 15,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text('2019/12/31',
                          style: TextStyle(color: Colors.grey, fontSize: 10)),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 70,
                    child: SingleChildScrollView(
                      child: Text(myMovies.movies[index].about,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            letterSpacing: 1,
                          )),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
