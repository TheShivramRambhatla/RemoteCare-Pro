import 'package:care_connect/resources/components/custom_back_button_widget.dart';
import 'package:care_connect/resources/components/custom_bottom_button_widget.dart';
import 'package:care_connect/resources/data/data.dart';
import 'package:care_connect/views/doctor-details/review_widget.dart';
import 'package:care_connect/views/hospital-details/gallery_tab_view.dart';
import 'package:care_connect/views/hospital-details/specialist_tab_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../resources/components/icon_with_text_widget.dart';

class HospitalDetailsView extends StatefulWidget {
  const HospitalDetailsView({super.key});

  @override
  State<HospitalDetailsView> createState() => _HospitalDetailsViewState();
}

class _HospitalDetailsViewState extends State<HospitalDetailsView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController =
        TabController(length: _tabs().length, vsync: this, initialIndex: 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:
          CustomBottomButtonWidget(text: "Book Appointment", funcation: () {}),
      body: Stack(
        children: [
          // Image is here start
          Container(
            height: 260,
            width: double.maxFinite,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/hospital1.jpg"),
                    fit: BoxFit.fill)),
          ),
          Container(
            height: 260,
            width: double.maxFinite,
            color: Theme.of(context).primaryColorDark.withOpacity(0.3),
          ),
          // Image is here end

          // Details Widget is here
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Stack(
              alignment: AlignmentDirectional.topCenter,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    margin: const EdgeInsets.only(top: 210),
                    height: MediaQuery.of(context).size.height - 220,
                    padding:
                        const EdgeInsets.only(top: 40, right: 20, left: 20),
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColorLight,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Serenity Wellness Clinic",
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Text("Dental, Skin Care, Eye Care",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: Theme.of(context).disabledColor,
                                )),
                        Divider(
                          thickness: 1.5,
                          color:
                              Theme.of(context).disabledColor.withOpacity(0.2),
                        ),
                        Row(
                          children: [
                            Icon(CupertinoIcons.location_solid,
                                size: 16,
                                color: Theme.of(context).primaryColor),
                            const SizedBox(
                              width: 6,
                            ),
                            Text("8502, Prestron Rd, Raipur",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color: Theme.of(context).disabledColor,
                                    )),
                          ],
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        SizedBox(
                          height: 24,
                          child: Row(
                            children: [
                              Icon(Icons.access_time_filled,
                                  size: 16,
                                  color: Theme.of(context).primaryColor),
                              const SizedBox(
                                width: 6,
                              ),
                              Text("15 min ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        color: Theme.of(context).disabledColor,
                                      )),
                              Icon(
                                Icons.circle,
                                color: Theme.of(context).disabledColor,
                                size: 5,
                              ),
                              Text(" 2.5 km ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        color: Theme.of(context).disabledColor,
                                      )),
                              Icon(
                                Icons.circle,
                                color: Theme.of(context).disabledColor,
                                size: 5,
                              ),
                              Text("  Mon - Sun",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        color: Theme.of(context).disabledColor,
                                      )),
                              const VerticalDivider(
                                thickness: 1.5,
                              ),
                              Text("  11 AM - 11 PM",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        color: Theme.of(context).disabledColor,
                                      )),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),

                        // Details Icon Widget
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            for (int i = 0;
                                i < DataClass.hospitalIconsDetailsData.length;
                                i++) ...[
                              GestureDetector(
                                onTap: () {
                                  funcationCallback(i);
                                },
                                child: IconWithTextWidget(
                                  iconData:
                                      DataClass.hospitalIconsDetailsData[i]
                                          ['icon'] as IconData,
                                  text: DataClass.hospitalIconsDetailsData[i]
                                          ['title']
                                      .toString(),
                                ),
                              )
                            ]
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),

                        // There is TabBar
                        SizedBox(
                          height: 60,
                          width: MediaQuery.of(context).size.width,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Theme.of(context).disabledColor,
                                      width: 0.5)),
                            ),
                            child: TabBar(
                              controller: _tabController,
                              tabs: _tabs(),
                              isScrollable: true,
                              indicatorColor: Theme.of(context).primaryColor,
                              labelColor: Theme.of(context).primaryColor,
                              labelStyle: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(fontWeight: FontWeight.w400),
                              unselectedLabelColor:
                                  Theme.of(context).disabledColor,
                              unselectedLabelStyle: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(fontWeight: FontWeight.w400),
                              indicatorWeight: 4.0,
                              indicatorPadding: EdgeInsets.zero,
                              physics: const BouncingScrollPhysics(),
                            ),
                          ),
                        ),

                        // There is Tabbar View
                        Expanded(
                            child: TabBarView(
                          controller: _tabController,
                          children: _tabbarView(),
                        )),

                        const SizedBox(
                          height: 20,
                        ),
                        // There is TabBarView
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 200,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(25)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          CupertinoIcons.star_fill,
                          color: Theme.of(context).primaryColorLight,
                          size: 14,
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          "4.8",
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).primaryColorLight,
                                  ),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          "( 1.4K+ reviews )",
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.normal,
                                    color: Theme.of(context).primaryColorLight,
                                  ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Back Button and Share and Like Button is here
          Positioned(
            top: 20,
            left: 20,
            child: SizedBox(
              width: MediaQuery.of(context).size.width - 40,
              height: 60,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CustomBackButtonWidget(),
                  Expanded(child: Container()),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).primaryColorLight,
                      border: Border.all(
                          color:
                              Theme.of(context).disabledColor.withOpacity(0.5)),
                    ),
                    child: Icon(
                      Icons.share,
                      color: Theme.of(context).primaryColorDark,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).primaryColorLight,
                      border: Border.all(
                          color:
                              Theme.of(context).disabledColor.withOpacity(0.5)),
                    ),
                    child: Center(
                      child: Icon(
                        CupertinoIcons.heart,
                        color: Theme.of(context).primaryColorDark,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _tabs() {
    return <Widget>[
      const Text("Treatments"),
      const Text("Specialist"),
      const Text("Gallery"),
      const Text("Review"),
    ];
  }

  List<Widget> _tabbarView() {
    return [
      const Text("data"),
      const SpecialistTabViewInHospitalDetailsView(),
      const GalleryTabViewWidget(),
      const ReviewForHospitalWidget()
    ];
  }

  void funcationCallback(int i) {
    switch (i) {
      case 0:
        fun0();
        break;
      case 1:
        fun1();
        break;
      case 2:
        fun2();
        break;
      // case 3:
      //   fun3();
      //   break;
      // case 4:
      //   fun4();
      //   break;
      default:
        fun0();
        break;
    }
  }

  fun0() async {
    final Uri url = Uri.parse('https://flutter.dev');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  fun1() async {
    final Uri url = Uri.parse('sms:+917415752664');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  fun2() async {
    final Uri url = Uri.parse('tel:+917415752664');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  fun3() async {
    final Uri url = Uri.parse('https://flutter.dev');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  fun4() async {
    final Uri url = Uri.parse('https://flutter.dev');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
