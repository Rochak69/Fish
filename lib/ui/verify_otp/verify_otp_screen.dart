// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:buyer_shop/core/injection/dependency_injection.dart';
import 'package:buyer_shop/core/notification/notification_services.dart';
import 'package:buyer_shop/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:buyer_shop/ui/common_widget/pin_fields.dart';
import 'package:buyer_shop/ui/reset_password/reset_password.dart';
import 'package:buyer_shop/ui/utils/preferences.dart';
import 'package:buyer_shop/ui/utils/uihelper.dart';
import 'package:buyer_shop/ui/utils/utils.dart';
import 'package:buyer_shop/ui/verify_otp/bloc/verify_otp_bloc.dart';
import 'package:buyer_shop/ui/verify_otp/bloc/verify_otp_event.dart';
import 'package:buyer_shop/ui/verify_otp/bloc/verify_otp_state.dart';

class VerifyOtpScreen extends StatefulWidget {
  final String? phoneNumber;
  final String otp;
  const VerifyOtpScreen({
    Key? key,
    this.phoneNumber,
    required this.otp,
  }) : super(key: key);

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  bool isButtonEnabled = false;
  String? _pinCode;
  void _updateButtonStatus(String pinCode) {
    if (pinCode.length == 6) {
      isButtonEnabled = true;
      _pinCode = pinCode;
    } else {
      isButtonEnabled = false;
      _pinCode = pinCode;
    }
    setState(() {});
  }

  @override
  void initState() {
    _showNotification();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VerifyOtpBloc, VerifyOtpState>(
      listener: (context, state) {
        if (state is VerifyOtpSuccess) {
          Navigator.pop(context);
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return const ChangePassword();
            },
          ));
        }
        if (state is VerifyOtpFailed) {
          Navigator.pop(context);
          displayToastMessage(state.errorMessage,
              backgroundColor: AppColors.textRedColor);
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    UiHelper.verticalSpacing(20.h),
                    UiHelper.verticalSpacing(59.h),
                    UiHelper.verticalSpacing(45.h),
                    UiHelper.verticalSpacing(45.h),
                    PinFields(
                      pinLength: 6,
                      onPinCodeChanged: _updateButtonStatus,
                    ),
                    UiHelper.verticalSpacing(45.h),
                    UiHelper.verticalSpacing(60.h),
                    ElevatedButton(
                        onPressed: () async {
                          Preferences preferences = Preferences();
                          String? userId =
                              await preferences.getString(Preference.userID);
                          if (userId == null || _pinCode == null) {
                            displayToastMessage('USer Id or pin code is null');
                            return;
                          } else if (_pinCode!.length != 6) {
                            displayToastMessage('Pin code lenght must be 6');
                            return;
                          } else {
                            showLoaderDialog(context);
                            BlocProvider.of<VerifyOtpBloc>(context).add(
                                VerifyOtpEventWithPhone(
                                    otp: _pinCode!, userId: userId));
                          }
                        },
                        child: const Text('Verify Otp'))
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  _showNotification() async {
    await sl<NotificationServices>().initLocalNotifications(context);
    sl<NotificationServices>().showNotification(widget.otp);
  }
}
