import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class FishButton extends StatelessWidget {
  final String text;
  final Function? onPressed;
  final double height;
  final double width;
  final double radius;
  final Color bgColor;
  final Color textColor;
  final double fontSize;
  final FontWeight? fontWeight;
  final Color border;

  const FishButton.white(this.text,
      {Key? key,
      this.onPressed,
      this.bgColor = Colors.white,
      this.textColor = Colors.grey,
      this.height = 48,
      this.radius = 5,
      this.width = 328,
      this.fontSize = 16,
      this.fontWeight = FontWeight.w400,
      this.border = Colors.green})
      : super(key: key);
  const FishButton.green(
    this.text, {
    Key? key,
    this.onPressed,
    this.bgColor = Colors.green,
    this.textColor = Colors.white,
    this.height = 48,
    this.radius = 5,
    this.width = 328,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w600,
    this.border = Colors.green,
  }) : super(key: key);
  const FishButton.grey(
    this.text, {
    Key? key,
    this.onPressed,
    this.bgColor = Colors.grey,
    this.textColor = Colors.white,
    this.height = 48,
    this.radius = 5,
    this.width = 328,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w600,
    this.border = Colors.grey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w,
      height: height.h,
      child: ElevatedButton(
        onPressed: () => onPressed!(),
        style: ElevatedButton.styleFrom(
            elevation: 0,
            side: BorderSide(
              width: 0.5,
              color: border,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius.r),
            ),
            backgroundColor: bgColor),
        child: Wrap(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 8, right: 12, top: 2),
              child: Text(
                text,
                style: GoogleFonts.poppins(
                  fontSize: fontSize.sp,
                  fontWeight: fontWeight,
                  color: textColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
