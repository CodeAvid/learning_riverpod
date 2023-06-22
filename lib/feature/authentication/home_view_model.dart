import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_view_model.g.dart';

@riverpod
String login(LoginRef ref) {
  return 'Login with Biometric';
}

@riverpod
class HomeViewModel extends _$HomeViewModel {
  @override
  build() {
    return;
  }

  String login(LoginRef ref) {
    return 'Login with Biometric';
  }
}
