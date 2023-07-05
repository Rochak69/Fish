import 'package:fish_shop/res/colors.dart';
import 'package:fish_shop/ui/common_widget/FishTextField.dart';
import 'package:fish_shop/ui/login/login.dart';

import 'package:fish_shop/ui/register/bloc/register_bloc.dart';
import 'package:fish_shop/ui/register/bloc/register_event.dart';
import 'package:fish_shop/ui/register/bloc/register_state.dart';
import 'package:fish_shop/ui/utils/uihelper.dart';
import 'package:fish_shop/ui/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegistrationPage extends StatefulWidget {
  // final VoidCallback onClickedSignUp;
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  bool _isAgreed = true;
  var val;
  final formkey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _number = TextEditingController();
  final _password = TextEditingController();
  final _confirmPassword = TextEditingController();
  @override
  void dispose() {
    _name.dispose();
    _password.dispose();
    _number.dispose();
    super.dispose();
  }

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          Navigator.pop(context);
          displayToastMessage('Succesfully Registerd');
          Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) {
              return const LoginPage();
            },
          ));
        } else if (state is RegisterFailed) {
          Navigator.pop(context);
          displayToastMessage(state.errorMessage);
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                UiHelper.verticalSpacing(36.h),
                _buildUpperText(),
                Container(
                  padding: EdgeInsets.only(right: 293.w),
                  child: Text(
                    'Name',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 12.sp),
                  ),
                ),
                UiHelper.verticalSpacing(5.h),
                FishTextField(
                  textEditingController: _name,
                  label: 'Name',
                  contentPadding: EdgeInsets.only(left: 15.w),
                ),
                UiHelper.verticalSpacing(10.h),
                Container(
                  padding: EdgeInsets.only(right: 245.w),
                  child: Text(
                    'Phone Number',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 12.sp),
                  ),
                ),
                UiHelper.verticalSpacing(5.h),
                FishTextField(
                  textInputType: TextInputType.number,
                  textEditingController: _number,
                  label: 'Phone Number',
                  contentPadding: EdgeInsets.only(left: 15.w),
                ),
                UiHelper.verticalSpacing(5.h),
                Container(
                  padding: EdgeInsets.only(right: 272.w),
                  child: Text(
                    'Password',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 12.sp),
                  ),
                ),
                UiHelper.verticalSpacing(10.h),
                FishTextField(
                  onSuffixIconTap: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  sufixIcon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color: _obscureText ? Colors.grey : Colors.grey,
                  ),
                  obscureText: _obscureText,
                  textEditingController: _password,
                  label: 'Create a password',
                  contentPadding: EdgeInsets.only(left: 15.w),
                ),
                UiHelper.verticalSpacing(5.h),
                FishTextField(
                  obscureText: _obscureText,
                  sufixIcon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color: _obscureText ? Colors.grey : Colors.grey,
                  ),
                  textEditingController: _confirmPassword,
                  label: 'Confirm password',
                  contentPadding: EdgeInsets.only(left: 15.w),
                ),
                UiHelper.verticalSpacing(30.h),
                Container(
                    padding: EdgeInsets.only(left: 20.w),
                    child: _buildTermsofService()),
                UiHelper.verticalSpacing(30.h),
                SizedBox(
                  width: 340.w,
                  height: 48.h,
                  child: ElevatedButton(
                    onPressed: () {
                      showLoaderDialog(context);
                      BlocProvider.of<RegisterBloc>(context).add(
                          RegisterEventWithPhone(
                              password: _password.text,
                              userName: _name.text,
                              phoneNumber: _number.text));
                    },

                    //  signIn,
                    child: Text(
                      'Register',
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

  Row _buildTermsofService() {
    return Row(
      children: [
        Transform.scale(
          scale: 1.5.r,
          child: Radio(
              toggleable: true,
              value: true,
              groupValue: val,
              onChanged: (value) {
                setState(() {
                  val = value;
                  _isAgreed = !_isAgreed;
                });
              },
              activeColor: Colors.green),
        ),
        Expanded(
          child: RichText(
              text: const TextSpan(children: <TextSpan>[
            TextSpan(
                text: 'I\'ve read and agree with the ',
                style: TextStyle(color: Colors.black)),
            TextSpan(
                text: 'Terms and Conditions',
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.w600)),
            TextSpan(text: ' and the ', style: TextStyle(color: Colors.black)),
            TextSpan(
                text: 'Privacy Policy',
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.w600))
          ])),
        )
      ],
    );
  }

  _buildUpperText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            // left: 24.0,
            right: 270,
          ),
          child: Text(
            'Sign Up',
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
            'Create an account to get started',
            style: TextStyle(
              color: AppColors.secondaryTextColor,
              fontWeight: FontWeight.w400,
              fontSize: 12.sp,
            ),
          ),
        ),
        UiHelper.verticalSpacing(24),
      ],
    );
  }
}
