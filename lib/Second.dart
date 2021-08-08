import 'package:flutter/material.dart';
import 'data.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'Third.dart';

class second extends StatelessWidget {
  Movies myMovies = new Movies();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Now Playing',
          style: TextStyle(color: Colors.cyan),
        ),
        backgroundColor: Color(0xff121b28),
      ),
      body: Container(
        color: Color(0xff0b151f),
        width: double.infinity,
        height: double.infinity,
        child: ListView.builder(
          itemBuilder: (context, index) {
            return GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => third(index)));
                },
                child: card(index));
          },
          itemCount: myMovies.movies.length,
        ),
      ),
    );
  }
}

class card extends StatelessWidget {
  Movies myMovies = new Movies();
  final int index;
  card(this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              height: 125,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
              child: Image.network(
                myMovies.movies[index].link,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  myMovies.movies[index].name,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    RatingBar.builder(
                      initialRating: myMovies.movies[index].rating,
                      itemSize: 10,
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
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.access_alarm,
                      color: Colors.grey,
                      size: 15,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text('2h 14m',
                        style: TextStyle(color: Colors.grey, fontSize: 10)),
                  ],
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
                      width: 15,
                    ),
                    Text('2019/12/31',
                        style: TextStyle(color: Colors.grey, fontSize: 10)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
