import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:yours_news/shared/constant/colors.dart';

class AppTextField extends HookWidget {
  const AppTextField({
    super.key,
    required this.hint,
    this.error,
    this.inputType,
    this.disabled = false,
    this.prefix,
    this.textEditingController,
    this.validator,
    this.onTap,
    this.prefixIconColor,
    this.isLabel = true,
    this.noBorder = false,
    this.onEditingComplete,
    this.onChange,
    this.initialValue,
    this.maxLines = 1,
    this.minLines,
    this.backgroundColor = Colors.white,
  });

  final String hint;
  final String? error;
  final TextInputType? inputType;
  final Color? prefixIconColor;
  final bool disabled;
  final dynamic prefix;
  final TextEditingController? textEditingController;
  final String? Function(String?)? validator;
  final VoidCallback? onEditingComplete;
  final bool isLabel;
  final bool noBorder;
  final Function(String)? onChange;
  final String? initialValue;
  final int? maxLines;
  final int? minLines;
  final Color backgroundColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final passwordVisible = useValueNotifier<bool>(false);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColor.textBoxColor,
          borderRadius:
              BorderRadius.circular(8.0), // Adjust the border radius if needed
        ),
        child: TextFormField(
          initialValue: initialValue,
          controller: textEditingController,
          keyboardType: inputType,
          onChanged: onChange,
          obscureText: inputType == TextInputType.visiblePassword &&
              !passwordVisible.value,
          validator: validator,
          onEditingComplete: onEditingComplete,
          style: const TextStyle(
            color: AppColor.textColor,
            fontSize: 15.0,
            fontWeight: FontWeight.w700,
          ),
          maxLines: maxLines,
          minLines: minLines,
          decoration: InputDecoration(
            enabled: !disabled,
            contentPadding: const EdgeInsets.symmetric(
                horizontal: 12.0, vertical: 12.0), // Adjust padding if needed
            label: isLabel
                ? Text(
                    hint,
                    style: const TextStyle(
                      color: AppColor.textColor,
                    ),
                  )
                : null,
            hintText: !isLabel ? hint : null,
            border: InputBorder
                .none, // No border here, as we are using Container for background
            errorText: error,
            prefixIcon: getPrefix,
            suffixIcon: inputType == TextInputType.visiblePassword
                ? GestureDetector(
                    onTap: () {
                      passwordVisible.value = !passwordVisible.value;
                    },
                    child: Icon(
                      passwordVisible.value
                          ? IconsaxPlusLinear.eye_slash
                          : IconsaxPlusLinear.eye,
                      color: AppColor.contentColor,
                    ),
                  )
                : null,
          ),
        ),
      ),
    );
  }

  Widget? get getPrefix {
    if (prefix is IconData) {
      return Icon(
        prefix,
        color: prefixIconColor ?? AppColor.contentColor,
      );
    }

    if (prefix is Widget) {
      return prefix;
    }

    return null;
  }
}
