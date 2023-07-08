import 'package:buyer_shop/common/validator.dart';
import 'package:buyer_shop/res/colors.dart';
import 'package:buyer_shop/ui/common_widget/FishTextField.dart';
import 'package:buyer_shop/ui/login/login.dart';

import 'package:buyer_shop/ui/register/bloc/register_bloc.dart';
import 'package:buyer_shop/ui/register/bloc/register_event.dart';
import 'package:buyer_shop/ui/register/bloc/register_state.dart';
import 'package:buyer_shop/ui/utils/uihelper.dart';
import 'package:buyer_shop/ui/utils/utils.dart';
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
  bool _isAgreed = false;
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
        appBar: AppBar(
          automaticallyImplyLeading: true,
          leading: Padding(
            padding: EdgeInsets.only(left: 24.w),
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: AppColors.textColor,
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            'Sign Up',
            style: TextStyle(
                color: AppColors.textColor,
                fontWeight: FontWeight.w700,
                fontSize: 18.sp),
          ),
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UiHelper.verticalSpacing(15.h),
                  _buildUpperText(),
                  UiHelper.verticalSpacing(10.h),
                  Text(
                    'Name',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 12.sp),
                  ),
                  UiHelper.verticalSpacing(10.h),
                  FishTextField(
                    validator: (value) => Validators.validateEmpty(value),
                    textEditingController: _name,
                    label: 'Name',
                    contentPadding: EdgeInsets.only(left: 15.w),
                  ),
                  UiHelper.verticalSpacing(10.h),
                  Text(
                    'Phone Number',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 12.sp),
                  ),
                  UiHelper.verticalSpacing(10.h),
                  FishTextField(
                    validator: (value) => Validators.validateEmpty(value),
                    textInputType: TextInputType.number,
                    textEditingController: _number,
                    label: 'Phone Number',
                    contentPadding: EdgeInsets.only(left: 15.w),
                  ),
                  UiHelper.verticalSpacing(10.h),
                  Text(
                    'Password',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 12.sp),
                  ),
                  UiHelper.verticalSpacing(10.h),
                  FishTextField(
                    validator: (value) => Validators.validateEmpty(value),
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
                  UiHelper.verticalSpacing(10.h),
                  FishTextField(
                    validator: (value) => Validators.validateEmpty(value),
                    onSuffixIconTap: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                    obscureText: _obscureText,
                    sufixIcon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                      color: _obscureText ? Colors.grey : Colors.grey,
                    ),
                    textEditingController: _confirmPassword,
                    label: 'Confirm password',
                    contentPadding: EdgeInsets.only(left: 15.w),
                  ),
                  UiHelper.verticalSpacing(15.h),
                  _buildTermsofService(),
                  UiHelper.verticalSpacing(15.h),
                  SizedBox(
                    width: 340.w,
                    height: 48.h,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.r),
                      child: ElevatedButton(
                        onPressed: () {
                          if (!_isAgreed) {
                            displayToastMessage(
                                'You must agree to terms and condiions',
                                backgroundColor: AppColors.textRedColor);
                            return;
                          }
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
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _buildTermsofService() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Checkbox(
          value: _isAgreed,
          onChanged: (value) {
            _isAgreed = !_isAgreed;
            setState(() {});
          },
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
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        'Create an account to get started',
        style: TextStyle(
          color: AppColors.secondaryTextColor,
          fontWeight: FontWeight.w400,
          fontSize: 12.sp,
        ),
      ),
    );
  }
}
