import 'package:care_connect/views/doctor-details/review_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../resources/components/custom_back_button_widget.dart';
import '../../resources/data/data.dart';
import '../favorites/hospital_favorites_view.dart';

class NearByHospitalView extends StatefulWidget {
  const NearByHospitalView({super.key});

  @override
  State<NearByHospitalView> createState() => _NearByHospitalViewState();
}

class _NearByHospitalViewState extends State<NearByHospitalView> {
  int selectedCategory = 0;
  bool isFavorite = false;
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
          "Nearby Hospital",
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
              for (int index = 0;
                  index < DataClass.hospitalData.length;
                  index++) ...[
                HospitalFavoriteCardWidget(
                  name: DataClass.hospitalData[index]["name"],
                  time: DataClass.hospitalData[index]["time"],
                  image: DataClass.hospitalData[index]["image"],
                  distence: DataClass.hospitalData[index]["distance"],
                  rating: DataClass.hospitalData[index]["rating"],
                  review: DataClass.hospitalData[index]["reviews"].toString(),
                  location:
                      DataClass.hospitalData[index]["location"].toString(),
                  spacialist:
                      DataClass.hospitalData[index]["speciality"].toString(),
                  isFavorite: false,
                ),
                const SizedBox(
                  height: 6,
                )
              ],
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
