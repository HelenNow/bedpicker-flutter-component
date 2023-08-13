import 'package:bedcomponent/bed.dart';
import 'package:bedcomponent/bed_component_with_rrg.dart';
import 'package:bedcomponent/bed_component_without_rrg.dart';
import 'package:bedcomponent/room.dart';
import 'package:bedcomponent/roommodel.dart';
import 'package:flutter/material.dart';

void showBedComponentWithRRG({
  required BuildContext context,
  List<Room>? rooms,
  List<Bed>? beds,
}) async {
  await showDialog(
    context: context,
    builder: (BuildContext context) => ChooseBedDialogRRG(
      rooms: rooms,
      beds: beds,
    ),
  );
}

void showBedComponentWithoutRRG({
  required BuildContext context,
  Map<String, ModelRoom>? modelRooms,
  List<Bed>? beds,
  Function? onSubmit,
  bool? subgroups,
}) async {
  await showDialog(
    context: context,
    builder: (BuildContext context) => ChooseBedDialogNoRRG(
      rooms: modelRooms,
      beds: beds,
      onSubmit: onSubmit!,
      subgroups: subgroups!,
    ),
  );
}
