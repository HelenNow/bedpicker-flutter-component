import 'package:bedcomponent/app_constants.dart';
import 'package:bedcomponent/bed.dart';
import 'package:bedcomponent/color_constants.dart';
import 'package:bedcomponent/general_button.dart';
import 'package:bedcomponent/gradient_button.dart';
import 'package:bedcomponent/room.dart';
import 'package:bedcomponent/room_occupancy_widget.dart';
import 'package:bedcomponent/screendialogwithrrg.dart';
import 'package:flutter/material.dart';

class ChooseBedDialogRRG extends StatefulWidget {
  final List<Bed>? beds;
  final List<Room>? rooms;
  final Function? widgetDispose;
  final bool? newDesignSubmit;
  final String? title;
  final TextStyle? occupancyStyle;
  const ChooseBedDialogRRG({
    Key? key,
    this.beds,
    this.newDesignSubmit = false,
    this.rooms,
    this.title,
    this.occupancyStyle,
    this.widgetDispose,
  }) : super(key: key);

  @override
  State<ChooseBedDialogRRG> createState() => _ChooseBedDialogRRGState();
}

class _ChooseBedDialogRRGState extends State<ChooseBedDialogRRG> {
  @override
  void initState() {
    _roomNumberController.addListener(_updateOccupancy);
    super.initState();
  }

  void _updateOccupancy() {
    final String roomNumber = _roomNumberController.text;
    final bool roomExists =
        widget.rooms!.any((room) => room.roomNumber == roomNumber);
    final count = widget.rooms!
            .firstWhere((room) => room.roomNumber == roomNumber)
            .patientCount ??
        1;
    final bool onebed = count == 1;
    if (roomExists && onebed) {
      _occupancyController.text = '1';
    } else {
      _occupancyController.text = '';
    }
  }

  @override
  void dispose() {
    _roomNumberController.removeListener(_updateOccupancy);
    _occupancyController.dispose();
    _roomNumberController.dispose();
    super.dispose();
  }

  void _checkPinCode() {
    setState(() {
      enteredPin = _roomNumberController.text;
      roomMatched = false;
      occupancyMatched = false;
    });
    if (_roomNumberController.text.length == 4) {
      focusNode.requestFocus();
    }
    for (final Room room in widget.rooms!) {
      if (room.roomNumber == enteredPin) {
        setState(() {
          roomMatched = true;
        });
        if (_occupancyController.text.isNotEmpty &&
            room.patientCount! > int.parse(_occupancyController.text)) {
          final List possibleBeds = List.generate(
              room.patientCount ?? 1, (index) => (index + 1).toString());

          if (_occupancyController.text.isNotEmpty &&
              possibleBeds.contains(_occupancyController.text)) {
            occupancyMatched = true;
            rrg = room.rrg ?? '';
          }
        } else {
          if (_occupancyController.text.isNotEmpty) {
            setState(() {
              occupancyMatched = true;
              rrg = room.rrg ?? '';
            });
          }
        }
      }
    }
    for (final Bed bed in widget.beds ?? []) {
      final String tempOccupancy =
          _occupancyController.text.isEmpty ? '1' : _occupancyController.text;
      if (bed.title == '$enteredPin-$tempOccupancy') {
        setState(() {
          rbrg = bed.rowGuid ?? '';
          bedName = bed.title ?? '';
        });
      }
    }
  }

  final TextEditingController _roomNumberController = TextEditingController();
  final TextEditingController _occupancyController = TextEditingController();
  String enteredPin = '';
  bool roomMatched = false;
  final FocusNode focusNode = FocusNode();
  bool occupancyMatched = false;
  String rrg = '';
  String rbrg = '';
  String bedName = '';
  void _onSubmit(
    BuildContext context,
    String roomNumber,
  ) async {
    if (occupancyMatched && roomMatched) {
      Navigator.of(context).pop(Result(
        rrg: rrg,
        rbrg: rbrg,
        roomNumber: enteredPin,
        bedName: bedName,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenDialogWithRRg(
      color: ColorConstants.beige,
      cancelButtonColor: ColorConstants.purpleDark,
      title: widget.title ?? 'Choose room',
      titleAlignment: Alignment.center,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 15,
      ),
      borderRadius: 12,
      titleTextMargin: const EdgeInsets.only(top: 50),
      content: Column(
        crossAxisAlignment: widget.newDesignSubmit ?? false
            ? CrossAxisAlignment.center
            : CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          RoomAndOccupancyWidget(
            focusNode: focusNode,
            newDesign: true,
            occupancyStyle: widget.occupancyStyle,
            occupancyController: _occupancyController,
            roomNumberController: _roomNumberController,
            onPinCodeChanged: _checkPinCode,
            dispose: widget.widgetDispose,
            setNoOccupancy: () => setState(() {
              _occupancyController.text = '';
            }),
            beds: widget.beds ?? [],
          ),
          const SizedBox(height: 18),
          widget.newDesignSubmit ?? false
              ? GradientButton(
                  width: 150,
                  height: 45,
                  fontWeight: FontWeight.w500,
                  buttonText: 'Submit',
                  isDisabled: !(roomMatched &&
                      occupancyMatched &&
                      _occupancyController.text.isNotEmpty),
                  handleTap: () => roomMatched &&
                          occupancyMatched &&
                          _occupancyController.text.isNotEmpty
                      ? _onSubmit(
                          context,
                          _roomNumberController.text,
                        )
                      : {},
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                )
              : GeneralButton(
                  buttonText: 'Submit',
                  borderRadius: 25,
                  buttonColor: roomMatched &&
                          occupancyMatched &&
                          _occupancyController.text.isNotEmpty
                      ? ColorConstants.red
                      : Colors.grey,
                  fontSize: AppConstants.fontRequestButtonMaximizedAccepted,
                  height: 45,
                  width: 100,
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  handleTap: () => roomMatched &&
                          occupancyMatched &&
                          _occupancyController.text.isNotEmpty
                      ? _onSubmit(
                          context,
                          _roomNumberController.text,
                        )
                      : {},
                ),
          const SizedBox(height: 18),
        ],
      ),
    );
  }
}

class Result {
  final String? rrg;
  final String rbrg;
  final String? roomNumber;
  final String? bedName;

  const Result({
    required this.rrg,
    required this.rbrg,
    this.roomNumber,
    this.bedName,
  });
}
