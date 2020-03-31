import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

import '../core/util.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: CustomColors.VioletExtraLight,
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SvgPicture.asset('assets/images/particlesYellow.svg'),
          SvgPicture.asset('assets/images/github-logo.svg'),
          SvgPicture.asset('assets/images/particlesBlue.svg'),
        ],
      ),
    );
  }
}
