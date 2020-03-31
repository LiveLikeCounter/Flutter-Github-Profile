import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

import '../core/util.dart';
import '../core/http.dart';
import '../models/repos.dart';

class ReposListView extends StatelessWidget {
  Widget _repoCardMeticsItem(data, image, text) {
    return Row(
      children: <Widget>[
        SvgPicture.asset('assets/images/icons8-$image.svg', width: 25),
        SizedBox(width: 10),
        Text(data ?? '', style: CustomTextStyles.GithubCardMetricNumber),
        SizedBox(width: 5),
        Flexible(
          child: Text(text,
              overflow: TextOverflow.ellipsis,
              style: CustomTextStyles.GithubCardMetricDescription),
        ),
      ],
    );
  }

  Widget _repoCard(data, index) {
    return Container(
      height: 80,
      margin: EdgeInsets.only(top: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _repoCardMeticsItem(
                    data[index].watchers.toString(), 'eye', 'Watchers'),
                _repoCardMeticsItem(
                    data[index].stars.toString(), 'star_filled', 'Stars'),
                _repoCardMeticsItem(
                    data[index].forks.toString(), 'code_fork', 'Forks'),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _repoCardMeticsItem(
                    data[index].issues.toString(), 'issues', 'Open Issues'),
                _repoCardMeticsItem(
                    data[index].language.toString(), 'code', 'Language'),
                _repoCardMeticsItem(
                    data[index].size.toString(), 'folder', 'Size'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Flexible _reposListView(data) {
    return Flexible(
      child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Container(
            width: MediaQuery.of(context).size.width / 1.5,
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
              border: Border.all(width: 1, color: CustomColors.BlueDark),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 10,
                  offset: Offset(0.0, 0.0),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(data[index].name ?? '',
                    style: CustomTextStyles.GithubCardTitle),
                data[index].description != null
                    ? Text(data[index].description ?? '',
                        style: CustomTextStyles.GithubCardSubTitle)
                    : Container(),
                _repoCard(data, index),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Repo>>(
      future: HttpService().fetchRepos(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Repo> data = snapshot.data;
          if (data.length == 0) {
            return Container(
              margin: EdgeInsets.symmetric(vertical: 50),
              child: Text('No repo\'s found.'),
            );
          } else {
            return _reposListView(data);
          }
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return Text('Loading...');
      },
    );
  }
}
