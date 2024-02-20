import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VerifiedUserImageWidget extends StatelessWidget {
  final String image;
  final double radius;

  const VerifiedUserImageWidget(
      {super.key, required this.image, required this.radius});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: radius + radius / 3,
          width: radius + radius / 3,
          // padding: EdgeInsets.only(right: 10, bottom: 10),
          child: Container(
              height: radius,
              width: radius,
              decoration: BoxDecoration(
                  color: Theme.of(context).disabledColor.withOpacity(0.3),
                  shape: BoxShape.circle),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  image,
                  fit: BoxFit.fitWidth,
                ),
              )),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColorLight,
              shape: BoxShape.circle,
            ),
            child: Icon(
              CupertinoIcons.checkmark_seal_fill,
              color: Theme.of(context).primaryColor,
              size: radius / 3,
            ),
          ),
        )
      ],
    );
  }
}
