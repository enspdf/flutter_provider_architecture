import 'package:flutter_provider_architecture/core/services/api.dart';
import 'package:flutter_provider_architecture/core/services/authentication_service.dart';
import 'package:flutter_provider_architecture/core/services/posts_service.dart';
import 'package:flutter_provider_architecture/core/viewmodels/comments_model.dart';
import 'package:flutter_provider_architecture/core/viewmodels/home_model.dart';
import 'package:flutter_provider_architecture/core/viewmodels/like_button_model.dart';
import 'package:flutter_provider_architecture/core/viewmodels/login_model.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt();

void setupLocator() {
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => Api());
  locator.registerLazySingleton(() => PostService());

  locator.registerLazySingleton(() => LoginModel());
  locator.registerFactory(() => HomeModel());
  locator.registerFactory(() => CommentsModel());
  locator.registerFactory(() => LikeButtonModel());
}
