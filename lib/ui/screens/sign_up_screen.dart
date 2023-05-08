import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login/ui/screens/Login_screen.dart';
import 'package:login/ui/widgets/text_field_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController? emailController = TextEditingController();
  late TextEditingController? passwordController = TextEditingController();
  late TextEditingController? confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
          title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text('Sign-Up Screen')],
      )),
      body: Container(
        padding: EdgeInsets.symmetric(
            vertical: height * 0.05, horizontal: width * 0.04),
        child: Form(
          key: _formKey,
          child: Column(children: [
            TextFieldWidget(
              formKey: _formKey,
                controller: emailController,
                width: width,
                height: height * 0.06,
                label: 'email'),
            SizedBox(height: height * 0.02),
            TextFieldWidget(
                formKey: _formKey,
                controller: passwordController,
                isPassword: true,
                width: width,
                height: height * 0.06,
                label: 'password'),
            SizedBox(height: height * 0.02),
            TextFieldWidget(
                formKey: _formKey,
                passController: passwordController,
                controller: confirmPasswordController,
                isPassword: true,
                isConfirmPassword: true,
                width: width,
                height: height * 0.06,
                label: 'confirm password'),
            SizedBox(
              height: height * 0.02,
            ),
            MaterialButton(
              color: Colors.blue,
              height: height * 0.06,
              minWidth: width * 0.50,
              onPressed: () {
                _formKey.currentState!.validate();
              },
              child: Text(
                'Sign-Up',
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Align(
                alignment: Alignment.centerRight,
                child: Row(
                  children: [
                    SizedBox(width: width * 0.35),
                    Text(
                      "already have account?",
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(a: 0),
                            ));
                      },
                      child: Text(
                        "Log-In",
                        style: TextStyle(color: Colors.blue, fontSize: 18),
                      ),
                    ),
                  ],
                ))
          ]),
        ),
      ),
    );
  }
}
