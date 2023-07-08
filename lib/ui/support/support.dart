import 'package:fish_shop/common/validator.dart';
import 'package:fish_shop/res/colors.dart';
import 'package:fish_shop/ui/common_widget/FishTextField.dart';
import 'package:fish_shop/ui/common_widget/fish_button.dart';
import 'package:fish_shop/ui/support/bloc/support_bloc.dart';
import 'package:fish_shop/ui/support/bloc/support_event.dart';
import 'package:fish_shop/ui/support/bloc/support_state.dart';
import 'package:fish_shop/ui/utils/uihelper.dart';
import 'package:fish_shop/ui/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Support extends StatefulWidget {
  const Support({super.key});

  @override
  State<Support> createState() => _SupportState();
}

class _SupportState extends State<Support> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocListener<SupportBloc, SupportState>(
      listener: (context, state) {},
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            'Support',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w900,
                fontSize: 20.sp),
          ),
        ),
        body: Container(
          alignment: Alignment.topLeft,
          child: Column(
            children: [
              UiHelper.verticalSpacing(20),
              _buildUpperText(),
              UiHelper.verticalSpacing(17.h),
              Center(
                child: SizedBox(
                  width: 300.w,
                  child: ElevatedButton(
                      onPressed: () {
                        if (controller.text.isEmpty) {
                          displayToastMessage('Field cannot be empty',
                              backgroundColor: AppColors.textColor);
                          return;
                        }

                        BlocProvider.of<SupportBloc>(context)
                            .add(CreateIssue(issue: controller.text));
                        controller.clear();
                      },
                      child: const Text('Submit')),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _buildUpperText() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UiHelper.verticalSpacing(20.h),
          const Text(
            'What type of issue are you facing?',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 12,
            ),
          ),
          UiHelper.verticalSpacing(16),
          Row(
            children: [
              _buildCards('App Crash'),
              UiHelper.horizontalSpacing(15.w),
              _buildCards('Data Not Visible'),
              UiHelper.horizontalSpacing(15.w),
              _buildCards('App Slow')
            ],
          ),
          UiHelper.verticalSpacing(16.h),
          Row(
            children: [
              _buildCards('App Flow Issue'),
              UiHelper.horizontalSpacing(15.w),
              _buildCards('Others'),
            ],
          ),
          UiHelper.verticalSpacing(25),
          const Text(
            'Anything Else?',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w700, fontSize: 12),
          ),
          UiHelper.verticalSpacing(10.h),
          Container(
            child: FishTextField(
              textEditingController: controller,
              contentPadding: EdgeInsets.all(23.r),
              label: "Tell us everything",
              height: 94.h,
              width: 327.w,
            ),
          ),
        ],
      ),
    );
  }

  InkWell _buildCards(String label) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18.r),
            color: Colors.lightBlue[50]),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            label,
            style: const TextStyle(color: Colors.blue),
          ),
        ),
      ),
    );
  }

  _buildButtons(String title) {
    return Container(
      width: 120,
      height: 40,
      decoration: BoxDecoration(
          color: AppColors.textColor,
          border: Border.all(color: AppColors.textColor),
          borderRadius: const BorderRadius.all(Radius.circular(20))),
      child: TextButton(
          onPressed: () {},
          child: Text(
            title,
            style: GoogleFonts.inter(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 10,
            ),
          )),
    );
  }
}
