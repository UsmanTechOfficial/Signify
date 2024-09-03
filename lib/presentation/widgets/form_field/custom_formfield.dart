import 'package:flutter/material.dart';

import '../../../domain/consts/global_var.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String hint;
  final double borderRadius;
  final Color borderColor;
  final Color? focusBorderColor;
  final Color? errorBorderColor;
  final Color? disabledBorderColor; // New property
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final bool obscureText;
  final Widget? suffix;
  final bool readOnly;
  final bool enabled;
  final bool filled;
  final Color? fillColor;
  final TextAlign? textAlign;
  final TextInputAction? textInputAction;
  final IconData? prefix;
  final int? maxLines;
  final Function(String)? onChanged;
  final int? maxLength;
  final FocusNode? focusNode;
  final void Function()? onTap;
  final ValueChanged<String>? onFieldSubmitted;

  const CustomTextFormField({
    super.key,
    required this.hint,
    this.controller,
    required this.borderColor,
    required this.borderRadius,
    this.focusBorderColor,
    this.errorBorderColor,
    this.disabledBorderColor, // Initialize the new property
    this.keyboardType = TextInputType.text,
    this.validator,
    this.obscureText = false,
    this.suffix,
    this.readOnly = false,
    this.enabled = true,
    this.filled = false,
    this.fillColor,
    this.prefix,
    this.maxLines = 1,
    this.onChanged,
    this.maxLength,
    this.textAlign,
    this.textInputAction,
    this.focusNode,
    this.onTap,
    this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller ?? TextEditingController(),
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: prefix != null
            ? Icon(
                prefix,
                color: Colors.grey.withOpacity(0.75),
              )
            : null,
        suffixIcon: suffix,
        filled: filled,
        fillColor: fillColor,
        enabledBorder: _outlineInputBorder(borderRadius, borderColor),
        focusedBorder: _outlineInputBorder(
            borderRadius, focusBorderColor ?? appColorScheme(context).primary),
        errorBorder: _outlineInputBorder(
            borderRadius, errorBorderColor ?? appColorScheme(context).error),
        disabledBorder: _outlineInputBorder(borderRadius,
            disabledBorderColor ?? Colors.transparent), // Disabled border
      ),
      onFieldSubmitted: onFieldSubmitted,
      keyboardType: keyboardType,
      validator: validator,
      obscureText: obscureText,
      textAlign: textAlign ?? TextAlign.start,
      maxLines: maxLines,
      maxLength: maxLength,
      focusNode: focusNode,
      onChanged: onChanged,
      textInputAction: textInputAction,
      enabled: enabled,
      readOnly: readOnly,
      onTap: onTap,
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
    );
  }

  OutlineInputBorder _outlineInputBorder(
      double borderRadius, Color borderColor) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: BorderSide(color: borderColor),
    );
  }
}

// class CustomTextFormField extends StatelessWidget {
//   final TextEditingController? controller;
//   final String hint;
//   final double borderRadius;
//   final Color borderColor;
//   final Color? focusBorderColor;
//   final Color? errorBorderColor;
//   final TextInputType keyboardType;
//   final String? Function(String?)? validator;
//   final bool obscureText;
//   final Widget? suffix;
//   final bool readOnly;
//   final bool enabled;
//   final bool filled;
//   final Color? fillColor;
//   final TextAlign? textAlign;
//   final TextInputAction? textInputAction;
//   final IconData? prefix;
//   final int? maxLines;
//   final Function(String)? onChanged;
//   final int? maxLength;
//   final FocusNode? focusNode;
//   final void Function()? onTap;
//   final ValueChanged<String>? onFieldSubmitted;
//
//   const CustomTextFormField({
//     super.key,
//     required this.hint,
//     this.controller,
//     required this.borderColor,
//     required this.borderRadius,
//     this.focusBorderColor,
//     this.errorBorderColor,
//     this.keyboardType = TextInputType.text,
//     this.validator,
//     this.obscureText = false,
//     this.suffix,
//     this.readOnly = false,
//     this.enabled = true,
//     this.filled = false,
//     this.fillColor,
//     this.prefix,
//     this.maxLines = 1,
//     this.onChanged,
//     this.maxLength,
//     this.textAlign,
//     this.textInputAction,
//     this.focusNode,
//     this.onTap,
//     this.onFieldSubmitted,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       controller: controller ?? TextEditingController(),
//       decoration: InputDecoration(
//         hintText: hint,
//         prefixIcon: prefix != null
//             ? Icon(
//                 prefix,
//                 color: Colors.grey.withOpacity(0.75),
//               )
//             : null,
//         suffixIcon: suffix,
//         filled: filled,
//         fillColor: fillColor,
//         enabledBorder: _outlineInputBorder(borderRadius, borderColor),
//         focusedBorder: _outlineInputBorder(
//             borderRadius, focusBorderColor ?? appColorScheme(context).primary),
//         errorBorder: _outlineInputBorder(
//             borderRadius, errorBorderColor ?? appColorScheme(context).error),
//       ),
//       onFieldSubmitted: onFieldSubmitted,
//       keyboardType: keyboardType,
//       validator: validator,
//       obscureText: obscureText,
//       textAlign: textAlign ?? TextAlign.start,
//       maxLines: maxLines,
//       maxLength: maxLength,
//       focusNode: focusNode,
//       onChanged: onChanged,
//       textInputAction: textInputAction,
//       enabled: enabled,
//       readOnly: readOnly,
//       onTap: onTap,
//       onTapOutside: (event) => FocusScope.of(context).unfocus(),
//     );
//   }
//
//   OutlineInputBorder _outlineInputBorder(
//       double borderRadius, Color borderColor) {
//     return OutlineInputBorder(
//       borderRadius: BorderRadius.circular(borderRadius),
//       borderSide: BorderSide(color: borderColor),
//     );
//   }
// }
