import 'package:buyer_shop/common/validator.dart';
import 'package:buyer_shop/res/colors.dart';
import 'package:buyer_shop/ui/common_widget/FishTextField.dart';
import 'package:buyer_shop/ui/forgot_password/bloc/send_otp_bloc.dart';
import 'package:buyer_shop/ui/forgot_password/bloc/send_otp_event.dart';
import 'package:buyer_shop/ui/forgot_password/bloc/send_otp_state.dart';
import 'package:buyer_shop/ui/utils/uihelper.dart';
import 'package:buyer_shop/ui/utils/utils.dart';
import 'package:buyer_shop/ui/verify_otp/verify_otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Forgot extends StatefulWidget {
  const Forgot({super.key});

  @override
  State<Forgot> createState() => _ForgotState();
}

class _ForgotState extends State<Forgot> {
  final TextEditingController phoneController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SendOtpBloc, SendOtpState>(
      listener: (context, state) {
        Navigator.pop(context);
        if (state is SendOtpSuccess) {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return VerifyOtpScreen(
                otp: state.response?.code ?? '',
              );
            },
          ));
          displayToastMessage('OTP sent successfully');
        } else if (state is SendOtpFailed) {
          displayToastMessage(state.errorMessage,
              backgroundColor: AppColors.textRedColor);
        }
      },
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UiHelper.verticalSpacing(68),
              _buildUpperText(),
              Text(
                'Phone Number',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 12.sp),
              ),
              UiHelper.verticalSpacing(8.h),
              FishTextField(
                validator: (value) => Validators.validateEmpty(value),
                textEditingController: phoneController,
                label: '98xxxxxxxx',
                contentPadding: EdgeInsets.only(left: 15.w),
              ),
              UiHelper.verticalSpacing(20.h),
              Container(
                width: 340.w,
                height: 48.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.blue, // Set the desired background color
                ),
                child: ElevatedButton(
                  onPressed: () {
                    if (phoneController.text.isEmpty) {
                      displayToastMessage('Please enter a valid number');
                      return;
                    }
                    showLoaderDialog(context);
                    BlocProvider.of<SendOtpBloc>(context).add(
                        SendOtpEventWithPhone(
                            phoneNumber: phoneController.text));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors
                        .transparent, // Set the button's background color to transparent
                    elevation: 0, // Remove the button's elevation
                  ),
                  child: Text(
                    'Reset Password',
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildUpperText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            // left: 24.0,
            right: 200,
          ),
          child: Text(
            'Forget Password',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w900,
                fontSize: 16.sp),
          ),
        ),
        UiHelper.verticalSpacing(16.h),
        Padding(
          padding: const EdgeInsets.only(
              // left: 24.0,
              ),
          child: Text(
            'Reset Password',
            style: TextStyle(
              color: AppColors.secondaryTextColor,
              fontWeight: FontWeight.w400,
              fontSize: 12.sp,
            ),
          ),
        ),
        UiHelper.verticalSpacing(24.h),
      ],
    );
  }
}
