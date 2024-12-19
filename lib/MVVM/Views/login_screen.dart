import 'package:flutter/material.dart';
import 'package:weather_app_zagsystem/MVVM/Views/widgets/custom_button.dart';
import 'package:weather_app_zagsystem/MVVM/Views/widgets/custom_text_field.dart';

import '../../theming/styles.dart';

class LoginScreen extends StatelessWidget {
  final formkey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: formkey,
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10, left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 70,
                ),
                Text(
                  "Welcome back",
                  style: TextStyles.title,
                ),
                Container(
                  width: double.infinity,
                  height: 225,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/image/logo_3.png'))),
                ),
                SizedBox(
                  height: 40,
                ),
                CustomTextField(
                    controller: emailController,
                    text: "Enter Your Email",
                    validation: (value) {
                      if (value == null || value.isEmpty) {
                        return "Email is required";
                      }
                      return null;
                    }),
                SizedBox(
                  height: 20,
                ),
                CustomTextField(
                    controller: passwordController,
                    text: "Enter Your Password",
                    password: true,
                    validation: (value) {
                      if (value == null || value.isEmpty) {
                        return "Email is password required";
                      } else if (value.length < 8) {
                        return "Password should be at least 8 characters long";
                      }
                      return null;
                    }),
                SizedBox(
                  height: 55,
                ),
                CustomButton(
                  text: 'Login',
                  onPressed: () {
                    if (formkey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('login Successful')));
                      Navigator.pushNamed(context, '/homeScreen');
                    }
                  },
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyles.subtitle,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/SignUpScreen');
                        },
                        child: Text('Sign Up',
                            style: TextStyles.subtitle
                                .copyWith(color: Colors.blue)))
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
