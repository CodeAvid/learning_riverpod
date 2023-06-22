// Similar to provider the only difference is it used to loading asynchronous request instead of synchronous

import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'fetch_configuration.g.dart';

@riverpod
Future<Map<String, Object?>> fetchConfiguration(
    FetchConfigurationRef ref) async {
  final content = json.decode(
    await rootBundle.loadString('assets/configurations.json'),
  ) as Map<String, Object?>;
  return content;
}
