import 'package:flutter/material.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doctor Prescription'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Doctor Prescription Details',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Medicine: Paracetamol',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Dosage: 500mg',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Frequency: 3 times a day',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement functionality to take action on prescription
                // For example, you can navigate to a new screen or perform some action.
              },
              child: Text('Take Action'),
            ),
          ],
        ),
      ),
    );
  }
}
