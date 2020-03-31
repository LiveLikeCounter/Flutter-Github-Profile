import 'package:flutter/material.dart';

import '../core/util.dart';
import '../widgets/widgets.dart';

class FindProfileScreen extends StatefulWidget {
  static const routeName = '/FindProfileScreen';

  FindProfileScreen({Key key}) : super(key: key);
  _FindProfileScreenState createState() => _FindProfileScreenState();
}

class _FindProfileScreenState extends State<FindProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.BodyBackground,
      body: SafeArea(
        bottom: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Header(),
            FindProfile(),
          ],
        ),
      ),
    );
  }
}
