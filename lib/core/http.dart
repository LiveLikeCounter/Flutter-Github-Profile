import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/repos.dart';
import './core.dart';

class HttpService {
  // To make authenticated call's to the GutHub API, which gives you more requests per hour, please follow:
  // https://help.github.com/en/github/authenticating-to-github/creating-a-personal-access-token-for-the-command-line
  
  // Then you place your token here:
  final String token = '';

  Future<dynamic> _getGitHubUsername() async {
    var githubUsername = await LocalStorage.getString('GitHubUserProfile');
    return githubUsername;
  }

  Future<dynamic> findProfile(String profile) async {
    // Request without token
    final response = await http.get('https://api.github.com/users/$profile');

    // Request with token
    // final response = await http.get(
    //   'https://api.github.com/users/$profile',
    //   headers: {HttpHeaders.authorizationHeader: "token $token"},
    // );

    switch (response.statusCode) {
      case 200:
        final Map<String, dynamic> map = json.decode(response.body);
        return map;
      case 401:
      case 403:
        throw 'Out of free requests, implement the authtoken. Please see the http.dart file to overcome this issue.';
      case 404:
        throw 'The users is not found, try another name.';
      default:
        throw 'Default Error';
    }
  }

  Future<dynamic> fetchProfile() async {
    var githubUsername = await _getGitHubUsername();

    // Request without token
    final response = await http.get(
      'https://api.github.com/users/$githubUsername',
    );

    // Request with token
    // final response = await http.get(
    //   'https://api.github.com/users/$githubUsername',
    //   headers: {HttpHeaders.authorizationHeader: "token $token"},
    // );

    final Map<String, dynamic> map = json.decode(response.body);
    return map;
  }

  Future<List<Repo>> fetchRepos() async {
    var githubUsername = await _getGitHubUsername();

    final response = await http.get(
        'https://api.github.com/users/$githubUsername/repos?type=owner&sort=updated');

    // final response = await http.get(
    //     'https://api.github.com/users/$githubUsername/repos?type=owner&sort=updated',
    //     headers: {HttpHeaders.authorizationHeader: "token $token"},);

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((repo) => new Repo.fromJson(repo)).toList();
    } else {
      throw Exception('Failed to load repos from Github API');
    }
  }
}
