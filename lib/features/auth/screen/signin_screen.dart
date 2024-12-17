// ignore_for_file: use_build_context_synchronously

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:yours_news/shared/widget/custom_navbar.dart';
import '../provider/auth_provider.dart';
import '../../../shared/constant/colors.dart';
import '../../../shared/constant/validotrs.dart';
import '../../../shared/widget/custom_appbar.dart';
import '../../../shared/widget/custom_button.dart';
import '../../../shared/widget/custom_textbox.dart';
import '../widget/or_divider.dart';
import '../widget/social_signin_button.dart';

final loginFormKey = GlobalKey<FormState>();

class SignIn extends HookConsumerWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final passwordController = useTextEditingController();
    final emailController = useTextEditingController();

    final authState = ref.watch(authProvider);
    final authNotifier = ref.read(authProvider.notifier);

    void onSignInPressed() async {
      if (loginFormKey.currentState!.validate()) {
        await authNotifier.login(
          emailController.text,
          passwordController.text,
        );

        if (authState.isAuthenticated) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const BottomNavigation(),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Login failed')),
          );
        }
      }
    }

    return Scaffold(
      appBar: const CustomAppBar(
        title: "Sign In",
      ),
      backgroundColor: AppColor.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Stay informed effortlessly. Sign in and explore a world \nof news",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 30),
                Form(
                  key: loginFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppTextField(
                        textEditingController: emailController,
                        hint: "Email",
                        inputType: TextInputType.emailAddress,
                        prefix: IconsaxPlusLinear.sms,
                        validator: (val) => AppValidator.required(val, "email"),
                      ),
                      const SizedBox(height: 16.0),
                      AppTextField(
                        textEditingController: passwordController,
                        hint: "Password",
                        inputType: TextInputType.visiblePassword,
                        prefix: IconsaxPlusLinear.lock,
                        validator: (val) =>
                            AppValidator.required(val, "password"),
                      ),
                      const SizedBox(height: 16.0),
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {},
                          child: const Text(
                            "Forgot Password?",
                            style: TextStyle(
                              color: AppColor.textColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24.0),
                      CustomButton(
                        text: "Sign in",
                        isLoading: authState.isLoading,
                        onPressed: onSignInPressed,
                      ),
                      const SizedBox(height: 24.0),
                      const ORDivider(),
                      const SizedBox(height: 24.0),
                      SocialLoginButton(
                        imagePath: 'assets/png/google.png',
                        text: 'Sign in with Google',
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const BottomNavigation(),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 16.0),
                      SocialLoginButton(
                        imagePath: 'assets/png/logos_facebook.png',
                        text: 'Sign in with Facebook',
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 44.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: RichText(
                text: TextSpan(
                  style: const TextStyle(
                    color: AppColor.textColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 16.0,
                  ),
                  children: [
                    const TextSpan(text: "Don't have an account? "),
                    TextSpan(
                      text: "Sign Up",
                      style: const TextStyle(
                        color: Color.fromARGB(255, 16, 16, 16),
                        fontWeight: FontWeight.w600,
                      ),
                      recognizer: TapGestureRecognizer()..onTap = () {},
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
