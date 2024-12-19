import 'package:flutter/material.dart';
import 'package:weather_app_zagsystem/MVVM/Views/widgets/custom_button.dart';
import 'package:weather_app_zagsystem/MVVM/Views/widgets/custom_text_field.dart';

import '../../theming/styles.dart';

class SignUpScreen extends StatelessWidget {
  final formkey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  SignUpScreen({super.key});

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
                  "Welcome to Breeze",
                  style: TextStyles.title,
                ),
                Text("Stay updated with accurate forecasts",
                    style: TextStyle(color: Color(0xFF9399A2), fontSize: 14)),
                Text(" anytime,anywhere.",
                    style: TextStyle(color: Color(0xFF9399A2), fontSize: 14)),
                SizedBox(
                  height: 75,
                ),
                CustomTextField(
                    controller: emailController,
                    text: "Full Name",
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
                  height: 20,
                ),
                CustomTextField(
                    controller: passwordController,
                    text: "Confirm Your Password",
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
                  height: 60,
                ),
                CustomButton(
                  text: 'Register',
                  onPressed: () {
                    if (formkey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Sign Up Successful')));
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
                      "Already have an account?",
                      style: TextStyles.subtitle,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Sign In',
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
