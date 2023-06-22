// 📦 Package imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
// 🌎 Project imports:

class FingerPrintAuthHelper {
  final LocalAuthentication localAuthentication;
  FingerPrintAuthHelper({
    required this.localAuthentication,
  });

  Future<bool> canAuthenticate() async {
    try {
      final isDeviceSupported = await localAuthentication.isDeviceSupported();
      final canAuthenticateWithBiometrics =
          await localAuthentication.canCheckBiometrics;
      bool isDeviceBiometricsSupported =
          (isDeviceSupported || canAuthenticateWithBiometrics);
      debugPrint("Device can use biometric $isDeviceBiometricsSupported");
      return isDeviceBiometricsSupported;
    } on PlatformException catch (e) {
      debugPrint("Unable to use biometric ${e.message}");
      return false;
    }
  }

  Future<bool> authenticate() async {
    try {
      final isAuthSuccessful = await localAuthentication.authenticate(
        localizedReason: 'Please authenticate to login',
        options: const AuthenticationOptions(
          stickyAuth: true,
        ),
      );
      debugPrint("Authentication successful $isAuthSuccessful");
      return isAuthSuccessful;
    } on PlatformException catch (e) {
      debugPrint("Reason for been unable to use ${e.toString()}");
      return false;
    }
  }
}
