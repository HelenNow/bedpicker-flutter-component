import 'package:bedcomponent/bed.dart';

class ModelRoom {
  int occupancy;
  String building;
  String roomName;
  List<Bed> beds;
  String roomNumber;

  ModelRoom({
    required this.occupancy,
    required this.building,
    required this.roomName,
    required this.beds,
    required this.roomNumber,
  });

  factory ModelRoom.fromJson(String roomNumber, Map<String, dynamic> json) {
    List<Bed> bedsList =
        (json['beds'] as List).map((bed) => Bed.fromJson(bed)).toList();

    return ModelRoom(
      occupancy: json['occupancy'],
      building: json['building'],
      roomName: json['roomName'],
      beds: bedsList,
      roomNumber: roomNumber,
    );
  }

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> bedsList =
        beds.map((bed) => bed.toJson()).toList();

    Map<String, dynamic> json = {
      'occupancy': occupancy,
      'building': building,
      'roomName': roomName,
      'beds': bedsList,
      'roomNumber': roomNumber,
    };
    return json;
  }
}

// void main() {
//   Map<String, dynamic> response = {
//     "5121": {
//       // ...
//     },
//     "5333": {
//       // ...
//     },
//     // ... other room entries ...
//   };

//   List<ModelRoom> rooms = response.entries
//       .map((entry) => ModelRoom.fromJson(entry.key, entry.value))
//       .toList();

//   // Now you can work with the list of ModelRoom objects
// }
