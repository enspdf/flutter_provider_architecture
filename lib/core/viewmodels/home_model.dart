import 'package:flutter_provider_architecture/core/enums/viewstate.dart';
import 'package:flutter_provider_architecture/core/models/post.dart';
import 'package:flutter_provider_architecture/core/services/posts_service.dart';
import 'package:flutter_provider_architecture/core/viewmodels/base_model.dart';
import 'package:flutter_provider_architecture/locator.dart';

class HomeModel extends BaseModel {
  PostService _postService = locator<PostService>();

  List<Post> get posts => _postService.posts;

  Future getPosts(int userId) async {
    setState(ViewState.Busy);
    await _postService.getPostsForUser(userId);
    setState(ViewState.Idle);
  }
}
