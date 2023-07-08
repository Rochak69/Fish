import 'package:buyer_shop/common/validator.dart';
import 'package:buyer_shop/res/colors.dart';
import 'package:buyer_shop/ui/common_widget/FishTextField.dart';
import 'package:buyer_shop/ui/reset_password/bloc/reset_password_bloc.dart';
import 'package:buyer_shop/ui/reset_password/bloc/reset_password_event.dart';
import 'package:buyer_shop/ui/reset_password/bloc/reset_password_state.dart';
import 'package:buyer_shop/ui/utils/preferences.dart';
import 'package:buyer_shop/ui/utils/uihelper.dart';
import 'package:buyer_shop/ui/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final TextEditingController _oldPassword = TextEditingController();
  final TextEditingController _createPassword = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();

  @override
  void dispose() {
    _oldPassword.dispose();
    _createPassword.dispose();
    _confirmPassword.dispose();
    super.dispose();
  }

  bool _obscureText = true;
  final bool _obscureOldText = true;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ResetPasswordBloc, ResetPasswordState>(
      listener: (context, state) {
        Navigator.pop(context);
        if (state is ResetPasswordSuccess) {
          displayToastMessage('Reset Password successful');
        } else if (state is ResetPasswordFailed) {
          displayToastMessage(state.errorMessage,
              backgroundColor: AppColors.textRedColor);
        }
      },
      child: SafeArea(
        child: Scaffold(
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UiHelper.verticalSpacing(36.h),
                _buildUpperText(),
                // Text(
                //   'Change Password',
                //   style: TextStyle(
                //       color: Colors.black,
                //       fontWeight: FontWeight.w700,
                //       fontSize: 12.sp),
                // ),
                // UiHelper.verticalSpacing(5.h),
                // FishTextField(
                //   obscureText: _obscureOldText,
                //   sufixIcon: Icon(
                //     _obscureOldText ? Icons.visibility_off : Icons.visibility,
                //     color: _obscureOldText ? Colors.grey : Colors.grey,
                //   ),
                //   onSuffixIconTap: () {
                //     setState(() {
                //       _obscureOldText = !_obscureOldText;
                //     });
                //   },
                //   label: 'Old Password',
                //   contentPadding: EdgeInsets.only(left: 15.w),
                //   textEditingController: _oldPassword,
                // ),
                UiHelper.verticalSpacing(20.h),
                Text(
                  'New Password',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 12.sp),
                ),
                UiHelper.verticalSpacing(5.h),
                FishTextField(
                  validator: (value) => Validators.validateEmpty(value),
                  obscureText: _obscureText,
                  sufixIcon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color: _obscureText ? Colors.grey : Colors.grey,
                  ),
                  onSuffixIconTap: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  label: 'Create a Password',
                  textEditingController: _createPassword,
                  contentPadding: EdgeInsets.only(left: 15.w),
                ),
                UiHelper.verticalSpacing(5),
                FishTextField(
                  validator: (value) => Validators.validateEmpty(value),
                  obscureText: _obscureText,
                  sufixIcon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color: _obscureText ? Colors.grey : Colors.grey,
                  ),
                  onSuffixIconTap: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  textEditingController: _confirmPassword,
                  label: 'Confirm Password',
                  contentPadding: EdgeInsets.only(left: 15.w),
                ),
                UiHelper.verticalSpacing(20),
                Container(
                  width: 340.w,
                  height: 48.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: Colors.blue, // Set the desired background color
                  ),
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_createPassword.text != _confirmPassword.text) {
                        displayToastMessage('Your password does not app');
                        return;
                      }
                      Preferences preferences = Preferences();
                      String? userID =
                          await preferences.getString(Preference.userID);
                      if (userID == null) {
                        displayToastMessage('Uset id is null',
                            backgroundColor: AppColors.textRedColor);
                        return;
                      }
                      showLoaderDialog(context);
                      BlocProvider.of<ResetPasswordBloc>(context).add(
                          ResetPasswordEventWithPhone(
                              password: _confirmPassword.text, userId: userID));

                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => const UserDetails()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors
                          .transparent, // Set the button's background color to transparent
                      elevation: 0, // Remove the button's elevation
                    ),
                    child: Text(
                      'Change Password',
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
      ),
    );
  }

  _buildUpperText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            // left: 24.0,
            right: 150.w,
          ),
          child: Text(
            'Change Password',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w900,
                fontSize: 16.sp),
          ),
        ),
        UiHelper.verticalSpacing(16.h),
        Text(
          'Choose a new Password',
          style: TextStyle(
            color: AppColors.secondaryTextColor,
            fontWeight: FontWeight.w400,
            fontSize: 12.sp,
          ),
        ),
        UiHelper.verticalSpacing(24),
      ],
    );
  }
}
