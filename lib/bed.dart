class Bed {
  String? title;
  String? rowGuid;

  Bed({
    this.title,
    this.rowGuid,
  });

  factory Bed.fromJson(Map<String, dynamic> json) {
    return Bed(
      title: json['title'],
      rowGuid: json['rowGuid'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {
      'title': title,
      'rowGuid': rowGuid,
    };
    return json;
  }

  static List<Bed> fromJsonList(List json) {
    return json.map((service) => Bed.fromJson(service)).toList();
  }

  static List toJsonList(List<Bed> items) {
    return items.map((items) => items.toJson()).toList();
  }
}
