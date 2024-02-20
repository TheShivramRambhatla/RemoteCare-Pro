import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../custom-icons/my_custom_icons_icons.dart';

class DataClass {
  static const List<Map> hospitalData = [
    {
      "name": "Elevate Dental",
      "image": "assets/images/hospital1.jpg",
      "time": "15",
      "distance": "1.5",
      "rating": "4.8",
      "reviews": "2.9",
      "location": "Near Tatibandh Raipur",
      "speciality": "Dentel, Skin Care"
    },
    {
      "name": "Denta Care Clinic",
      "image": "assets/images/hospital2.jpg",
      "time": "20",
      "distance": "2.5",
      "rating": "4.3",
      "reviews": "1.4",
      "location": "New Rajendra Nagar Raipur",
      "speciality": "Orthopedics, Skin Care"
    },
    {
      "name": "Dental Clinic",
      "image": "assets/images/hospital3.jpg",
      "time": "25",
      "distance": "3.5",
      "rating": "3.8",
      "reviews": "3.6",
      "location": "Near Vishal Mega Mart,Aamapara, Raipur",
      "speciality": "Cardiology, Dentel Care"
    },
    {
      "name": "AIIMS Hospital",
      "image": "assets/images/hospital4.jpg",
      "time": "10",
      "distance": "1.3",
      "rating": "4.9",
      "reviews": "2.5",
      "location": "Shree Ram Chowk Kota, Raipur",
      "speciality": "Dentel Care, Skin Care"
    },
  ];

  static const List<Map> doctorData = [
    {
      "name": "Dr. Bharti Sharma",
      "image": "assets/images/doctor1.png",
      "spacialist": "Dentist",
      "rating": 4.5,
      "reviews": "30",
    },
    {
      "name": "Dr. Soni Sharma",
      "image": "assets/images/doctor2.png",
      "spacialist": "Dentist",
      "rating": 3.9,
      "reviews": "26"
    },
    {
      "name": "Dr. Laxmi Dhiwer",
      "image": "assets/images/doctor3.png",
      "spacialist": "Cardiologist",
      "rating": 4.8,
      "reviews": "50"
    },
    {
      "name": "Dr. Suman Rajput",
      "image": "assets/images/doctor4.png",
      "spacialist": "Neurologist",
      "rating": 4.2,
      "reviews": "70"
    },
  ];

  static const List<String> filterList = [
    "Verified",
    "Latest",
    "With Photos",
    "Rating",
    "Date",
    "Verified Purchase",
    "Length",
    "Customer Service",
    "Location"
  ];

  static const List<Map> reviewList = [
    {
      "name": "Rajesh Kumar",
      "review":
          "Doctor ne bahut achha ilaj kiya. Main bahut khush hoon. 5/5 rating!",
      "rating": 5,
      "image": "assets/images/doctor1.png",
      "review_month": "5"
    },
    {
      "name": "Pooja Sharma",
      "review":
          "Dr. Gupta ka ilaj mujhe behad faydemand saabit hua. 4/5 rating!",
      "rating": 4,
      "image": "assets/images/doctor2.png",
      "review_month": "4"
    },
    {
      "name": "Amit Singh",
      "review": "Maine Dr. Patel se achha parichay kiya. 4/5 rating!",
      "rating": 4,
      "image": "assets/images/doctor3.png",
      "review_month": "3"
    },
    {
      "name": "Deepika Gupta",
      "review":
          "Dr. Verma ke paas ilaj karwane se meri sehat me sudhar hua. 4.5/5 rating!",
      "rating": 4.5,
      "image": "assets/images/doctor4.png",
      "review_month": "August"
    },
    {
      "name": "Suresh Kumar",
      "review":
          "Dr. Sharma ki salah se mere pareshani ka samadhan hua. 4/5 rating!",
      "rating": 4,
      "image": "assets/images/doctor2.png",
      "review_month": "October"
    },
    {
      "name": "Meera Patel",
      "review": "Dr. Reddy ne mujhe bahut accha ilaj diya. 5/5 rating!",
      "rating": 5,
      "image": "assets/images/doctor3.png",
      "review_month": "June"
    },
    {
      "name": "Rajat Singhania",
      "review": "Mera anubhav Dr. Khan ke sath behad achha tha. 4.5/5 rating!",
      "rating": 4.5,
      "image": "assets/images/doctor4.png",
      "review_month": "November"
    }
  ];

  static const List<Map> topSpecialityList = [
    {"id": 0, "specialty": "All", "description": "There is All Category"},
    {
      "id": 1,
      "specialty": "Cardiologist",
      "description": "Specializes in diagnosing and treating heart conditions."
    },
    {
      "id": 2,
      "specialty": "Orthopedic Surgeon",
      "description": "Performs surgeries related to musculoskeletal issues."
    },
    {
      "id": 3,
      "specialty": "Oncologist",
      "description": "Expert in diagnosing and treating cancer."
    },
    {
      "id": 4,
      "specialty": "Pediatrician",
      "description":
          "Focuses on the medical care of infants, children, and adolescents."
    },
    {
      "id": 5,
      "specialty": "Dermatologist",
      "description": "Deals with skin, hair, and nail disorders."
    },
    {
      "id": 6,
      "specialty": "Neurologist",
      "description":
          "Specializes in diagnosing and treating diseases of the nervous system."
    },
    {
      "id": 7,
      "specialty": "Gynecologist",
      "description": "Focuses on women's reproductive health."
    },
    {
      "id": 8,
      "specialty": "Urologist",
      "description":
          "Deals with urinary tract and male reproductive system issues."
    },
    {
      "id": 9,
      "specialty": "Psychiatrist",
      "description": "Diagnoses and treats mental health disorders."
    },
    {
      "id": 10,
      "specialty": "Endocrinologist",
      "description":
          "Specializes in hormonal disorders and the endocrine system."
    }
  ];

