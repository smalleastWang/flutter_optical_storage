class SelectorModel {
  int id = 0;
  String name = '';

  SelectorModel({required this.id,required this.name});

  SelectorModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}