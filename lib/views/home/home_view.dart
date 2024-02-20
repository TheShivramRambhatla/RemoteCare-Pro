import 'package:care_connect/resources/data/data.dart';
import 'package:care_connect/utils/routes/route_names.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../resources/components/app_title_widget.dart';
import '../../resources/components/icon_with_text_widget.dart';
import '../../resources/components/doctor_card_widget.dart';
import '../../resources/components/hospital_card_widget.dart';
import '../../resources/components/schedule_card_widget.dart';
import 'home_appbar_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Map> hospitalData = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 40,
            ),
            const HomeAppbarWidget(),
            const SizedBox(
              height: 20,
            ),
            searchFieldWidget(context),
            const SizedBox(
              height: 20,
            ),
            AppTitleWidget(
              title: "Upcoming Schedule",
              bacthString: "4",
              seeAllFun: () {
                Navigator.pushNamed(context, RouteNames.myBookingsView);
              },
            ),
            const SizedBox(
              height: 20,
            ),
            const ScheduleCardWidget(),
            const SizedBox(
              height: 20,
            ),
            AppTitleWidget(
              title: "Doctor Speciality",
              seeAllFun: () {
                Navigator.pushNamed(context, RouteNames.allCategoryView);
              },
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 80,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categoryData.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                            context, RouteNames.topSpecialityView);
                      },
                      child: Container(
                        margin: const EdgeInsets.only(left: 50),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment
                              .center, // Align text vertically centered
                          children: [
                            Icon(
                              categoryData[index]['icon'] as IconData,
                              size: 36, // Adjust the size as needed
                              color: Colors
                                  .blue, // Customize the color if necessary
                            ),
                            SizedBox(
                                height:
                                    4), // Add some spacing between icon and text
                            Text(
                              categoryData[index]['title'].toString(),
                              textAlign: TextAlign
                                  .center, // Align text centered horizontally
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),

            const SizedBox(
              height: 20,
            ),
            AppTitleWidget(
              title: "Nearby Hospital",
              seeAllFun: () {
                Navigator.pushNamed(context, RouteNames.nearByHospitalsView);
              },
            ),
            const SizedBox(
              height: 10,
            ),

            // There is start Hospital card Widget
            SizedBox(
              height: 220,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: DataClass.hospitalData.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                            context, RouteNames.hospitalDetailsView);
                      },
                      child: HospitalCardWidget(
                        name: DataClass.hospitalData[index]["name"],
                        time: DataClass.hospitalData[index]["time"],
                        image: DataClass.hospitalData[index]["image"],
                        distence: DataClass.hospitalData[index]["distance"],
                        rating: DataClass.hospitalData[index]["rating"],
                      ),
                    );
                  }),
            ),
            const SizedBox(
              height: 20,
            ),

            // Top Spacialist

            AppTitleWidget(
              title: "Top Specialist",
              seeAllFun: () {
                Navigator.pushNamed(context, RouteNames.topSpecialityView);
              },
            ),
            const SizedBox(
              height: 10,
            ),
            for (int i = 0; i < DataClass.doctorData.length; i++) ...[
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, RouteNames.doctorDetailsView);
                },
                child: DoctorCardWidget(
                    name: DataClass.doctorData[i]['name'],
                    image: DataClass.doctorData[i]['image'],
                    rating: DataClass.doctorData[i]['rating'],
                    reviews: DataClass.doctorData[i]['reviews'],
                    spacialist: DataClass.doctorData[i]['spacialist']),
              )
            ],

            // Spacer is here
            const SizedBox(
              height: 80,
            ),
          ],
        ),
      ),
    ));
  }

  Widget searchFieldWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        decoration: InputDecoration(
            prefixIcon: const Icon(CupertinoIcons.search),
            hintText: "Search",
            suffixIcon: Icon(
              CupertinoIcons.slider_horizontal_3,
              color: Theme.of(context).primaryColorLight,
            )),
      ),
    );

    //  Row(
    //   mainAxisSize: MainAxisSize.min,
    //   children: [
    //     SizedBox(
    //       height: 50,
    //       width: MediaQuery.of(context).size.width - 120,
    //       child: const TextField(
    //         decoration: InputDecoration(
    //             prefixIcon: Icon(CupertinoIcons.search), hintText: "Search"),
    //       ),
    //     ),
    //     const Spacer(),
    //     Container(
    //       height: 50,
    //       width: 50,
    //       decoration: BoxDecoration(
    //           borderRadius: BorderRadius.circular(12),
    //           color: Theme.of(context).primaryColor),
    //       child:
    //     )
    //   ],
    // );
  }

  List<Map> categoryData = [
    {"title": "Dentist", "icon": FontAwesomeIcons.tooth},
    {"title": "Cardiology", "icon": FontAwesomeIcons.heartPulse},
    {"title": "Orthopedic", "icon": FontAwesomeIcons.stethoscope},
    {"title": "Neurology", "icon": FontAwesomeIcons.brain},
    {"title": "Dermatology", "icon": FontAwesomeIcons.allergies},
    {"title": "Gynecology", "icon": FontAwesomeIcons.venus},
  ];
}
