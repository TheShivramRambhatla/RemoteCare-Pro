import 'package:care_connect/views/doctor-details/review_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../resources/components/custom_back_button_widget.dart';
import '../../resources/components/doctor_card_widget.dart';
import '../../resources/data/data.dart';
import '../../utils/routes/route_names.dart';

class TopSpecialistView extends StatefulWidget {
  const TopSpecialistView({
    super.key,
  });

  @override
  State<TopSpecialistView> createState() => _TopSpecialistViewState();
}

class _TopSpecialistViewState extends State<TopSpecialistView> {
  int selectedCategory = 0;
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
          "Top Specialist",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () {},
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                    color: Theme.of(context).disabledColor.withOpacity(0.5)),
              ),
              child: Icon(
                CupertinoIcons.search,
                color: Theme.of(context).primaryColorDark,
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 30,
                width: double.maxFinite,
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: DataClass.topSpecialityList.length,
                    itemBuilder: (_, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedCategory = index;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.only(left: 10),
                          child: HorizentalTextWidget(
                            text: DataClass.topSpecialityList[index]
                                ['specialty'],
                            isSelected: true,
                          ),
                        ),
                      );
                    }),
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
                ),
                const SizedBox(
                  height: 6,
                )
              ],
              const SizedBox(
                height: 40,
              )
            ],
          ),
        ),
      ),
    );
  }
}
