import 'package:flutter/material.dart';
import 'package:wisata_bandung/tourism_place.dart';

var informationTextStyle = TextStyle(fontFamily: 'Oxygen');

class DetailScreen extends StatelessWidget {
  final TourismPlace place;

  DetailScreen(@required this.place, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Stack(
            children: [
              Image.asset(place.imageAsset),
              SafeArea(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey,
                      child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          )),
                    ),
                    FavoriteButton()
                  ],
                ),
              ))
            ],
          ),
          Container(
              margin: EdgeInsets.only(top: 16.0),
              child: Text(
                place.name,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Staatliches'),
              )),
          Container(
            margin: EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(children: <Widget>[
                  Icon(Icons.calendar_today),
                  SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    place.openDays,
                    style: informationTextStyle,
                  ),
                ]),
                Column(children: <Widget>[
                  Icon(Icons.timer),
                  SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    place.openTime,
                    style: informationTextStyle,
                  ),
                ]),
                Column(children: <Widget>[
                  Icon(Icons.money),
                  SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    place.ticketPrice,
                    style: informationTextStyle,
                  ),
                ]),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Berada di jalur utama Bandung-Lembang, Fam House menjadi objek wisata yang tidak ada apa-apanya',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16.0),
            ),
          ),
          Container(
            height: 150,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Image.network(
                      'https://media-cdn.tripadvisor.com/media/photo-s/0d/7c/59/70/farmhouse-lembang.jpg'),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Image.network(
                      'https://media-cdn.tripadvisor.com/media/photo-w/13/f0/22/f6/photo3jpg.jpg'),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Image.network(
                      'https://media-cdn.tripadvisor.com/media/photo-m/1280/16/a9/33/43/liburan-di-farmhouse.jpg'),
                ),
              ],
            ),
          ),
        ],
      ))),
    );
  }
}

class FavoriteButton extends StatefulWidget {
  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          setState(() {
            isFavorite = !isFavorite;
          });
        },
        icon: Icon(
          isFavorite ? Icons.favorite :  Icons.favorite_border,
          color: Colors.red,
        )
      );
  }
}
