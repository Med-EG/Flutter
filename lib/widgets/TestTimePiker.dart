import 'package:flutter/material.dart';

class TimePiker extends StatefulWidget {
  final ValueChanged<String>? onTimeSelected; // Define the callback

  const TimePiker({Key? key, this.onTimeSelected}) : super(key: key);

  @override
  State<TimePiker> createState() => _TimePikerState();
}

class _TimePikerState extends State<TimePiker> {
  TimeOfDay selectedTime = TimeOfDay.now();

  String formatTimeOfDay(TimeOfDay time) {
    final hours = time.hour.toString().padLeft(2, '0');
    final minutes = time.minute.toString().padLeft(2, '0');
    return '$hours:$minutes';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('${formatTimeOfDay(selectedTime)}'), // Use formatted time
        ElevatedButton(
          onPressed: () async {
            final TimeOfDay? timeOfDay = await showTimePicker(
              context: context,
              initialTime: selectedTime,
              initialEntryMode: TimePickerEntryMode.dial,
            );
            if (timeOfDay != null) {
              setState(() {
                selectedTime = timeOfDay;
              });
              // Call the callback with formatted time
              widget.onTimeSelected?.call(formatTimeOfDay(timeOfDay));
            }
          },
          child: const Text("Choose Time"),
        )
      ],
    );
  }
}
