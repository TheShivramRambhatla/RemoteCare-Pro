import 'package:flutter/material.dart';

class AppTitleWidget extends StatelessWidget {
  const AppTitleWidget(
      {super.key,
      required this.title,
      this.bacthString,
      this.isSeeAll = true,
      this.seeAllFun});
  final String title;
  final String? bacthString;
  final bool? isSeeAll;
  final VoidCallback? seeAllFun;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge!,
        ),
        (bacthString == null || bacthString!.isEmpty)
            ? Container()
            : Container(
                padding: const EdgeInsets.all(6),
                margin: const EdgeInsets.only(left: 6),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).primaryColor),
                child: Text(
                  bacthString!,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Theme.of(context).primaryColorLight),
                ),
              ),
        const Spacer(),
        (isSeeAll!)
            ? TextButton(
                onPressed: seeAllFun,
                child: Text(
                  "See all",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Theme.of(context).primaryColor),
                ),
              )
            : Container(),
      ],
    );
  }
}
