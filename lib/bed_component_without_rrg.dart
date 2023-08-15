import 'package:bedcomponent/bed.dart';
import 'package:bedcomponent/general_button.dart';
import 'package:bedcomponent/room_occupancy_widget.dart';
import 'package:bedcomponent/roommodel.dart';
import 'package:bedcomponent/screen_dialog.dart';
import 'package:flutter/material.dart';

class ChooseBedDialogNoRRG extends StatefulWidget {
  final List<Bed>? beds;
  final Map<String, ModelRoom>? rooms;

  final dynamic onSubmit;
  final bool subgroups;
  final bool group;
  final bool here;
  final Color? roomMatchedColor;
  const ChooseBedDialogNoRRG({
    required this.onSubmit,
    required this.subgroups,
    this.here = false,
    this.group = false,
    Key? key,
    this.beds,
    this.roomMatchedColor,
    this.rooms,
  }) : super(key: key);

  @override
  State<ChooseBedDialogNoRRG> createState() => _ChooseBedDialogNoRRGState();
}

class _ChooseBedDialogNoRRGState extends State<ChooseBedDialogNoRRG> {
  @override
  void initState() {
    _roomNumberController.addListener(_updateOccupancy);
    super.initState();
  }

  void _updateOccupancy() {
    final List<String> rooms = widget.rooms!.keys.toList();
    final String roomNumber = _roomNumberController.text;
    final bool roomExists = rooms.any((room) => room == roomNumber);
    final matchingRooms = rooms.where((room) => room == roomNumber);
    final count = matchingRooms.length;
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
    for (final String room in widget.rooms!.keys) {
      if (room == enteredPin) {
        setState(() {
          roomMatched = true;
        });
        if (widget.rooms![room]!.occupancy > 1) {
          setState(() {
            showOccupancyField = true;
          });

          if (_occupancyController.text.isEmpty) {
            setState(() {
              occupancyMatched = false;
              roomMatched = false;
            });
          } else {
            final List possibleBeds = List.generate(
                widget.rooms![room]!.occupancy,
                (index) => (index + 1).toString());

            if (possibleBeds.contains(_occupancyController.text)) {
              occupancyMatched = true;
            }
          }
        } else {
          if (_occupancyController.text.isEmpty) {
            setState(() {
              occupancyMatched = false;
              roomMatched = false;
            });
          } else {
            setState(() {
              showOccupancyField = false;
              occupancyMatched = true;
            });
          }
        }
      }
    }
    final List<Bed> beds = <Bed>[];

    for (final ModelRoom room in widget.rooms!.values) {
      beds.addAll(room.beds);
    }

    for (final Bed bed in beds) {
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

  final FocusNode focusNode = FocusNode();

  final TextEditingController _roomNumberController = TextEditingController();
  final TextEditingController _occupancyController = TextEditingController();
  bool showOccupancyField = false;
  String enteredPin = '';
  bool roomMatched = false;
  bool occupancyMatched = false;
  String rrg = '';
  String rbrg = '';
  String bedName = '';

  @override
  Widget build(BuildContext context) {
    return ScreenDialog(
      cancelButtonColor: Colors.purple,
      title: 'Choose room',
      titleAlignment: Alignment.center,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 15,
      ),
      borderRadius: 12,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          RoomAndOccupancyWidget(
            occupancyController: _occupancyController,
            roomNumberController: _roomNumberController,
            onPinCodeChanged: _checkPinCode,
            beds: widget.beds ?? <Bed>[],
            focusNode: focusNode,
          ),
          const SizedBox(height: 18),
          GeneralButton(
            buttonText: 'Submit',
            textColor: Colors.white,
            borderRadius: 25,
            buttonColor: roomMatched
                ? widget.roomMatchedColor ?? Colors.red
                : Colors.grey,
            fontSize: 16,
            height: 45,
            width: 100,
            margin: const EdgeInsets.symmetric(horizontal: 5),
            handleTap: roomMatched && occupancyMatched
                ? () => widget.onSubmit(
                      bedName,
                      rbrg,
                    )
                : () => print("testing"),
          ),
        ],
      ),
    );
  }
}
