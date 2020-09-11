import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

import '../core/core.dart';

import '../screens/screens.dart';

class UserProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: HttpService().fetchProfile(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            decoration: BoxDecoration(
              color: CustomColors.VioletLight,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 15,
                  offset: Offset(-1.0, 10.0),
                ),
              ],
            ),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      child: GestureDetector(
                        onTap: () {
                          LocalStorage.deleteValue('GitHubUserProfile');
                          Navigator.pushReplacementNamed(
                              context, FindProfileScreen.routeName);
                        },
                        child: Icon(
                          Icons.chevron_left,
                          size: 20,
                        ),
                      ),
                    ),
                    Container(
                      width: 65,
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: Image.network(
                        snapshot.data['avatar_url'] ?? '',
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                            snapshot.data['name'] != null
                                ? snapshot.data['name']
                                : '',
                            overflow: TextOverflow.ellipsis,
                            style: CustomTextStyles.ProfileLargeText),
                        Text(
                            snapshot.data['login'] != null
                                ? snapshot.data['login']
                                : '',
                            overflow: TextOverflow.ellipsis,
                            style: CustomTextStyles.ProfileNormalText),
                      ],
                    ),

                    // SizedBox(width: 10),
                    // Container(
                    //   width: MediaQuery.of(context).size.width / 2.3,
                    //   child: Column(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     children: <Widget>[
                    //       Row(
                    //         children: <Widget>[
                    //           SvgPicture.asset(
                    //               'assets/images/profile-icon-company.svg'),
                    //           SizedBox(width: 5),
                    //           Flexible(
                    //             child: Text(snapshot.data['company'] ?? '',
                    //                 overflow: TextOverflow.ellipsis,
                    //                 style: CustomTextStyles.ProfileNormalText),
                    //           )
                    //         ],
                    //       ),
                    //       SizedBox(height: 5),
                    //       Row(
                    //         children: <Widget>[
                    //           SvgPicture.asset(
                    //               'assets/images/profile-icon-location.svg'),
                    //           SizedBox(width: 5),
                    //           Flexible(
                    //             child: Text(snapshot.data['location'] ?? '',
                    //                 overflow: TextOverflow.ellipsis,
                    //                 style: CustomTextStyles.ProfileNormalText),
                    //           )
                    //         ],
                    //       ),
                    //       SizedBox(height: 5),
                    //       Row(
                    //         children: <Widget>[
                    //           SvgPicture.asset(
                    //               'assets/images/profile-icon-website.svg'),
                    //           SizedBox(width: 5),
                    //           Flexible(
                    //             child: Text(snapshot.data['blog'] ?? '',
                    //                 overflow: TextOverflow.ellipsis,
                    //                 style: CustomTextStyles.ProfileNormalText),
                    //           )
                    //         ],
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(
                          snapshot.data['public_repos'].toString() ?? '',
                          style: CustomTextStyles.ProfileMetricsTitle,
                        ),
                        Text(
                          'Repositories',
                          style: CustomTextStyles.ProfileMetricsSubTitle,
                        )
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          snapshot.data['public_gists'].toString() ?? '',
                          style: CustomTextStyles.ProfileMetricsTitle,
                        ),
                        Text(
                          'Gists',
                          style: CustomTextStyles.ProfileMetricsSubTitle,
                        )
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          snapshot.data['followers'].toString() ?? '',
                          style: CustomTextStyles.ProfileMetricsTitle,
                        ),
                        Text(
                          'Followers',
                          style: CustomTextStyles.ProfileMetricsSubTitle,
                        )
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          snapshot.data['following'].toString() ?? '',
                          style: CustomTextStyles.ProfileMetricsTitle,
                        ),
                        Text(
                          'Following',
                          style: CustomTextStyles.ProfileMetricsSubTitle,
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        } else {
          return Container(
            height: 200,
            color: CustomColors.VioletExtraLight,
            child: Center(
              child: Text(
                'Loading Profile...',
                style: CustomTextStyles.ProfileLargeText,
              ),
            ),
          );
        }
      },
    );
  }
}
