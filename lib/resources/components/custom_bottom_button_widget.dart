import 'package:flutter/material.dart';

class CustomBottomButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback funcation;

  const CustomBottomButtonWidget(
      {super.key, required this.text, required this.funcation});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: Container(
        height: 80,
        width: double.maxFinite,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColorLight,
            border: Border.all(
                color: Theme.of(context).disabledColor.withOpacity(0.2)),
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12), topRight: Radius.circular(12))),
        child: ElevatedButton(
          onPressed: funcation,
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).primaryColorLight,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
