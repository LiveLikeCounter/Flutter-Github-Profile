
class Repo {
  final int id;
  final String name;
  final String description;
  final String language; 
  final int watchers; // watchers_count;
  final int stars;    // stargazers_count;
  final int forks;    // forks_count;
  final int issues;   // open_issues_count;
  final int size;

  Repo({this.id, this.name, this.description, this.language, this.watchers, this.stars, this.forks, this.issues, this.size});

  factory Repo.fromJson(Map<String, dynamic> json) {
    return Repo(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      language: json['language'],
      watchers: json['watchers'],
      stars: json['stargazers_count'],
      forks: json['forks_count'],
      issues: json['open_issues_count'],
      size: json['size']
    );
  }
}
