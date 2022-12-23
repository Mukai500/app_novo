class Repository {
  int? id;
  String? name;
  String? htmlurl;
  int? stargazerCount;
  String? description;

  Repository(
      {this.id,
      this.name,
      this.htmlurl,
      this.stargazerCount,
      this.description});

  factory Repository.fromJson(Map<String, dynamic> json) {
    return Repository(
        id: json['id'],
        name: json['name'],
        htmlurl: json['html_url'],
        stargazerCount: json['stargazers_count'],
        description: json['description']);
  }
}
