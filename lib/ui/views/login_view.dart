import 'package:flutter/material.dart';
import 'package:flutter_provider_architecture/core/viewmodels/login_model.dart';
import 'package:flutter_provider_architecture/locator.dart';
import 'package:flutter_provider_architecture/ui/shared/app_colors.dart';
import 'package:flutter_provider_architecture/ui/widgets/login_header.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginModel>(
      builder: (context) => locator<LoginModel>(),
      child: Consumer<LoginModel>(
        builder: (context, model, child) => Scaffold(
          backgroundColor: backgroundColor,
          body: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              LoginHeader(
                controller: controller,
              ),
              model.state == ViewState.Busy
                  ? CircularProgressIndicator()
                  : FlatButton(
                      color: Colors.white,
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () async {
                        var loginSuccess = await model.login(controller.text);
                        if (loginSuccess) {
                          Navigator.pushNamed(context, '/');
                        }
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
