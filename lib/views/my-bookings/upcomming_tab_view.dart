import 'package:care_connect/resources/data/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class UpcommingTabView extends StatefulWidget {
  const UpcommingTabView({super.key});

  @override
  State<UpcommingTabView> createState() => _UpcommingTabViewState();
}

class _UpcommingTabViewState extends State<UpcommingTabView> {
 
  bool isReminder = true;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (int i = 0; i < DataClass.upcommingBookings.length; i++) ...[
            UpcommingTabViewCardWidget(
              name: DataClass.upcommingBookings[i]['name'],
              image: DataClass.upcommingBookings[i]['image'],
              dateTime: DataClass.upcommingBookings[i]['date'],
              bookingId: DataClass.upcommingBookings[i]['bookingId'],
              location: DataClass.upcommingBookings[i]['location'],
            ),
            const SizedBox(
              height: 20,
            )
          ]
        ],
      ),
    );
  }
}

class UpcommingTabViewCardWidget extends StatefulWidget {
  final String image;
  final String name;
  final String location;
  final String bookingId;
  final String dateTime;

  const UpcommingTabViewCardWidget(
      {super.key,
      required this.image,
      required this.name,
      required this.location,
      required this.bookingId,
      required this.dateTime});

  @override
  State<UpcommingTabViewCardWidget> createState() =>
      _UpcommingTabViewCardWidgetState();
}

class _UpcommingTabViewCardWidgetState
    extends State<UpcommingTabViewCardWidget> {
  bool isReminder = true;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
            border: Border.all(
                width: 0.5,
                color: Theme.of(context).disabledColor.withOpacity(0.5)),
            color: Theme.of(context).primaryColorLight,
            borderRadius: BorderRadius.circular(12)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Text(
                  "${widget.dateTime} - 10:00 AM",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Expanded(child: Container()),
                Text(
                  "Remind me",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Transform.scale(
                  scaleX: 0.8,
                  scaleY: 0.6,
                  child: CupertinoSwitch(
                      activeColor: Theme.of(context).primaryColor,
                      value: isReminder,
                      onChanged: (value) {
                        setState(() {
                          isReminder = value;
                        });
                      }),
                )
              ],
            ),
            Divider(
              thickness: 0.5,
              color: Theme.of(context).disabledColor.withOpacity(0.5),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 120,
                  width: 90,
                  margin: const EdgeInsets.only(right: 14),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Theme.of(context).disabledColor.withOpacity(0.1)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      widget.image,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 40,
                      width: MediaQuery.of(context).size.width -
                          90 -
                          40 -
                          14 -
                          8 -
                          32 -
                          2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            height: 30,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.1),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  CupertinoIcons.checkmark_seal_fill,
                                  color: Theme.of(context).primaryColor,
                                  size: 16,
                                ),
                                const SizedBox(
                                  width: 6,
                                ),
                                Text(
                                  "Proffesional Doctor",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          color: Theme.of(context).primaryColor,
                                          fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      widget.name,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: Theme.of(context).primaryColor,
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(widget.location,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: Theme.of(context).disabledColor,
                                )),
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.account_balance_wallet_outlined,
                          color: Theme.of(context).primaryColor,
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text("Booking ID :",
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: Theme.of(context).disabledColor,
                                )),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(widget.bookingId,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: Theme.of(context).primaryColor,
                                )),
                      ],
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Divider(
              thickness: 0.5,
              color: Theme.of(context).disabledColor.withOpacity(0.5),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              // height: 60,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.35,
                    height: 40,
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Theme.of(context).primaryColor.withOpacity(0.3),
                            elevation: 0.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50))),
                        child: Text(
                          "Cancel",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold),
                        )),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.35,
                    height: 40,
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            elevation: 0.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50))),
                        child: Text(
                          "Re Schedule",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  color: Theme.of(context).primaryColorLight,
                                  fontWeight: FontWeight.bold),
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
