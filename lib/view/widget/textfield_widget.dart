import 'package:simple_bank/utils/decoration.dart';
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

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      minLines: minLines,
      maxLines: maxLines,
      controller: controller,
      focusNode: focusNode,
      onChanged: onChanged,
      cursorColor: kLightPrimaryColor,
      onEditingComplete: onEditingComplete,
      validator: validator,
      obscureText: obscureText != null ? obscureText! : false,
      decoration: InputDecoration(
        hintText: label,
        prefixIcon: prefixIcon == null
            ? null
            : Container(
                margin: const EdgeInsets.only(right: 3),
                decoration: const BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(3),
                    bottomLeft: Radius.circular(3),
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
