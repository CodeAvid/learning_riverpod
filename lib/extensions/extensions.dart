import 'dart:developer' as devtools show log;

extension AppLogger on Object? {
  /// An extension that logs the [toString] method of an Object.
  void log() => devtools.log(toString());
}
