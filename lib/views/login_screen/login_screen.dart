
import '../../utils/imports.dart';

class LoginScreen extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Organic Grow',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40),
            TextField(
              controller: authController.phoneController,
              keyboardType: TextInputType.phone,
              maxLength: 10,
              decoration: InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(),
                counterText: '',
              ),
              onChanged: (value) {
                if (value.length > 10) {
                  authController.phoneController.text = value.substring(0, 10);
                  authController.phoneController.selection =
                      TextSelection.fromPosition(TextPosition(offset: 10));
                }
              },
            ),
            SizedBox(height: 20),

            // OTP Section
            Obx(
              () => authController.otpSent.value
                  ? Column(
                      children: [
                        Pinput(
                          length: 6,
                          controller: authController.otpController,
                          keyboardType: TextInputType.number,
                          autofocus: true,
                          onCompleted: (pin) {
                            authController.otpController.text = pin;
                          },
                          defaultPinTheme: PinTheme(
                            width: 56,
                            height: 56,
                            textStyle: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.green),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Resend OTP button
                            ElevatedButton(
                              onPressed: () {
                                final phone =
                                    authController.phoneController.text;
                                if (authController.isValidPhone(phone)) {
                                  authController.sendOtp();
                                } else {
                                  Get.snackbar(
                                    'Error',
                                    'Enter a valid 10-digit mobile number starting with 6-9',
                                  );
                                }
                              },
                              child: Text('Resend OTP'),
                            ),

                            // Verify OTP button
                            ElevatedButton(
                              onPressed: () {
                                authController.verifyOtp();
                              },
                              child: Text('Verify OTP'),
                            ),
                          ],
                        ),
                      ],
                    )
                  : ElevatedButton(
                      // First Send OTP button (before showing Pinput)
                      onPressed: () {
                        final phone = authController.phoneController.text;
                        if (authController.isValidPhone(phone)) {
                          authController.sendOtp();
                        } else {
                          Get.snackbar(
                            'Error',
                            'Enter a valid 10-digit mobile number starting with 6-9',
                          );
                        }
                      },
                      child: Text('Send OTP'),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
