

import 'package:sms_autofill/sms_autofill.dart';
import '../../utils/imports.dart';

class AuthController extends GetxController {
  var otpSent = false.obs;
  TextEditingController phoneController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    _listenForOtp();
  }

  Future<void> _listenForOtp() async {
    await SmsAutoFill().listenForCode;
  }

  @override
  void onClose() {
    SmsAutoFill().unregisterListener();
    super.onClose();
  }

  bool isValidPhone(String phone) {
    final regex = RegExp(r'^[6-9]\d{9}$');
    print("check currect number or not");
    print(regex.hasMatch(phone));
    return regex.hasMatch(phone);
  }

  void sendOtp() {
    otpSent.value = true;
    // TODO: Call your backend API here
  }

  void verifyOtp() {
    // TODO: Verify OTP with backend
    if (otpController.text.length == 6) {
      Get.snackbar('Success', 'OTP verified successfully');
      // Navigate to home screen or next step
      Get.offAllNamed(RouteConstant.homePage);
    } else {
      Get.snackbar('Error', 'Invalid OTP. Please try again.');
    }
  }
}
