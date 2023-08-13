class Room {
  String? roomNumber;
  int? patientCount;
  String? rrg;

  Room({
    this.roomNumber,
    this.patientCount,
    this.rrg,
  });

  factory Room.fromJson(Map<String, dynamic> json) {
    return Room(
      roomNumber: json['roomNumber'],
      patientCount: json['occupancy'],
      rrg: json['rrg'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {
      'roomNumber': roomNumber,
      'occupancy': patientCount,
      'rrg': rrg,
    };
    return json;
  }

  static List<Room> fromJsonList(List json) {
    return json.map((service) => Room.fromJson(service)).toList();
  }

  static List toJsonList(List<Room> items) {
    return items.map((items) => items.toJson()).toList();
  }
}
