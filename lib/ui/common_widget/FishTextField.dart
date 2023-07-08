import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:buyer_shop/res/colors.dart';

class FishTextField extends StatelessWidget {
  final String label;
  final Widget? sufixIcon;
  final Widget? prefixIcon;
  final TextEditingController? textEditingController;
  final TextInputType textInputType;
  final bool obscureText;
  final bool isReadOnly;
  final Function? btnUpdateStatus;
  final InputDecoration? decoration;
  final int? maxLength;
  final Function(String)? onChanged;
  final double height;
  String? Function(String?)? validator;
  final double width;
  final EdgeInsetsGeometry? contentPadding;
  final String? prefixText;
  final void Function()? onSuffixIconTap;
  final void Function()? onTap;

  FishTextField(
      {Key? key,
      required this.label,
      this.decoration,
      this.maxLength,
      this.btnUpdateStatus,
      this.validator,
      this.obscureText = false,
      this.sufixIcon,
      this.prefixIcon,
      this.prefixText,
      this.textEditingController,
      this.textInputType = TextInputType.text,
      this.isReadOnly = false,
      this.onChanged,
      this.height = 48,
      this.width = 327,
      this.contentPadding = EdgeInsets.zero,
      this.onTap,
      this.onSuffixIconTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w,
      child: InkWell(
        onTap: onTap,
        child: TextFormField(
          validator: validator,
          onChanged: onChanged,
          textInputAction: TextInputAction.next,
          maxLength: maxLength,
          readOnly: isReadOnly,
          onTap: onTap,
          obscureText: obscureText,
          keyboardType: textInputType,
          controller: textEditingController,
          autovalidateMode: AutovalidateMode.onUserInteraction,

          //textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            prefixText: prefixText,
            contentPadding: EdgeInsets.symmetric(horizontal: 6.w),
            counterText: '',
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(width: 1, color: Colors.grey),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(width: 2, color: Colors.red),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  const BorderSide(width: 2, color: AppColors.textColor),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(width: 2, color: Colors.red),
            ),
            label: Text(label),
            border: InputBorder.none,
            labelStyle: TextStyle(
                color: Colors.grey,
                fontSize: 12.sp,
                fontWeight: FontWeight.w600),
            prefixIcon: prefixIcon != null
                ? Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 9.h),
                    child: prefixIcon!)
                : null,
            suffixIcon: InkWell(
              onTap: onSuffixIconTap,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 7.h),
                child: sufixIcon,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
