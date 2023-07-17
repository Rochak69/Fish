import 'package:fish_shop/common/validator.dart';
import 'package:fish_shop/res/colors.dart';
import 'package:fish_shop/ui/common_widget/FishTextField.dart';
import 'package:fish_shop/ui/fisher_farm_details/fisher_farm_details.dart';
import 'package:fish_shop/ui/forgot_password/forgot_password.dart';
import 'package:fish_shop/ui/home_listing/bloc/home_listings_bloc.dart';
import 'package:fish_shop/ui/home_listing/home_listing.dart';
import 'package:fish_shop/ui/login/bloc/login_bloc.dart';
import 'package:fish_shop/ui/login/bloc/login_event.dart';
import 'package:fish_shop/ui/login/bloc/login_state.dart';
import 'package:fish_shop/ui/my_language/bloc/my_language_bloc.dart';
import 'package:fish_shop/ui/my_language/bloc/my_language_event.dart';
import 'package:fish_shop/ui/register/register.dart';
import 'package:fish_shop/ui/utils/preferences.dart';
import 'package:fish_shop/ui/utils/uihelper.dart';
import 'package:fish_shop/ui/utils/utils.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatefulWidget {
  // final VoidCallback onClickedSignUp;
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formkey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password = TextEditingController();
  @override
  void initState() {
    _requestNotificationPermission();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  bool shouldRemember = false;
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          bool isApproved = state.result.data?.farmerStatus?.approved ?? false;

          if (state.result.data?.isFarmer ?? false) {
            if (!isApproved) {
              Navigator.pop(context);
              displayToastMessage('Your request has not been approved');
              return;
            }

            Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) {
                return const HomeListing();
              },
            ));
          } else {
            Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) {
                return const FishFarmDetails(
                  isEdit: false,
                );
              },
            ));
          }
        } else if (state is LoginFailed) {
          Navigator.pop(context);
          displayToastMessage(state.errorMessage);
        }
      },
      child: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(16.r),
                child: Form(
                  key: formkey,
                  child: Column(
                    children: [
                      UiHelper.verticalSpacing(130.h),
                      Image.asset('assets/logo.png'),
                      UiHelper.verticalSpacing(19.h),
                      _buildUpperText(),
                      UiHelper.verticalSpacing(90.h),
                      Container(
                        padding: EdgeInsets.only(
                          left: 5.w,
                          right: 231.w,
                        ),
                        child: Text(
                          translation(context).hello,
                          style: TextStyle(
                            fontSize: 22.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      UiHelper.verticalSpacing(20.h),
                      FishTextField(
                        validator: (value) => Validators.validateEmpty(value),
                        textEditingController: _email,
                        label: 'Phone Number',
                        contentPadding: EdgeInsets.only(left: 15.w),
                      ),
                      UiHelper.verticalSpacing(20.h),
                      FishTextField(
                        validator: (value) => Validators.validateEmpty(value),
                        textEditingController: _password,
                        label: 'Password',
                        contentPadding: EdgeInsets.only(left: 15.w),
                        obscureText: _obscureText,
                        onSuffixIconTap: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        sufixIcon: Icon(
                          _obscureText
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: _obscureText ? Colors.grey : Colors.grey,
                        ),
                      ),
                      UiHelper.verticalSpacing(10.h),
                      Row(
                        children: [
                          Checkbox(
                            value: shouldRemember,
                            onChanged: (value) async {
                              Preferences preferences = Preferences();
                              shouldRemember = value ?? false;
                              setState(() {});
                              await preferences.saveBool(
                                  Preference.remember, value ?? false);
                            },
                          ),
                          Text(
                            'Remember me',
                            style: TextStyle(
                                fontSize: 10.sp, color: AppColors.textColor),
                          )
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 2.w),
                        alignment: Alignment.bottomLeft,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return const Forgot();
                              },
                            ));
                          },
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(
                                fontSize: 12.sp, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      UiHelper.verticalSpacing(20.h),
                      Column(
                        children: [
                          SizedBox(
                            width: 330.w,
                            height: 48.h,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12.r),
                              child: ElevatedButton(
                                onPressed: () {
                                  bool isValid =
                                      formkey.currentState!.validate();
                                  if (isValid) {
                                    showLoaderDialog(context);

                                    BlocProvider.of<LoginBloc>(context).add(
                                        LoginWithPhone(
                                            password: _password.text.trim(),
                                            phoneNumber: _email.text.trim()));
                                  } else {}
                                },

                                //  signIn,
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      UiHelper.verticalSpacing(20.h),
                      RichText(
                          text: TextSpan(
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                              text: 'Not a Member?',
                              children: [
                            TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () =>
                                      Navigator.push(context, MaterialPageRoute(
                                        builder: (context) {
                                          return const RegistrationPage();
                                        },
                                      )),
                                text: ' Register Now',
                                style: const TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w600))
                          ])),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _buildUpperText() {
    return Column(
      children: [
        Text(
          translation(context).lumbini,
          // 'Lumbini Provincial Government',
          style: const TextStyle(
            color: AppColors.textColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          translation(context).agriculture,
          // '  Ministry of Agriculture and Land Management ',
          style: const TextStyle(
            color: AppColors.textColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          translation(context).ministry,
          //      'Directorate of Livestock and Fisheries',
          style: const TextStyle(
            color: AppColors.textRedColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 20.w),
          child: Text(
            translation(context).butwal,
            //  '  Development',
            style: const TextStyle(
              color: AppColors.textRedColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  _requestNotificationPermission() {
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()!
        .requestPermission();
  }
}
