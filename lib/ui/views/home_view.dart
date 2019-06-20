import 'package:flutter/material.dart';
import 'package:flutter_provider_architecture/core/enums/viewstate.dart';
import 'package:flutter_provider_architecture/core/models/post.dart';
import 'package:flutter_provider_architecture/core/models/user.dart';
import 'package:flutter_provider_architecture/core/viewmodels/home_model.dart';
import 'package:flutter_provider_architecture/ui/shared/app_colors.dart';
import 'package:flutter_provider_architecture/ui/shared/text_styles.dart';
import 'package:flutter_provider_architecture/ui/shared/ui_helpers.dart';
import 'package:flutter_provider_architecture/ui/views/base_view.dart';
import 'package:flutter_provider_architecture/ui/widgets/postlist_item.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeModel>(
      onModelReady: (model) {
        model.getPosts(Provider.of<User>(context).id);
      },
      builder: (context, model, child) => Scaffold(
        backgroundColor: backgroundColor,
        body: model.state == ViewState.Idle
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  UIHelper.verticalSpaceLarge(),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text('Welcome ${Provider.of<User>(context).name}',
                        style: headerStyle),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child:
                        Text('Here are all your posts', style: subHeaderStyle),
                  ),
                  UIHelper.verticalSpaceSmall(),
                  Expanded(
                    child: getPostsUi(model.posts),
                  ),
                ],
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }

  Widget getPostsUi(List<Post> posts) => ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) => PostListItem(
          post: posts[index],
          onTap: () {
            Navigator.pushNamed(context, 'post', arguments: posts[index]);
          },
        ),
      );
}
