import 'package:flutter/material.dart';
import 'home_page_body.dart';
import '../filter/filter_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: AnimatedOpacity(
        opacity: 1.0,
        duration: Duration(milliseconds: 1500),
        child: Column(
          children: <Widget>[
            GradientAppBar("Beer Funk"),
            HomePageBody(),
          ],
        ),
      ),
    );
  }
}

// showFilterMessage(BuildContext context) {
//   Scaffold.of(context).showSnackBar(
//     SnackBar(
//       content: Text('Server error'),
//       duration: Duration(seconds: 5),
//     ),
//   );
// }

// class SnackBarPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: RaisedButton(
//         onPressed: () {
//           final snackBar = SnackBar(
//             content: Text('Yay! A SnackBar!'),
//             duration: Duration(seconds: 5),
//             action: SnackBarAction(
//               label: 'Clear all',
//               onPressed: () {
//                 // Some code to undo the change.
//               },
//             ),
//           );

//           // Find the Scaffold in the widget tree and use
//           // it to show a SnackBar.
//           Scaffold.of(context).showSnackBar(snackBar);
//         },
//         child: Text('Show SnackBar'),
//       ),
//     );
//   }
// }

class GradientAppBar extends StatelessWidget {
  final String title;
  final double barHeight = 56.0;

  GradientAppBar(this.title);

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return new Container(
      // padding: new EdgeInsets.only(top: statusBarHeight),
      height: statusBarHeight + barHeight,
      child: new Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            title,
            style: const TextStyle(
                color: Colors.white,
                fontFamily: 'Barlow',
                fontWeight: FontWeight.w600,
                fontSize: 36.0),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.filter_list),
              onPressed: () {
                Navigator.push(context, SlideRightRoute(page: FilterView()));
                Scaffold.of(context).removeCurrentSnackBar();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SlideRightRoute extends PageRouteBuilder {
  final Widget page;
  SlideRightRoute({this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        );
}
