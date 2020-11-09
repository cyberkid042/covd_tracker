import 'package:flutter/material.dart';
import 'package:corona_virus/tips.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: MyCustomAppBar(
        height: 250,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            child: myHeadingText,
          ),
          SizedBox(
            height: 45,
          ),
          Container(
            child: h1Text,
          ),
          SizedBox(
            height: 3,
          ),
          Container(
            child: captionText,
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            padding: EdgeInsets.only(left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: bulletPoint,
                ),
                Expanded(
                  flex: 20,
                  child: point1,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Container(
            padding: EdgeInsets.only(left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: bulletPoint,
                ),
                Expanded(
                  flex: 20,
                  child: point2,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Container(
            padding: EdgeInsets.only(left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: bulletPoint,
                ),
                Expanded(
                  flex: 20,
                  child: point3,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Container(
            padding: EdgeInsets.only(left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: bulletPoint,
                ),
                Expanded(
                  flex: 20,
                  child: point4,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Container(
            padding: EdgeInsets.only(left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: bulletPoint,
                ),
                Expanded(
                  flex: 20,
                  child: point5,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Container(
            padding: EdgeInsets.only(left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: bulletPoint,
                ),
                Expanded(
                  flex: 20,
                  child: point6,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Container(
            padding: EdgeInsets.only(left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: bulletPoint,
                ),
                Expanded(
                  flex: 20,
                  child: point7,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Container(
            padding: EdgeInsets.only(left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: bulletPoint,
                ),
                Expanded(
                  flex: 20,
                  child: point8,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Container(
            padding: EdgeInsets.only(left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: bulletPoint,
                ),
                Expanded(
                  flex: 20,
                  child: point9,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Container(
            padding: EdgeInsets.only(left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: bulletPoint,
                ),
                Expanded(
                  flex: 20,
                  child: point10,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Color(0xFF8cba51),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Container(
              child: conc,
            ),
          ),
        ],
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
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(
            top: 150,
            bottom: 75,
          ),
          decoration: BoxDecoration(
            color: Color(0xFF8cba51),
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(100),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black54,
                blurRadius: 45,
                spreadRadius: 2,
                offset: Offset(
                  15,
                  -1,
                ),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Text(
                  "TIPS",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                width: 120,
              ),
//              IconButton(
//                icon: Icon(
//                  Icons.line_style,
//                  color: Colors.white,
//                  size: 35,
//                ),
//                onPressed: null,
//              ),
//              SizedBox(
//                width: 6,
//              ),
              CircleAvatar(
                radius: 23,
                backgroundColor: Colors.white,
                child: IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Colors.lightGreen,
                    size: 35,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, "/search");
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
