import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeAppbarWidget extends StatelessWidget {
  const HomeAppbarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Location",
              textAlign: TextAlign.start,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Theme.of(context).disabledColor),
            ),
            const SizedBox(
              height: 4.0,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  CupertinoIcons.location_solid,
                  color: Theme.of(context).primaryColor,
                ),
                Text(
                  "Rajam, Andhra Pradesh",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const Icon(
                  CupertinoIcons.chevron_down,
                  size: 14.0,
                ),
              ],
            ),
          ],
        ),
        const Spacer(),
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).disabledColor.withOpacity(0.2)),
          child: Icon(
            CupertinoIcons.bell_fill,
            color: Theme.of(context).primaryColorDark,
          ),
        )
      ],
    );
  }
}
