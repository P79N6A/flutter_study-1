class SearchModel {
  final totalCount;
  final incompleteResults;
  final items;

  SearchModel({this.totalCount, this.incompleteResults, this.items});
  static fromJson(json) => SearchModel(
      totalCount: json['total_count'],
      incompleteResults: json['incomplete_results'],
      items:
          (json['items'] as List).map((i) => ItemModel.formJson(i)).toList());
}

class ItemModel {
  final id;
  final name;
  final fullName;
  final private;
  final url;
  final description;
  final size;
  final language;
  final forks;
  final watchers;

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
      this.watchers});
  static formJson(json) => ItemModel(
      id: json['id'],
      name: json['name'],
      fullName: json['full_name'],
      private: json['private'],
      url: json['url'],
      description: json['description'],
      size: json['size'],
      language: json['language'],
      forks: json['forks'],
      watchers: json['watchers']);
}
