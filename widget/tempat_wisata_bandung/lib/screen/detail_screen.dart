import 'package:flutter/material.dart';
import 'package:tempat_wisata_bandung/model/tourism_place.dart';

var informationTextStyle = TextStyle(fontFamily: 'Oxygen');
var titleTextStyle = TextStyle(fontFamily: 'Staatliches', fontSize: 32);

class DetailScreen extends StatelessWidget {
  final TourismPlace place;

  DetailScreen({@required this.place});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth > 800) {
        return DetailWebPage(place: place);
      } else {
        return DetailMobilePage(place: place);
      }
    });
  }
}

class DetailMobilePage extends StatelessWidget {
  final TourismPlace place;

  DetailMobilePage({@required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Image.asset(place.imageAsset),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          child: IconButton(
                              icon: Icon(Icons.arrow_back),
                              color: Colors.blueGrey,
                              onPressed: () {
                                Navigator.pop(context);
                              }),
                        ),
                        FavoriteButton(),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Container(
              child: Text(
                place.name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30.0,
                  fontFamily: 'Staatliches',
                ),
              ),
              margin: EdgeInsets.only(top: 16.0),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    width: 100.0,
                    padding: place.openDays.length > 14
                        ? EdgeInsets.only(top: 16.0)
                        : EdgeInsets.all(0.0),
                    child: Column(
                      children: <Widget>[
                        Icon(Icons.calendar_today),
                        SizedBox(height: 8.0),
                        Text(
                          place.openDays,
                          style: informationTextStyle,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 100.0,
                    child: Column(
                      children: <Widget>[
                        Icon(Icons.access_time_rounded),
                        SizedBox(height: 8.0),
                        Text(
                          place.openTime,
                          style: informationTextStyle,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 100.0,
                    child: Column(
                      children: <Widget>[
                        Icon(Icons.monetization_on_rounded),
                        SizedBox(height: 8.0),
                        Text(
                          place.ticketPrice,
                          style: informationTextStyle,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              margin: EdgeInsets.symmetric(vertical: 16.0),
            ),
            Container(
              child: Text(
                place.description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              margin: EdgeInsets.only(left: 8.0, right: 8.0),
            ),
            SizedBox(height: 14.0),
            Container(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: place.imageUrls.map((url) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4.0),
                      child: Image.network(url),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailWebPage extends StatefulWidget {
  final TourismPlace place;

  DetailWebPage({@required this.place});

  @override
  _DetailWebPageState createState() => _DetailWebPageState();
}

class _DetailWebPageState extends State<DetailWebPage> {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 64,
        ),
        child: Center(
          child: Container(
            width: 1440.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Wisata Bandung',
                  style: titleTextStyle,
                ),
                SizedBox(height: 16.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 4.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(widget.place.imageAsset),
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Container(
                            height: 150,
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Scrollbar(
                              isAlwaysShown: true,
                              controller: _scrollController,
                              child: ListView(
                                controller: _scrollController,
                                scrollDirection: Axis.horizontal,
                                children: widget.place.imageUrls.map((url) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        top: 4.0, bottom: 4.0, right: 8.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(4.0),
                                      child: Image.network(url),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Card(
                          child: Container(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Stack(
                                  alignment: Alignment.topRight,
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      child: Text(
                                        widget.place.name,
                                        textAlign: TextAlign.center,
                                        style: titleTextStyle,
                                      ),
                                    ),
                                    FavoriteButton(),
                                  ],
                                ),
                                SizedBox(height: 4.0),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Icon(Icons.calendar_today),
                                    SizedBox(width: 8.0),
                                    Text(
                                      widget.place.openDays,
                                      style: informationTextStyle,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 4.0),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Icon(Icons.access_time_rounded),
                                    SizedBox(width: 8.0),
                                    Text(
                                      widget.place.openTime,
                                      style: informationTextStyle,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 4.0),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Icon(Icons.monetization_on_rounded),
                                    SizedBox(width: 8.0),
                                    Text(
                                      widget.place.ticketPrice,
                                      style: informationTextStyle,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 4.0),
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 8.0),
                                  child: Text(
                                    widget.place.description,
                                    textAlign: TextAlign.left,
                                    style: informationTextStyle,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
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
    return CircleAvatar(
      backgroundColor: Colors.white,
      child: IconButton(
          icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
          color: Colors.red,
          onPressed: () {
            setState(() {
              isFavorite = !isFavorite;
            });
          }),
    );
  }
}
