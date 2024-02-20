import 'package:flutter/material.dart';

class CustomBottomButtonVer2Widget extends StatelessWidget {
  final String text1;
  final String text2;
  final VoidCallback funcation1;
  final VoidCallback funcation2;

  const CustomBottomButtonVer2Widget(
      {super.key, required this.text1,required this.text2, required this.funcation1, required this.funcation2});

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
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.35,
              height: 40,
              child: ElevatedButton(
                  onPressed: funcation1,
                  style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Theme.of(context).primaryColor.withOpacity(0.3),
                      elevation: 0.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50))),
                  child: Text(
                    text1,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold),
                  )),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.35,
              height: 40,
              child: ElevatedButton(
                  onPressed: funcation2,
                  style: ElevatedButton.styleFrom(
                      elevation: 0.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50))),
                  child: Text(
                    text2,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).primaryColorLight,
                        fontWeight: FontWeight.bold),
                  )),
            ),
          ],
        ),
          
      ),
    );
  }
}
