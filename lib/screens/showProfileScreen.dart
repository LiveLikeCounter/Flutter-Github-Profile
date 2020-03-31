import 'package:flutter/material.dart';

import '../core/util.dart';
import '../widgets/widgets.dart';

class ShowProfileScreen extends StatefulWidget {
  static const routeName = '/ShowProfileScreen';

  ShowProfileScreen({Key key}) : super(key: key);
  _ShowProfileScreenState createState() => _ShowProfileScreenState();
}

class _ShowProfileScreenState extends State<ShowProfileScreen> {
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
            UserProfile(),
            Opacity(
              opacity: 0.0,
              child: SizedBox(height: 20),
            ),
            ReposListView(),
          ],
        ),
      ),
    );
  }
}