  static const List<Map> hospitalIconsDetailsData = [
    {
      "title": "Website",
      "icon": CupertinoIcons.globe,
    },
    {"title": "Message", "icon": CupertinoIcons.ellipses_bubble_fill},
    {"title": "Call", "icon": CupertinoIcons.phone_fill},
    {"title": "Direction", "icon": CupertinoIcons.map_fill},
    {"title": "Share", "icon": CupertinoIcons.paperplane_fill}
  ];
  static List<String> imagesList = [
    "assets/images/hospital1.jpg",
    "assets/images/hospital2.jpg",
    "assets/images/hospital3.jpg",
    "assets/images/hospital4.jpg"
  ];

  static List<Map> upcommingBookings = List.generate(10, (index) {
    final date = DateTime.now().add(Duration(days: index));
    final formattedDate = DateFormat('MMM d, y').format(date);
    final location = _getRandomIndianLocation();
    final name = _getRandomIndianName();
    final bookingId = 'DR20125${100 + index}'; // Generate booking ID
    final imageUrl = _getRandomImageUrl();

    return {
      'date': formattedDate,
      'location': location,
      'name': name,
      'image': imageUrl,
      'bookingId': bookingId,
    };
  });

  static List<Map> chatData = [
    {
      "sender": "doctor",
      "message": "Hello, kaise ho aap?",
      "timestamp": "2023-10-13T09:30:00"
    },
    {
      "sender": "me",
      "message": "Main theek hoon, lekin mera sir dard ho raha hai.",
      "timestamp": "2023-10-13T09:32:00"
    },
    {
      "sender": "doctor",
      "message": "Sir dard kab se ho raha hai? Kahan dard ho raha hai?",
      "timestamp": "2023-10-13T09:35:00"
    },
    {
      "sender": "me",
      "message":
          "Sir dard kal se ho raha hai, aur dard sar ke dono side par hai.",
      "timestamp": "2023-10-13T09:38:00"
    },
    {
      "sender": "doctor",
      "message": "Samajh gaya. Kya aapko kisi aur takleef hai?",
      "timestamp": "2023-10-13T09:40:00"
    },
    {
      "sender": "me",
      "message": "Nahi, sirf sir dard hai.",
      "timestamp": "2023-10-13T09:42:00"
    }
  ];

  static List<Map> allCategory = [
    {"title": "Dentist", "icon": FontAwesomeIcons.tooth},
    {"title": "Cardiology", "icon": FontAwesomeIcons.heartPulse},
    {"title": "Orthopedic", "icon": FontAwesomeIcons.stethoscope},
    {"title": "Neurology", "icon": FontAwesomeIcons.brain},
    {"title": "Otology", "icon": MyCustomIcons.ear2},
    {"title": "Gastroenterologist", "icon": MyCustomIcons.stomach},
    {"title": "Rhinologist", "icon": MyCustomIcons.nose2},
    {"title": "Utologist", "icon": MyCustomIcons.kidneys},
    {"title": "Pulmonologist", "icon": MyCustomIcons.lungs},
    {"title": "Hepatologist", "icon": MyCustomIcons.liver},
    // {"title": "Osteologist", "icon": MyCustomIcons.},
    {"title": "Radiology", "icon": MyCustomIcons.xRay},
    {"title": "Intestine", "icon": MyCustomIcons.intestine},
    {"title": "Pediatric", "icon": MyCustomIcons.pediatrics},
    {"title": "Herbal", "icon": MyCustomIcons.herbalMedicine},
  ];
}

String _getRandomImageUrl() {
  final image = [
    "assets/images/doctor1.png",
    "assets/images/doctor2.png",
    "assets/images/doctor3.png",
    "assets/images/doctor4.png",
  ];

  return image[Random().nextInt(image.length)];
}

String _getRandomIndianLocation() {
  final locations = [
    'Mumbai, Maharashtra',
    'Delhi, Delhi',
    'Bangalore, Karnataka',
    'Kolkata, West Bengal',
    'Chennai, Tamil Nadu',
    'Hyderabad, Telangana',
    'Pune, Maharashtra',
    'Ahmedabad, Gujarat',
    'Jaipur, Rajasthan',
    'Lucknow, Uttar Pradesh',
  ];

  return locations[Random().nextInt(locations.length)];
}

String _getRandomIndianName() {
  final names = [
    'Priya',
    'Sunita',
    'Kavita',
    'Sneha',
    'Pooja',
    'Meera',
    'Anita',
    'Mitali',
    'Neelam',
    'Ritu',
  ];

  final surnames = [
    'Sharma',
    'Verma',
    'Patel',
    'Yadav',
    'Gupta',
    'Mishra',
    'Singh',
    'Kumar',
    'Bansal',
    'Jain',
  ];

  final randomFemaleName = names[Random().nextInt(names.length)];
  final randomSurname = surnames[Random().nextInt(surnames.length)];

  return '$randomFemaleName $randomSurname';
}
