import 'package:care_connect/views/allow-location/allow_location_view.dart';
import 'package:care_connect/views/allow-location/location_manually_view.dart';
import 'package:care_connect/views/book-appointment/patient_details_view.dart';
import 'package:care_connect/views/book-appointment/payment_methods_view.dart';
import 'package:care_connect/views/book-appointment/select_package_view.dart';
import 'package:care_connect/views/categorys/categorys_view.dart';
import 'package:care_connect/views/chat/single_chat_view.dart';
import 'package:care_connect/views/dashboard/dashboard_view.dart';
import 'package:care_connect/views/doctor-details/doctor_details_view.dart';
import 'package:care_connect/views/favorites/favorites_view.dart';
import 'package:care_connect/views/hospital-details/hospital_details_view.dart';
import 'package:care_connect/views/my-bookings/my_bookings_view.dart';
import 'package:care_connect/views/profile/help-center/help_canter_view.dart';
import 'package:care_connect/views/profile/privacy-policy/privacy_policy.dart';
import 'package:care_connect/views/profile/settings/settings_view.dart';
import 'package:care_connect/views/profile/your-profile/your_profile_view.dart';
import 'package:care_connect/views/top-specialist/near_by_hospital_view.dart';
import 'package:care_connect/views/top-specialist/top_specialist_view.dart';
import 'package:flutter/material.dart';

import '../../views/book-appointment/book_appointment_view.dart';
import '../../views/onboarding/onboarding_view.dart';
import '../../views/sign-in-create-account/complete-profile/complete_profile_view.dart';
import '../../views/sign-in-create-account/create-account/create_account_view.dart';
import '../../views/sign-in-create-account/new-password/new_password_view.dart';
import '../../views/sign-in-create-account/sign-in/sign_in_view.dart';
import '../../views/sign-in-create-account/verify/verify_code_view.dart';
import '../../views/welcome/welcome_view.dart';
import 'route_names.dart';

class Routes {
  static Route<dynamic> genrateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RouteNames.onboardingView:
        return MaterialPageRoute(builder: (context) => const OnboardingView());
      case RouteNames.welcomeView:
        return MaterialPageRoute(builder: (context) => const WelcomeView());
      case RouteNames.createAccountView:
        return MaterialPageRoute(
            builder: (context) => const CreateAccountView());
      case RouteNames.signInView:
        return MaterialPageRoute(builder: (context) => const SignInView());

      case RouteNames.verifyCodeView:
        return MaterialPageRoute(builder: (context) => const VerifyCodeView());
      case RouteNames.newPasswordView:
        return MaterialPageRoute(builder: (context) => const NewPasswordView());
      case RouteNames.completeProfileView:
        return MaterialPageRoute(
            builder: (context) => const CompleteProfileView());
      case RouteNames.topSpecialityView:
        return MaterialPageRoute(
            builder: (context) => const TopSpecialistView());
      case RouteNames.allCategoryView:
        return MaterialPageRoute(builder: (context) => const CategoryView());
      case RouteNames.hospitalDetailsView:
        return MaterialPageRoute(
            builder: (context) => const HospitalDetailsView());
      case RouteNames.doctorDetailsView:
        return MaterialPageRoute(
            builder: (context) => const DoctorDetailsView());
      case RouteNames.bookAnAppointmentView:
        return MaterialPageRoute(
            builder: (context) => const BookAppointmentView());
      case RouteNames.selectPackageView:
        return MaterialPageRoute(
            builder: (context) => const SelectPackageView());
      case RouteNames.pateintsDetailsView:
        return MaterialPageRoute(
            builder: (context) => const PateintsDetailsView());
      case RouteNames.paymentDatailsView:
        return MaterialPageRoute(
            builder: (context) => const PaymentMethodsView());
      case RouteNames.myBookingsView:
        return MaterialPageRoute(builder: (context) => const MyBookingsView());
      case RouteNames.allowLocationView:
        return MaterialPageRoute(
            builder: (context) => const AllowLocationAccessView());
      case RouteNames.nearByHospitalsView:
        return MaterialPageRoute(
            builder: (context) => const NearByHospitalView());
      case RouteNames.locationManuallyView:
        return MaterialPageRoute(
            builder: (context) => const LocationManuallyView());
      case RouteNames.dashboardView:
        return MaterialPageRoute(builder: (context) => const DashboardView());
      case RouteNames.singleChatView:
        return MaterialPageRoute(builder: (context) => const SingleChatView());
      case RouteNames.helpCenterView:
        return MaterialPageRoute(builder: (context) => const HelpCenterView());
      case RouteNames.privacyPolicyView:
        return MaterialPageRoute(
            builder: (context) => const PrivacyPolicyView());
      case RouteNames.settingsView:
        return MaterialPageRoute(builder: (context) => const SettingsView());
      case RouteNames.yourProfileView:
        return MaterialPageRoute(builder: (context) => const YourProfileView());
      case RouteNames.paymentMethodsView:
        return MaterialPageRoute(
            builder: (context) => const PaymentMethodsView());
      case RouteNames.favoriteView:
        return MaterialPageRoute(builder: (context) => const FavoritesView());

      default:
        return MaterialPageRoute(builder: (context) => const OnboardingView());
    }
  }
}
