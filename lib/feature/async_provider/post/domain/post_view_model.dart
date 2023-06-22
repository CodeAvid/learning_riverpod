import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/model/post.dart';

part 'post_view_model.g.dart';

@riverpod
class PostViewModel extends _$PostViewModel {
  @override
  FutureOr<List<Post>> build() async {
    return await _fetchPost();
  }

  Future<List<Post>> _fetchPost([int page = 1, int limit = 10]) async {
    final dio = Dio();
    const url = 'https://jsonplaceholder.typicode.com/posts';
    final response = await dio.get(
      url,
      queryParameters: {'_page': page, '_limit': limit},
    );
    if (response.statusCode == 200) {
      final List data = response.data;
      return List<Post>.from(data.map((e) => Post.fromJson(e)));
    }
    return [];
  }
}
