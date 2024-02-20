import 'package:care_connect/resources/data/data.dart';
import 'package:flutter/material.dart';

import '../../resources/components/custom_back_button_widget.dart';
import '../../resources/components/icon_with_text_widget.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

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
          "Category",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: GridView.builder(
          gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
          itemBuilder: ((context, index) => IconWithTextWidget(
                iconData: DataClass.allCategory[index]['icon'] as IconData,
                text: DataClass.allCategory[index]['title'],
              )),
          itemCount: DataClass.allCategory.length,
        ),

        //  Wrap(
        //   spacing: 10.0,
        //   runSpacing: 10,
        //   children: [
        //     for (int i = 0; i < DataClass.allCategory.length; i++)
        //       IconWithTextWidget(
        //         iconData: DataClass.allCategory[i]['icon'] as IconData,
        //         text: DataClass.allCategory[i]['title'],
        //       ),
        //   ],
        // ),
      ),
    );
  }
}
