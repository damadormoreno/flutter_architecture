import 'package:flutter/material.dart';
import 'package:flutter_architecture/app/modules/login/local_widgets/text_field_login.dart';
import 'package:flutter_architecture/app/modules/login/login_controller.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (_) => Scaffold(
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            color: Colors.grey[200],
            width: double.infinity,
            height: double.infinity,
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/logo.jpeg',
                  height: 100,
                  width: 100,
                ),
                SizedBox(
                  height: 8,
                ),
                TextFieldLogin(
                  labelText: "User name",
                  tIType: TextInputType.emailAddress,
                  function: _.onUserNameChanged,
                  obscure: false,
                ),
                SizedBox(
                  height: 8,
                ),
                TextFieldLogin(
                  labelText: "Password",
                  tIType: TextInputType.visiblePassword,
                  function: _.onPasswordChanged,
                  obscure: true,
                ),
                SizedBox(
                  height: 8,
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(color: Colors.blue[900]),
                    ),
                    backgroundColor: Colors.black,
                    minimumSize: Size(150, 0),
                  ),
                  onPressed: _.submit,
                  child: Text(
                    "Send",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(color: Colors.blue[900]),
                    ),
                    backgroundColor: Colors.black,
                    minimumSize: Size(150, 0),
                  ),
                  onPressed: _.guestSession,
                  child: Text(
                    "Guest",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
