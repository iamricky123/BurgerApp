import 'dart:math' as math;

import 'package:flutter/material.dart';

class CustomDrawerBox extends StatefulWidget {
  final Widget child;

  const CustomDrawerBox({Key? key, required this.child}) : super(key: key);

  static CustomDrawerBoxState? of(BuildContext context) =>
      context.findAncestorStateOfType<CustomDrawerBoxState>();

  @override
  CustomDrawerBoxState createState() => new CustomDrawerBoxState();
}

class CustomDrawerBoxState extends State<CustomDrawerBox>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  bool _canBeDragged = false;
  final double maxSlide = 300.0;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void close() => animationController.reverse();

  void open() => animationController.forward();

  void toggle() => animationController.isDismissed
      ? animationController.forward()
      : animationController.reverse();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (animationController.isCompleted) {
          close();
          return false;
        }
        return true;
      },

      child: GestureDetector(
        onHorizontalDragStart: _onDragStart,
        onHorizontalDragUpdate: _onDragUpdate,
        onHorizontalDragEnd: _onDragEnd,
        behavior: HitTestBehavior.translucent,
        onTap: toggle,

        child: AnimatedBuilder(
          animation: animationController,
          builder: (context, _) {
            return Material(
              color: Colors.blueGrey,
              child: Stack(
                children: <Widget>[
                  Transform.translate(
                    offset: Offset(maxSlide * (animationController.value - 1), 0),
                    child: Transform(
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.001)
                        ..rotateY(math.pi / 2 * (1 - animationController.value)),
                      alignment: Alignment.centerRight,
                      child: MyDrawer(),
                    ),
                  ),

                  Transform.translate(
                    offset: Offset(maxSlide * animationController.value, 0),
                    child: Transform(
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.001)
                        ..rotateY(-math.pi * animationController.value / 2),
                      alignment: Alignment.centerLeft,
                      child: widget.child,
                    ),
                  ),
                  // Positioned(
                  //   top: 4.0 + MediaQuery.of(context).padding.top,
                  //   left: 4.0 + animationController.value * maxSlide,
                  //   child: IconButton(
                  //     icon: Icon(Icons.menu),
                  //     onPressed: toggle,
                  //     color: Colors.white,
                  //   ),
                  // ),
                  // Positioned(
                  //   top: 16.0 + MediaQuery.of(context).padding.top,
                  //   left: animationController.value *
                  //       MediaQuery.of(context).size.width,
                  //   width: MediaQuery.of(context).size.width,
                  //   child: Text(
                  //     'Hello Flutter Europe',
                  //     style: Theme.of(context).primaryTextTheme.bodyLarge,
                  //     textAlign: TextAlign.center,
                  //   ),
                  // ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void _onDragStart(DragStartDetails details) {
    bool isDragOpenFromLeft = animationController.isDismissed;
    bool isDragCloseFromRight = animationController.isCompleted;
    _canBeDragged = isDragOpenFromLeft || isDragCloseFromRight;
  }

  void _onDragUpdate(DragUpdateDetails details) {
    if (_canBeDragged) {
      double delta = details.primaryDelta! / maxSlide;
      animationController.value += delta;
    }
  }

  void _onDragEnd(DragEndDetails details) {
    //I have no idea what it means, copied from Drawer
    double _kMinFlingVelocity = 365.0;

    if (animationController.isDismissed || animationController.isCompleted) {
      return;
    }
    if (details.velocity.pixelsPerSecond.dx.abs() >= _kMinFlingVelocity) {
      double visualVelocity = details.velocity.pixelsPerSecond.dx /
          MediaQuery.of(context).size.width;

      animationController.fling(velocity: visualVelocity);
    } else if (animationController.value < 0.5) {
      animationController.reverse();
    } else {
      animationController.forward();
    }
  }

}

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: double.infinity,
      child: Material(
        color: Colors.white,
        child: SafeArea(
          child: Theme(
            data: ThemeData(brightness: Brightness.dark),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Image.asset(
                  'assets/images/burgerlogo.png',
                  width: 200,
                ),
                ListTile(
                  onTap: () {
                    print("HI");
                  },
                  leading: Icon(
                      Icons.new_releases,
                      color: Colors.black
                  ),
                  title: Text(
                      'News',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {
                    print("HI");
                  },
                  leading: Icon(
                    Icons.star,
                    color: Colors.black,
                  ),
                  title: Text(
                    'Favourites',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {
                    print("HI");
                  },
                  leading: Icon(
                      Icons.map,
                      color: Colors.black
                  ),
                  title: Text(
                    'Map',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {
                    print("HI");
                  },
                  leading: Icon(
                      Icons.settings,
                      color: Colors.black
                  ),
                  title: Text(
                    'Settings',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {
                    print("HI");
                  },
                  leading: Icon(
                      Icons.person,
                      color: Colors.black
                  ),
                  title: Text(
                    'Profile',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}