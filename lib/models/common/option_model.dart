class OptionModel {
  int value = 0;
  String label = '';

  OptionModel({required this.value,required this.label});

  OptionModel.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    label = json['label'];
  }
}