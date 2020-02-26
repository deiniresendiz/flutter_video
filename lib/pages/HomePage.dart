import 'package:flutter/material.dart';
import 'package:video_flayer/pages/VideoControlPage.dart';
import 'package:video_flayer/pages/VideoWebPage.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Example video player"),
      ),
      body: Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RaisedButton(
          child: Text("Video Simple"),
          onPressed: (){
            var route = new MaterialPageRoute(builder: (BuildContext context) => VideoWebPage());
            Navigator.of(context).push(route);
          },
        ),
        RaisedButton(
          child: Text("Video Control"),
          onPressed: (){
            var route = new MaterialPageRoute(builder: (BuildContext context) => VideoControPage());
            Navigator.of(context).push(route);
          },
        ),
      ],
      ),
      ),
    );
  }
}