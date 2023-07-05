import 'package:fish_shop/res/colors.dart';
import 'package:fish_shop/ui/forgot_password/forgot_password.dart';
import 'package:fish_shop/ui/utils/uihelper.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              UiHelper.verticalSpacing(63),
              _buildUpperText(),
              UiHelper.verticalSpacing(17),
              Image.asset('assets/avatar.png'),
              UiHelper.verticalSpacing(16),
              const Text(
                'Lucas Scott',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                    fontSize: 16),
              ),
              UiHelper.verticalSpacing(47),
              SizedBox(
                width: 300,
                height: 20,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Forgot()));
                        },
                        child: const Text(
                          'Reset Password',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      //   Image.asset('assets/right_button.png'),
                    ]),
              ),
              UiHelper.verticalSpacing(20),
              Container(
                width: 343,
                height: 1,
                color: AppColors.neutralLineColor,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildUpperText() {
    return Column(
      children: [
        const Text(
          'Settings',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w800, fontSize: 16),
        ),
        UiHelper.verticalSpacing(16),
      ],
    );
  }
}
