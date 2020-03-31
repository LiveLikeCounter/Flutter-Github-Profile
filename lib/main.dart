import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/core.dart';
import 'screens/screens.dart';

String showProfilePage; 

Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  showProfilePage = await LocalStorage.getString('GitHubUserProfile');
  runApp(App()); 
}

class App extends StatefulWidget {
  App({Key key}) : super(key: key);

  _AppState createState() => _AppState();
}

class _AppState extends State<App> {

  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        canvasColor: CustomColors.BodyBackground,
        fontFamily: 'Muli',
      ),
      title: 'GitHub Profile',
      initialRoute: showProfilePage == '' || showProfilePage == null ? FindProfileScreen.routeName : ShowProfileScreen.routeName,
      routes: {
        '/': (ctx) => FindProfileScreen(),
        ShowProfileScreen.routeName: (ctx) => ShowProfileScreen(),
        FindProfileScreen.routeName: (ctx) => FindProfileScreen(),
      },
      onGenerateRoute: (settings) {
        // print(settings.arguments);
        // print(settings.name);
        return;
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (ctx) => FindProfileScreen(),
        );
      },
    );
  }
}
