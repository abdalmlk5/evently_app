import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/core/app_assets.dart';
import 'package:evently_app/core/app_colors.dart';
import 'package:evently_app/core/firebase/firebase_functions.dart';
import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatefulWidget {
  static const routeName = "forget password screen";

  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  TextEditingController emailController = .new();
  var formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("forget_password".tr()),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(color: AppColors.mainColor),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const SizedBox(height: 24),
                Image.asset(
                  AppAssets.forgetPasswordImage,
                  width: double.infinity,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 24),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!value.contains('@')) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: "email".tr(),
                    prefixIcon: const ImageIcon(
                      AssetImage(AppAssets.emailIcon),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    if (!formKey.currentState!.validate()) {
                      return;
                    }
                    FirebaseFunctions.resetPassword(
                      emailAddress: emailController.text,
                      onSuccess: () {
                        Navigator.pop(context);
                      },
                      onError: (errorMessage) {
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text(errorMessage)));
                      },
                    );
                    Navigator.pop(context);
                  },

                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 60),
                    maximumSize: const Size(double.infinity, 60),
                  ),
                  child: Text("reset_password".tr()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
