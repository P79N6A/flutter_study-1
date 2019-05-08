class SearchModel {
  int totalCount;
  bool incompleteResults;
  List<ItemModel> items;
  SearchModel({this.totalCount, this.incompleteResults, this.items});

  static SearchModel fromJson(Map<String, dynamic> json) {
    List list = json['items'];
    return SearchModel(
      totalCount: json['total_count'],
      incompleteResults: json['incomplete_results'],
      items: list.map((i) => ItemModel.fromJson(i)).toList(),
    );
  }
}
class ItemModel {
  int id;
  String name;
  String fullName;
  bool private;
  String url;
  String description;
  int size;
  String language;
  int forks;
  int stargazersCount;
  int watchers;

  ItemModel(
      {this.id,
      this.name,
      this.fullName,
      this.private,
      this.url,
      this.description,
      this.size,
      this.language,
      this.forks,
      this.stargazersCount,
      this.watchers});
  static ItemModel fromJson(json) => ItemModel(
      id: json['id'],
      name: json['name'],
      fullName: json['full_name'],
      private: json['private'],
      url: json['url'],
      description: json['description'],
      size: json['size'],
      language: json['language'],
      forks: json['forks'],
      stargazersCount: json['stargazers_count'],
      watchers: json['watchers']);
}
