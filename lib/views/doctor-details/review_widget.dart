import 'package:care_connect/resources/data/data.dart';
import 'package:care_connect/views/doctor-details/customer_review_widget.dart';
import 'package:flutter/material.dart';

class ReviewForHospitalWidget extends StatelessWidget {
  const ReviewForHospitalWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                "Reviews",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Expanded(child: Container()),
              Icon(Icons.drive_file_rename_outline,
                  color: Theme.of(context).primaryColor),
              Text(
                "add review",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).primaryColor,
                    ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            decoration: InputDecoration(
                prefixIcon:
                    Icon(Icons.search, color: Theme.of(context).primaryColor),
                hintText: "Search in reviews"),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 30,
            width: double.maxFinite,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: DataClass.filterList.length,
                itemBuilder: (_, index) {
                  return Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: HorizentalTextWidget(
                      text: DataClass.filterList[index],
                      isSelected: true,
                    ),
                  );
                }),
          ),
          Divider(
              thickness: 2,
              color: Theme.of(context).disabledColor.withOpacity(0.2)),
          for (int i = 0; i < DataClass.reviewList.length; i++) ...[
            CustomerReviewWidget(
                custmorName: DataClass.reviewList[i]['name'],
                image: DataClass.reviewList[i]['image'],
                review: DataClass.reviewList[i]['review'],
                rating: DataClass.reviewList[i]['rating'].toString(),
                reviewDate: DataClass.reviewList[i]['review_month']),
          ],
        ],
      ),
    );
  }
}

class HorizentalTextWidget extends StatelessWidget {
  const HorizentalTextWidget({
    super.key,
    required this.text,
    required this.isSelected,
  });
  final String text;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return RawChip(
      selectedColor: Theme.of(context).primaryColor,
      selected: isSelected,
      showCheckmark: false,
      side: BorderSide(color: Theme.of(context).primaryColor.withOpacity(0.3)),
      backgroundColor: isSelected
          ? Theme.of(context).primaryColor
          : Theme.of(context).primaryColorLight,
      labelStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: isSelected
              ? Theme.of(context).primaryColorLight
              : Theme.of(context).primaryColorDark,
          fontWeight: FontWeight.w500),
      label: Text(
        text,
      ),
    );

    // Container(
    //   height: 30,
    //   padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
    //   decoration: BoxDecoration(
    //       borderRadius: BorderRadius.circular(25),
    //       color: color,
    //       border: Border.all(
    //         color: Theme.of(context).disabledColor,
    //       )),
    //   child: Text(
    //     text,
    //     textAlign: TextAlign.center,
    //     style: Theme.of(context)
    //         .textTheme
    //         .bodyMedium!
    //         .copyWith(color: textColor, fontWeight: FontWeight.w500),
    //   ),

    // );
  }
}
