import 'package:simple_bank/utils/import.dart';

class TextFormWidget extends StatelessWidget {
  const TextFormWidget({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.label,
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
    this.onEditingComplete,
    this.validator,
    this.obscureText,
    this.onSuffixIxonTap,
    this.contentPadding,
    this.minLines,
    this.maxLines,
    this.keyboardType,
    this.maxLength,
  });
  final TextEditingController controller;
  final FocusNode focusNode;
  final String label;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Function(String)? onChanged;
  final Function()? onEditingComplete;
  final String? Function(String?)? validator;
  final bool? obscureText;
  final VoidCallback? onSuffixIxonTap;
  final int? minLines;
  final int? maxLines;
  final EdgeInsetsGeometry? contentPadding;
  final TextInputType? keyboardType;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      minLines: minLines ?? 1,
      maxLines: maxLines ?? 1,
      maxLength: maxLength,
      controller: controller,
      focusNode: focusNode,
      onChanged: onChanged,
      cursorColor: kLightPrimaryColor,
      onEditingComplete: onEditingComplete,
      validator: validator,
      obscureText: obscureText != null ? obscureText! : false,
      style: Theme.of(context).inputDecorationTheme.labelStyle,
      decoration: InputDecoration(
        hintText: label,
        prefixIcon: prefixIcon == null
            ? null
            : Container(
                width: 50,
                margin: const EdgeInsets.only(right: 12),
                decoration: BoxDecoration(
                  color: kPLColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(kSquareBorderRadius),
                    bottomLeft: Radius.circular(kSquareBorderRadius),
                  ),
                ),
                child: Icon(
                  prefixIcon,
                  size: 20,
                  color: kWhiteColor,
                ),
              ),
        suffixIcon: suffixIcon == null
            ? null
            : GestureDetector(
                onTap: onSuffixIxonTap,
                child: Container(
                  color: Colors.transparent,
                  child: Icon(
                    suffixIcon,
                    size: 20,
                    color: Theme.of(context).textTheme.bodySmall?.color,
                  ),
                ),
              ),
        contentPadding: contentPadding ?? EdgeInsets.zero,
        border: CustomDecoration.kInputBorder,
        enabledBorder: CustomDecoration.kInputBorder,
        focusedBorder: CustomDecoration.kInputBorder,
        errorBorder: CustomDecoration.kErrorInputBorder,
        disabledBorder: CustomDecoration.kInputBorder,
        focusedErrorBorder: CustomDecoration.kInputBorder,
      ),
    );
  }
}
