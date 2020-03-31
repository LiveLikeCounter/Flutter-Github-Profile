import 'package:flutter/material.dart';

import '../screens/screens.dart';
import '../core/core.dart';

class FindProfile extends StatefulWidget {
  @override
  _FindProfileState createState() => _FindProfileState();
}

class _FindProfileState extends State<FindProfile> {
  HttpService http = HttpService();
  final _githubprofileController = TextEditingController();
  bool _githubprofileControllerDisabled = true;
  bool showError = false;
  String errorText = '';
  String profileText = '';

  @override
  void initState() {
    super.initState();
    _githubprofileController.addListener(_githubprofileControllerCheckvalue);
  }

  _checkGitHubProfileName() async {
    try {
      var profile = await http.findProfile(_githubprofileController.text);
      setState(() {
        showError = false;
        profileText =
            '${profile['name'] != null ? profile['name'] + ', ' : ''} ${profile['login']}';
      });
    } catch (error) {
      setState(() {
        showError = true;
        errorText = error;
      });
    }
  }

  _setGitHubProfileName() async {
    await LocalStorage.putString(
        'GitHubUserProfile', _githubprofileController.text);
    Navigator.pushNamed(context, ShowProfileScreen.routeName);
  }

  Function _githubprofileControllerButton() {
    if (_githubprofileControllerDisabled) {
      return null;
    } else {
      return () {
        _checkGitHubProfileName();
      };
    }
  }

  void _githubprofileControllerCheckvalue() {
    setState(() {
      _githubprofileController.text.length > 0
          ? _githubprofileControllerDisabled = false
          : _githubprofileControllerDisabled = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 16),
        color: CustomColors.VioletLight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width / 1.1,
                    child: showError
                        ? Text(errorText, softWrap: true)
                        : Text(
                            profileText,
                            textAlign: TextAlign.center,
                          ),
                  ),
                  showError || profileText == ''
                      ? Container()
                      : FlatButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          onPressed: () {
                            _setGitHubProfileName();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Choose this Profile',
                                style: TextStyle(fontSize: 16),
                              ),
                              Icon(Icons.chevron_right),
                            ],
                          ),
                          textColor: CustomColors.BlueDark,
                        ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 5),
              child: Text(
                'GitHub Username',
                style: TextStyle(color: CustomColors.BlueDark75, fontSize: 16),
              ),
            ),
            TextFormField(
              controller: _githubprofileController,
              // autofocus: true,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                prefixText: 'https://github.com/',
                contentPadding: EdgeInsets.only(
                    left: 14.0, bottom: 8.0, top: 8.0, right: 14.0),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(5),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 45,
              margin: EdgeInsets.only(top: 20),
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                onPressed: _githubprofileControllerButton(),
                color: CustomColors.BlueDark,
                child: Text(
                  'Find My Profile',
                  style: TextStyle(fontSize: 24),
                ),
                textColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
