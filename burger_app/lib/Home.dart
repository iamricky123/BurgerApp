import 'package:flutter/material.dart';


class MyHomePage extends StatefulWidget {


  MyHomePage({Key? key }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List listNews=[];
  bool hasPages=true;
  ScrollController _scrollController = new ScrollController();
  int page=1;
  @override
  void initState() {

    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(title: Center(child: Text("News",)), flexibleSpace: Container(
          decoration: new BoxDecoration(
            gradient: new LinearGradient(
                colors: [
                  const Color(0xFF3366FF),
                  const Color(0xFF00CCFF),
                ],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(1.0, 0.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
        ),),
        body: ListView(

        )
    );
  }

}