import 'package:bedcomponent/bed.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class RoomAndOccupancyWidget extends StatefulWidget {
  final TextEditingController roomNumberController;
  final TextEditingController occupancyController;
  final Function onPinCodeChanged;
  final List<Bed>? beds;
  final FocusNode focusNode;
  final Function? setNoOccupancy;

  const RoomAndOccupancyWidget({
    required this.roomNumberController,
    required this.occupancyController,
    required this.onPinCodeChanged,
    required this.focusNode,
    required this.beds,
    this.setNoOccupancy,
    Key? key,
  }) : super(key: key);

  @override
  State<RoomAndOccupancyWidget> createState() => _RoomAndOccupancyWidgetState();
}

class _RoomAndOccupancyWidgetState extends State<RoomAndOccupancyWidget> {
  int? maxOccupancy;
  String error = '';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: 160,
              child: PinCodeTextField(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                enableActiveFill: true,
                blinkWhenObscuring: true,
                autoFocus: true,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                  selectedColor: Colors.black,
                  inactiveColor: Colors.grey.shade300,
                  inactiveFillColor: Colors.grey.shade300,
                  selectedFillColor: Colors.grey.shade300,
                  activeColor: Colors.grey.shade300,
                  shape: PinCodeFieldShape.box,
                  fieldWidth: 35,
                  activeFillColor: Colors.grey.shade300,
                ),
                cursorColor: Colors.black,
                keyboardType: TextInputType.number,
                length: 4,
                controller: widget.roomNumberController,
                appContext: context,
                onChanged: (String s) {
                  widget.onPinCodeChanged();
                  maxOccupancy = null;
                  error = '';
                  if (widget.roomNumberController.text.length == 4) {
                    for (final Bed bed in widget.beds ?? []) {
                      final roomNumber = bed.title?.substring(0, 4);
                      if (roomNumber == widget.roomNumberController.text) {
                        maxOccupancy = int.tryParse(
                            bed.title!.substring(bed.title!.length - 1));
                      }
                    }
                  }
                },
              ),
            ),
            const SizedBox(
              width: 4,
            ),
            const Text(
              '-',
              style: TextStyle(fontSize: 24.0),
            ),
            const SizedBox(
              width: 4,
            ),
            Expanded(
              child: PinCodeTextField(
                mainAxisAlignment: MainAxisAlignment.start,
                enableActiveFill: true,
                blinkWhenObscuring: true,
                focusNode: widget.focusNode,
                autoFocus: true,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                  selectedColor: Colors.black,
                  inactiveColor: Colors.grey.shade300,
                  inactiveFillColor: Colors.grey.shade300,
                  selectedFillColor: Colors.grey.shade300,
                  activeColor: Colors.grey.shade300,
                  shape: PinCodeFieldShape.box,
                  fieldWidth: 35,
                  activeFillColor: Colors.grey.shade300,
                ),
                cursorColor: Colors.black,
                keyboardType: TextInputType.number,
                length: 1,
                controller: widget.occupancyController,
                appContext: context,
                onChanged: (String s) {
                  if (s.isNotEmpty) {
                    final int value = int.tryParse(s) ?? -1;
                    if (value <= 0 || value > (maxOccupancy ?? 1)) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        widget.occupancyController.clear();
                      });
                      setState(() {
                        error =
                            'Occupancy should be less than or equal to the number of beds in the room and not equal to zero';
                      });
                    } else {
                      widget.onPinCodeChanged();
                      setState(() {
                        error = '';
                      });
                    }
                  } else {
                    if (widget.setNoOccupancy != null) widget.setNoOccupancy!();
                  }
                },
              ),
            ),
          ],
        ),
        if (maxOccupancy != null) Text('Occupancy - $maxOccupancy'),
        if (error.isNotEmpty)
          Text(
            error,
          ),
      ],
    );
  }
}
