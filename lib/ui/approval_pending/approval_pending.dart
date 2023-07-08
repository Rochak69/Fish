import 'package:buyer_shop/res/colors.dart';
import 'package:buyer_shop/ui/utils/uihelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ApprovalPending extends StatelessWidget {
  const ApprovalPending({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _buildUpperText(),
          Image.asset('assets/logo.png'),
          UiHelper.verticalSpacing(28),
          _buildMiddleText(),
          UiHelper.verticalSpacing(19),
          _buildContactDetails(),
          UiHelper.verticalSpacing(15),
          SizedBox(
            width: 280.w,
            height: 48.h,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: ElevatedButton(
                onPressed: () {
                  //HomeListing
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue, // Set the button's text color
                ),
                child: Text(
                  'Proceed',
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
    );
  }

  _buildContactDetails() {
    return Container(
      padding: const EdgeInsets.only(left: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                  // padding: const EdgeInsets.only(left: 33),
                  child: const Text(
                'Contact:',
                style: TextStyle(
                  color: AppColors.textRedColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              )),
              const Text(
                '071-420434, 071-420435',
                style: TextStyle(
                  color: AppColors.textColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          Container(
              padding: const EdgeInsets.only(right: 248),
              child: const Text(
                '071- 420436',
                style: TextStyle(
                  color: AppColors.textColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              )),
          Container(
              // padding: const EdgeInsets.only(left: 29),
              child: const Row(
            children: [
              Text(
                'Email:',
                style: TextStyle(
                  color: AppColors.textColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
              Text(
                'dolfdp5@gmail.com',
                style: TextStyle(
                  color: AppColors.textColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ],
          )),
        ],
      ),
    );
  }

  _buildUpperText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        UiHelper.verticalSpacing(122),
        const Text(
          'Your form has been Submitted',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w900, fontSize: 16),
        ),
        UiHelper.verticalSpacing(16),
        const Column(
          children: [
            Text(
              'Please wait till the Application is approved by',
              style: TextStyle(
                color: AppColors.secondaryTextColor,
                fontWeight: FontWeight.w400,
                fontSize: 12,
              ),
            ),
            Text(
              '  the concerned Authority',
              style: TextStyle(
                color: AppColors.secondaryTextColor,
                fontWeight: FontWeight.w400,
                fontSize: 12,
              ),
            ),
          ],
        ),
        UiHelper.verticalSpacing(24),
      ],
    );
  }

  _buildMiddleText() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Lumbini Provincial Government',
          style: TextStyle(
            color: AppColors.textColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          'Ministry of Agriculture and Land Management ',
          style: TextStyle(
            color: AppColors.textColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          'Directorate of Livestock and Fisheries',
          style: TextStyle(
            color: AppColors.textColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          'Development',
          style: TextStyle(
            color: AppColors.textColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
