import 'package:care_connect/utils/routes/utils.dart';
import 'package:flutter/material.dart';

import '../../resources/components/doctor_card_widget.dart';
import '../../resources/data/data.dart';

class DoctorFavoritesView extends StatelessWidget {
  const DoctorFavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (int i = 0; i < DataClass.doctorData.length; i++) ...[
            InkWell(
              onTap: () {
                UtilsClass.bottomModalWidget(
                    context,
                    DataClass.doctorData[i]['image'],
                    DataClass.doctorData[i]['name'],
                    DataClass.doctorData[i]['reviews'],
                    DataClass.doctorData[i]['spacialist'],
                    DataClass.doctorData[i]['rating']);
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
    );
  }
}
