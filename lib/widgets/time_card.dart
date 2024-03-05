import 'package:flutter/material.dart';
import 'package:med_eg/constants/colors.dart';

class TimeCard extends StatefulWidget {
  const TimeCard({super.key, required this.width, required this.borderRadius});
  final double width;

  final double borderRadius;
  @override
  State<TimeCard> createState() => _TimeCardState();
}

class _TimeCardState extends State<TimeCard> {
  bool _isPressed = false;
  @override
  Widget build(BuildContext context) {
    Color containerColor = _isPressed ? const Color.fromRGBO(255, 255, 255, 1) : kPrimaryColor;
    Color textColor = _isPressed ? kPrimaryColor : Colors.white;
    double elevation = _isPressed ? 0 : 10;
    return GestureDetector(
      onTap: () {
        setState(() {
          _isPressed = !_isPressed;
        });
      },
      child: Material(
        color: Colors.transparent,
        elevation: elevation,
        child: Container(
          width: widget.width,
          decoration: BoxDecoration(
            color: containerColor,
            border: Border.all(color: kPrimaryColor, width: 2),
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Fr',
                style: TextStyle(
                    color: textColor,
                    fontSize: 13,
                    fontWeight: FontWeight.w600),
              ),
              Text('20',
                  style: TextStyle(
                      color: textColor,
                      fontSize: 13,
                      fontWeight: FontWeight.w600))
            ],
          ),
        ),
      ),
    );
  }
}
