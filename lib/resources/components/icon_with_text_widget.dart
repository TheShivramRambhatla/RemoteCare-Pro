import 'package:flutter/material.dart';

class IconWithTextWidget extends StatelessWidget {
  final IconData iconData;
  final String text;
  final VoidCallback? voidCallback;

  const IconWithTextWidget(
      {super.key,
      required this.iconData,
      required this.text,
      this.voidCallback});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: voidCallback,
      child: SizedBox(
        height: 80,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).primaryColor.withOpacity(0.2)),
                child: Icon(
                  iconData,
                  color: Theme.of(context).primaryColor,
                  size: 30,
                )),
            const SizedBox(
              height: 6,
            ),
            SizedBox(
              width: 60,
              child: Center(
                child: Text(
                  text,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.justify,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
