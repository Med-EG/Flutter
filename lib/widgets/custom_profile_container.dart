import 'package:flutter/material.dart';

class CustomProfileContainer extends StatelessWidget {
  const CustomProfileContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 130,
        width: 130,
        decoration: const BoxDecoration(
          color: Color(0xffE7E7E7),
          shape: BoxShape.circle,
        ),
        child: Stack(
          children: [
            Center(
              child: Image.asset(
                'assets/images/Image.png',
              ),
            ),
            Positioned(
              bottom: 0,
              left: 100,
              right: 0,
              child: Container(
                height: 42,
                width: 42,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue, // Color of the circle
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ));
  }
}
