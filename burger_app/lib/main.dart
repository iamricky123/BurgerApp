
import 'package:Burger_App/screens/my_nav_bar.dart';
import 'package:Burger_App/screens/widgets/custom_drawer.dart';
import 'package:Burger_App/screens/widgets/custom_drawer_2.dart';
import 'package:Burger_App/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    bool flip = true;
    AppBar appBar;
    if (flip) {
      appBar = AppBar(
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: Icon(Icons.menu),
              onPressed: () => CustomDrawerBox.of(context)!.open(),
            );
          },
        ),
        actions: [
          Card(
            color: Theme.of(context).colorScheme.secondary,
            shape: const CircleBorder(),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Image.asset(
                myAssets.boyFace,
              ),
            ),
          ),
        ],
        // title: Text('Hello Flutter Europe'),
      );
    } else {
      appBar = AppBar(
            leading: Builder(
              builder: (context) {
                return IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () => CustomDrawer.of(context)!.open(),
                );
              },
            ),
            title: Text('Hello Flutter Europe'),
          );
    }
    Widget child = MyNavBar(appBar: appBar);

    if (flip) {
      child = CustomDrawerBox(child: child);
    } else {
      child = CustomDrawer(child: child);
    }
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: child,
    );
  }
}

class MyHomePage extends StatefulWidget {
  final AppBar appBar;

  MyHomePage({Key? key, required this.appBar}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.appBar,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}