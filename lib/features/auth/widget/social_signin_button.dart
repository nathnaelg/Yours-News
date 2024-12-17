import 'package:flutter/material.dart';
import 'package:yours_news/shared/constant/colors.dart';


// this class will be used to create a social login button
// this button will have an image and a text
// this button will be used to login with social media
// this button will be used in the login screen or we can also use in the signup screen like


class SocialLoginButton extends StatelessWidget {
  final String imagePath;
  final String text;
  final VoidCallback onPressed;

  const SocialLoginButton({
    super.key,
    required this.imagePath,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, 
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: AppColor.colorEDEDED), 
          padding:
              const EdgeInsets.symmetric(vertical: 12.0), 
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0), 
          ),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 24.0), 
                child: Image.asset(
                  imagePath,
                  height: 24.0, 
                ),
              ),
            ),
            Center(
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
