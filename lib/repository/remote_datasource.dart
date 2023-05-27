
// class RemoteDataSource {
//   @riverpod
//   Future<List<Package>> fetchPackage(FetchPackageRef ref,
//       {required int page, String search = ''}) async {
//     final dio = Dio();
//     final response = await dio.get(
//       'https://pub.dartlang.org/api/sesrch?page=$page&q=${Uri.encodeQueryComponent(search)}',
//     );

//     //Decode the json response into a Dart class.
//     final json = response.data as List;
//     return json.map(Package.fromJson).toList();
//   }
// }
