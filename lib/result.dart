import 'package:corona_virus/data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:corona_virus/search_page.dart';

var countryTyped;

void country(textEntered) {
  countryTyped = textEntered;
}

Future<Country> fetchCountry() async {
  final response =
      await http.get('https://corona.lmao.ninja/countries/$countryTyped');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Country.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load result');
  }
}

class CountrySearch extends StatefulWidget {
  @override
  _CountrySearchState createState() => _CountrySearchState();
}

class _CountrySearchState extends State<CountrySearch> {
  Future<Country> futureCountry;

  @override
  void initState() {
    super.initState();
    futureCountry = fetchCountry();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF757575),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
          ),
        ),
        child: Container(
          padding: EdgeInsets.only(left: 10, right: 10, top: 15),
          child: Column(
            children: <Widget>[
              Card(
                elevation: 8,
                child: Center(
                  child: FutureBuilder<Country>(
                    future: futureCountry,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(top: 25),
                              child: Text(
                                "Latest stats for ${snapshot.data.country}",
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.lightGreen,
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
                              height: 25,
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
                                  "Today\'s Cases:  ${snapshot.data.todayCases.toString()}",
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
                                  "Today\'s Deaths:  ${snapshot.data.todayDeaths.toString()}",
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
                                  "Active Cases:  ${snapshot.data.active.toString()}",
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
                              height: 18,
                            ),
                          ],
                        );
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text(
                            """Data currently Unavailable for the specified Country. \nIt is either an error on our side or a whitespace after the country name you typed in.
                             \n Please make sure you have entered the country name without any spaces after it.""",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 22, color: Colors.red),
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
      ),
    );
  }
}
