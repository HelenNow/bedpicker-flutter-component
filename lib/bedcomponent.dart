import 'package:bedcomponent/bed.dart';
import 'package:bedcomponent/bed_component_with_rrg.dart';
import 'package:bedcomponent/bed_component_without_rrg.dart';
import 'package:bedcomponent/color_constants.dart';
import 'package:bedcomponent/room.dart';
import 'package:bedcomponent/roommodel.dart';
import 'package:flutter/material.dart';

Future<Result?> showBedComponentWithRRG({
  required BuildContext context,
  List<Room>? rooms,
  List<Bed>? beds,
  String? title,
  TextStyle? occupancyStyle,
  Color? barrierColor,
  bool? newDesignSubmit = false,
}) async {
  final result = await showDialog(
    barrierColor: barrierColor ?? ColorConstants.white.withOpacity(0.4),
    context: context,
    builder: (BuildContext context) => ChooseBedDialogRRG(
      newDesignSubmit: true,
      rooms: rooms,
      occupancyStyle: occupancyStyle,
      title: title,
      beds: beds,
    ),
  );
  return result;
}

Future<void> showBedComponentWithoutRRG({
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
