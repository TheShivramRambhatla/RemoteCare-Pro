import 'package:care_connect/views/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../resources/components/app_title_widget.dart';
import '../../resources/components/custom_back_button_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Payment Methods Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: PaymentMethodsView(),
    );
  }
}

class PaymentMethodsView extends StatefulWidget {
  const PaymentMethodsView({Key? key}) : super(key: key);

  @override
  State<PaymentMethodsView> createState() => _PaymentMethodsViewState();
}

class _PaymentMethodsViewState extends State<PaymentMethodsView> {
  String paymentMethod = "card";

  // Function to handle the submit button click
  void _handleSubmit() {
    // Here you can implement logic to confirm booking and generate a booking ID
    String bookingId = 'ABC123'; // Example booking ID

    // Navigate to the booking confirmation page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BookingConfirmationPage(bookingId: bookingId),
      ),
    );
  }

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
          "Payment Methods",
          style: Theme.of(context).textTheme.headline6,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 40,
            ),
            const AppTitleWidget(
              title: "Credit & Debit Card",
              isSeeAll: false,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 0.5,
                      color: Theme.of(context).disabledColor.withOpacity(0.6)),
                  borderRadius: BorderRadius.circular(12)),
              child: ListTile(
                visualDensity: VisualDensity.standard,
                onTap: () {
                  setState(() {
                    paymentMethod = "card";
                  });
                },
                title: Text(
                  "Add New Card",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(color: Theme.of(context).disabledColor),
                ),
                leading: Icon(
                  FontAwesomeIcons.creditCard,
                  color: Theme.of(context).primaryColor,
                ),
                trailing: Radio(
                  groupValue: paymentMethod,
                  onChanged: (value) {
                    setState(() {
                      paymentMethod = value.toString();
                    });
                  },
                  value: "card",
                  activeColor: Theme.of(context).primaryColor,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const AppTitleWidget(
              title: "More Payment Options",
              isSeeAll: false,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 0.5,
                      color: Theme.of(context).disabledColor.withOpacity(0.6)),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12))),
              child: ListTile(
                visualDensity: VisualDensity.standard,
                onTap: () {
                  setState(() {
                    paymentMethod = "paypal";
                  });
                },
                title: Text(
                  "Paypal",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(color: Theme.of(context).disabledColor),
                ),
                leading: Icon(
                  FontAwesomeIcons.paypal,
                  color: Theme.of(context).primaryColor,
                ),
                trailing: Radio(
                  groupValue: paymentMethod,
                  onChanged: (value) {
                    setState(() {
                      paymentMethod = value.toString();
                    });
                  },
                  value: "paypal",
                  activeColor: Theme.of(context).primaryColor,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 0.5,
                      color: Theme.of(context).disabledColor.withOpacity(0.6)),
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12))),
              child: ListTile(
                visualDensity: VisualDensity.standard,
                onTap: () {
                  setState(() {
                    paymentMethod = "apple-pay";
                  });
                },
                title: Text(
                  "Apple Pay",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(color: Theme.of(context).disabledColor),
                ),
                leading: Icon(
                  FontAwesomeIcons.apple,
                  color: Theme.of(context).primaryColor,
                ),
                trailing: Radio(
                  groupValue: paymentMethod,
                  onChanged: (value) {
                    setState(() {
                      paymentMethod = value.toString();
                    });
                  },
                  value: "apple-pay",
                  activeColor: Theme.of(context).primaryColor,
                ),
              ),
            )
          ],
        ),
      ),
      // Add buttons at the bottom of the page
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton.extended(
            onPressed: _handleSubmit,
            label: Text('Submit'),
            icon: Icon(Icons.check),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class BookingConfirmationPage extends StatelessWidget {
  final String bookingId;

  const BookingConfirmationPage({Key? key, required this.bookingId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking Confirmation'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your booking has been confirmed!',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Text(
              'Booking ID: $bookingId',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 40),
            TextButton(
              onPressed: () {
                // Navigate to another page within the same tab
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PrescriptionPage(),
                  ),
                );
              },
              child: Text(
                'Old Health History',
                style: TextStyle(fontSize: 14),
              ),
            ),
            TextButton(
              onPressed: () {
                // Navigate to another page within the same tab
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeView(),
                  ),
                );
              },
              child: Text(
                'Go to Home',
                style: TextStyle(fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PrescriptionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prescription'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Prescription History',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Table(
              border: TableBorder.all(),
              columnWidths: {
                0: FlexColumnWidth(1),
                1: FlexColumnWidth(2),
              },
              children: [
                TableRow(
                  children: [
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Date',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Details',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('2024-02-20'),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Blood Pressure: 120/80 mmHg'),
                            Text('Sugar Level: 100 mg/dL'),
                            Text('Temperature: 98.6°F'),
                            Text('Weight: 70 kg'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('2024-02-15'),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Blood Pressure: 130/85 mmHg'),
                            Text('Sugar Level: 110 mg/dL'),
                            Text('Temperature: 98.2°F'),
                            Text('Weight: 71 kg'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('2024-02-10'),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Blood Pressure: 125/82 mmHg'),
                            Text('Sugar Level: 105 mg/dL'),
                            Text('Temperature: 98.4°F'),
                            Text('Weight: 69 kg'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('2024-02-05'),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Blood Pressure: 118/78 mmHg'),
                            Text('Sugar Level: 95 mg/dL'),
                            Text('Temperature: 98.0°F'),
                            Text('Weight: 68 kg'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                // Add more TableRow widgets as needed for additional entries
              ],
            ),
          ],
        ),
      ),
    );
  }
}
