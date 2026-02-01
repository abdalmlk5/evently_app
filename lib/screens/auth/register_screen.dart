import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/core/app_assets.dart';
import 'package:evently_app/core/app_colors.dart';
import 'package:evently_app/core/app_styles.dart';
import 'package:flutter/material.dart';

import '../../core/firebase/firebase_functions.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = "register screen";

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isLocked = true;
  bool isConfirmLocked = true;
  TextEditingController nameController = .new();
  TextEditingController emailController = .new();
  TextEditingController passwordController = .new();
  var formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String currentLanguage = context.locale.languageCode;
    return Scaffold(
      appBar: AppBar(title: Text("register_title".tr()), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const SizedBox(height: 24),
                Image.asset(AppAssets.topLogo, height: 120),
                const SizedBox(height: 24),
                Align(
                  alignment: currentLanguage == 'en'
                      ? Alignment.centerLeft
                      : Alignment.centerRight,
                  child: Text(
                    "register_title".tr(),
                    style: AppStyles.main20600,
                  ),
                ),
                const SizedBox(height: 24),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  textInputAction: TextInputAction.next,
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: "name".tr(),
                    prefixIcon: const ImageIcon(AssetImage(AppAssets.userIcon)),
                  ),
                ),
                const SizedBox(height: 16),
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
                  textInputAction: TextInputAction.next,
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: "email".tr(),
                    prefixIcon: const ImageIcon(
                      AssetImage(AppAssets.emailIcon),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your password';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                  textInputAction: TextInputAction.next,
                  controller: passwordController,
                  obscureText: isLocked,
                  decoration: InputDecoration(
                    hintText: "password".tr(),
                    prefixIcon: const ImageIcon(
                      AssetImage(AppAssets.passwordIcon),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () => setState(() => isLocked = !isLocked),
                      icon: isLocked
                          ? Image.asset(AppAssets.eyeLockIcon)
                          : Image.asset(AppAssets.eyeIcon),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please Confirm your password';
                    }
                    if (value != passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                  textInputAction: TextInputAction.next,
                  obscureText: isConfirmLocked,
                  decoration: InputDecoration(
                    hintText: "confirm_password".tr(),
                    prefixIcon: const ImageIcon(
                      AssetImage(AppAssets.passwordIcon),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () =>
                          setState(() => isConfirmLocked = !isConfirmLocked),
                      icon: isConfirmLocked
                          ? Image.asset(AppAssets.eyeLockIcon)
                          : Image.asset(AppAssets.eyeIcon),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    if (!formKey.currentState!.validate()) {
                      return;
                    }
                    FirebaseFunctions.createUserByEmailAndPassword(
                      emailAddress: emailController.text,
                      password: passwordController.text,
                      name: nameController.text,
                      onSuccess: () {
                        Navigator.pop(context);
                      },

                      onError: (errorMessage) {
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text(errorMessage)));
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: Text("signup".tr()),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "already_have_account".tr(),
                      style: AppStyles.main16400,
                    ),
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Text(
                        " ${"login".tr()}",
                        style: AppStyles.main16400.copyWith(
                          color: AppColors.mainColor,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: Divider(color: AppColors.mainColor, thickness: 1),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text("or".tr(), style: AppStyles.main18500),
                    ),
                    Expanded(
                      child: Divider(color: AppColors.mainColor, thickness: 1),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    side: BorderSide(color: AppColors.mainColor),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(AppAssets.googleIcon, height: 24),
                      const SizedBox(width: 10),
                      Text(
                        "signup_google".tr(),
                        style: AppStyles.main18500.copyWith(
                          color: AppColors.mainColor,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
