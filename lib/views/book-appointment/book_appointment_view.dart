import 'package:care_connect/resources/components/custom_bottom_button_widget.dart';
import 'package:care_connect/utils/routes/route_names.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../../resources/components/custom_back_button_widget.dart';
import '../doctor-details/doctor_details_view.dart';

class BookAppointmentView extends StatelessWidget {
  const BookAppointmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Row(
          children: [
            Spacer(),
            CustomBackButtonWidget(),
          ],
        ),
        title: Text(
          "Book Appointment",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: CustomBottomButtonWidget(
          text: "Make Appointment",
          funcation: () {
            Navigator.pushNamed(context, RouteNames.selectPackageView);
          }),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const DoctorAppointmentCardWidget(),
              const SizedBox(
                height: 20,
              ),
              Divider(
                thickness: 2,
                color: Theme.of(context).disabledColor.withOpacity(0.2),
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DoctorWorkingWidget(
                    iconData: CupertinoIcons.person_2_fill,
                    lable: "Pateints",
                    experince: "7500+",
                  ),
                  DoctorWorkingWidget(
                    iconData: FontAwesomeIcons.briefcase,
                    lable: "Exp.",
                    experince: "10+",
                  ),
                  DoctorWorkingWidget(
                    iconData: CupertinoIcons.star_slash_fill,
                    lable: "Rating",
                    experince: "4.5",
                  ),
                  DoctorWorkingWidget(
                    iconData: CupertinoIcons.chat_bubble_text_fill,
                    lable: "Reviews",
                    experince: "2549+",
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Book Appointment",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).disabledColor,
                    fontWeight: FontWeight.w300),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Day",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: 20,
              ),
              const DayWidget(),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Time",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: 20,
              ),
              const MyTimeList(
                startTime: TimeOfDay(hour: 2, minute: 30),
                endTime: TimeOfDay(hour: 20, minute: 30),
              ),
              const SizedBox(
                height: 20,
              ),

              SizedBox(
                height: 30,
                child: InputDecorator(
                  decoration: InputDecoration(
                    suffix: InkWell(
                      child: Text(
                        "Requestsd Schedule",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: Theme.of(context).primaryColor,
                            ),
                      ),
                      onTap: () {},
                    ),
                    filled: true,
                    fillColor: Theme.of(context).disabledColor.withOpacity(0.1),
                    contentPadding: const EdgeInsets.only(
                        top: 0, bottom: 0, left: 20, right: 20),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide.none),
                  ),
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Want a custom schedule?",
                        hintStyle: Theme.of(context).textTheme.bodySmall,
                        contentPadding: const EdgeInsets.symmetric(vertical: 5),
                      ),
                    ),
                  ),
                ),
              ),

              // Spacer
              const SizedBox(
                height: 80,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DayWidget extends StatefulWidget {
  const DayWidget({super.key});

  @override
  State<DayWidget> createState() => _DayWidgetState();
}

class _DayWidgetState extends State<DayWidget> {
  List<DateTime> dateList = [];
  int selectedDateIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<DateTime> dateList = generateDateList();
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: dateList.length,
        itemBuilder: (context, index) {
          DateTime date = dateList[index];
          String month = DateFormat('d MMM').format(date);
          String day = formatInDay(date);
          bool isSelected = selectedDateIndex == index;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedDateIndex = index;
              });
            },
            child: Container(
                margin: const EdgeInsets.only(left: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 4),
                decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).disabledColor),
                  color: isSelected
                      ? Theme.of(context).primaryColor
                      : Theme.of(context).primaryColorLight,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    (isSelected)
                        ? Text(
                            day,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    color: Theme.of(context).primaryColorLight),
                          )
                        : Text(
                            day,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                    (isSelected)
                        ? Text(
                            month,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    color: Theme.of(context).primaryColorLight),
                          )
                        : Text(
                            month,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                  ],
                )),
          );
        },
      ),
    );
  }

  List<DateTime> generateDateList() {
    List<DateTime> dateList = [];
    DateTime today = DateTime.now();
    dateList.add(today); // Today

    for (int i = 1; i <= 30; i++) {
      DateTime nextDay = today.add(Duration(days: i));
      dateList.add(nextDay);
    }

    return dateList;
  }

  String formatInDay(DateTime date) {
    DateTime today = DateTime.now();
    if (date.year == today.year &&
        date.month == today.month &&
        date.day == today.day) {
      return 'Today';
    } else {
      return DateFormat('E').format(date);
    }
  }
}

class MyTimeList extends StatefulWidget {
  final TimeOfDay startTime;
  final TimeOfDay endTime;

  const MyTimeList({super.key, required this.startTime, required this.endTime});

  @override
  State<MyTimeList> createState() => _MyTimeListState();
}

class _MyTimeListState extends State<MyTimeList> {
  List<TimeOfDay> timeList = [];
  int selectedTimeIndex = 0;

  @override
  Widget build(BuildContext context) {
    timeList = generateTimeList(widget.startTime, widget.endTime);
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: timeList.length,
        itemBuilder: (context, index) {
          TimeOfDay time = timeList[index];
          String formattedTime = formatTime(time);
          bool isSelected = selectedTimeIndex == index;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedTimeIndex = index;
              });
            },
            child: Container(
              margin: const EdgeInsets.only(left: 10),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 4),
              decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).disabledColor),
                color: isSelected
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).primaryColorLight,
                borderRadius: BorderRadius.circular(50),
              ),
              child: (isSelected)
                  ? Center(
                      child: Text(
                        formattedTime,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Theme.of(context).primaryColorLight),
                      ),
                    )
                  : Center(
                      child: Text(
                        formattedTime,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
            ),
          );
        },
      ),
    );
  }

  List<TimeOfDay> generateTimeList(TimeOfDay start, TimeOfDay end) {
    List<TimeOfDay> timeList = [];
    TimeOfDay currentTime = start;

    while (currentTime != end) {
      timeList.add(currentTime);
      currentTime = addHalfHour(currentTime);
    }

    timeList.add(end); // Add the end time
    return timeList;
  }

  TimeOfDay addHalfHour(TimeOfDay time) {
    final minutes = time.hour * 60 + time.minute + 30;
    return TimeOfDay(hour: minutes ~/ 60, minute: minutes % 60);
  }

  String formatTime(TimeOfDay time) {
    return DateFormat.jm().format(DateTime(2023, 1, 1, time.hour, time.minute));
  }

  String formatInDay(TimeOfDay time) {
    DateTime now = DateTime.now();
    if (time.hour == now.hour && time.minute == now.minute) {
      return 'Now';
    } else {
      return DateFormat('E')
          .format(DateTime(2023, 1, 1, time.hour, time.minute));
    }
  }
}
