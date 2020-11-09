import 'package:corona_virus/result.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:corona_virus/data.dart';
import 'package:intl/intl.dart';

String time() {
  var now = new DateTime.now();
  var formatter = new DateFormat('dd-MMMM-yyyy').add_jm();
  String formatted = formatter.format(now);
  return formatted;
}

Future<World> fetchWorld() async {
  final response = await http.get('https://corona.lmao.ninja/all');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return World.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load Data');
  }
}

class SearchPage extends StatefulWidget {
  SearchPage({Key key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  Future<World> futureWorld;

  @override
  void initState() {
    super.initState();
    futureWorld = fetchWorld();
  }

  String countryEntered;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF8cba51),
      appBar: MyCustomAppBar(
        height: 100,
      ),
      body: Container(
        margin: EdgeInsets.only(top: 50),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(60),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black54,
              blurRadius: 28,
              spreadRadius: -9,
              offset: Offset(
                3, //vertical
                0, //horizontal
              ),
            ),
          ],
        ),
        child: SafeArea(
          child: ListView(
            children: <Widget>[
              Container(
                height: 250,
                margin: EdgeInsets.only(
                  top: 90,
                ),
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  children: <Widget>[
                    Card(
                      elevation: 8,
                      child: Center(
                        child: FutureBuilder<World>(
                          future: futureWorld,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return Column(
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(top: 25),
                                    child: Text(
                                      "Across the globe",
                                      style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      "Today: ${time()}",
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 22,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      CircleAvatar(
                                        child: Icon(
                                          Icons.show_chart,
                                          color: Colors.white,
                                        ),
                                        backgroundColor: Color(0xFF8cba51),
                                        radius: 15,
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                        "Cases:  ${snapshot.data.cases.toString()}",
                                        style: TextStyle(
                                          fontSize: 22,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      CircleAvatar(
                                        child: Icon(
                                          Icons.show_chart,
                                          color: Colors.white,
                                        ),
                                        backgroundColor: Color(0xFF8cba51),
                                        radius: 15,
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                        "Deaths:  ${snapshot.data.deaths.toString()}",
                                        style: TextStyle(
                                          fontSize: 22,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      CircleAvatar(
                                        child: Icon(
                                          Icons.show_chart,
                                          color: Colors.white,
                                        ),
                                        backgroundColor: Color(0xFF8cba51),
                                        radius: 15,
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                        "Recovered:  ${snapshot.data.recovered.toString()}",
                                        style: TextStyle(
                                          fontSize: 22,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ],
                              );
                            } else if (snapshot.hasError) {
                              return Center(
                                child: Text(
                                  "Data currently Unavailable",
                                  style: TextStyle(
                                    fontSize: 22,
                                  ),
                                ),
                              );
                            }

                            // By default, show a loading spinner.
                            return CircularProgressIndicator();
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 50, right: 50, top: 10),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 18,
                    ),
                    Container(
                      width: 400,
                      child: TextField(
                        textAlign: TextAlign.center,
                        onChanged: (newText) {
                          countryEntered = newText;
                        },
                        cursorColor: Colors.lightGreen,
                        cursorWidth: 8,
                        autofocus: false,
                        decoration: InputDecoration(
                          hintText: "Fetch Data for a specific Country",
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.lightGreen),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.lightGreen),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        color: Colors.lightGreen,
                        disabledColor: Colors.lightGreen,
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) => CountrySearch(),
                          );
                          country(countryEntered);
                        },
                        child: Container(
                          padding: EdgeInsets.all(15),
                          child: Text(
                            "Submit",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyCustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;

  const MyCustomAppBar({
    Key key,
    @required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(top: 66, left: 30),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Color(0xFF8cba51),
                ),
                onPressed: () {
                  Navigator.pop(context);
                }),
          ),
        ),
        SizedBox(
          width: 50,
        ),
        Container(
          margin: EdgeInsets.only(top: 70),
          padding: EdgeInsets.only(bottom: 10),
          child: Center(
            child: Text(
              "Live Stats",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 40,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}

//Error if not data: ${snapshot.error}
