import 'package:fish_shop/res/colors.dart';
import 'package:fish_shop/ui/common_widget/CardListing.dart';
import 'package:fish_shop/ui/common_widget/FishTextField.dart';
import 'package:fish_shop/ui/utils/uihelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Listings extends StatelessWidget {
  const Listings({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          _buildUpperText(),
        ],
      ),
    );
  }

  _buildUpperText() {
    return Padding(
      padding: const EdgeInsets.only(right: 15.0),
      child: Column(children: [
        UiHelper.verticalSpacing(10.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            UiHelper.horizontalSpacing(160.5),
            const Text(
              'Home',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                  fontSize: 16),
            ),
            UiHelper.horizontalSpacing(110),
            Container(
                padding: const EdgeInsets.only(right: 22),
                child: Image.asset('assets/avatar_small.png')),
          ],
        ),
        UiHelper.verticalSpacing(10),
        FishTextField(
          label: 'Search',
          contentPadding: EdgeInsets.only(left: 15.w),
          prefixIcon: const Icon(Icons.search),
        ),
        UiHelper.verticalSpacing(15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 80,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(
                    color: AppColors.AppCardColor), // Specify the border color
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset('assets/icon.png'),
                    const Text(
                      'मिति',
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                    Image.asset('assets/arrow_down.png'),
                  ],
                ),
              ),
            ),
            Container(
              width: 120,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(
                    color: AppColors.AppCardColor), // Specify the border color
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset('assets/icon.png'),
                    const Text(
                      'माछाको प्रजाती',
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                    Image.asset('assets/arrow_down.png'),
                  ],
                ),
              ),
            ),
            Container(
              width: 90,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(
                    color: AppColors.AppCardColor), // Specify the border color
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset('assets/icon.png'),
                    const Text(
                      'जिल्ला',
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                    Image.asset('assets/arrow_down.png'),
                  ],
                ),
              ),
            ),
          ],
        ),
        UiHelper.verticalSpacing(20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: CardListing(
            avgWeight: 50,
            date: '2080/03/17',
            fishName: 'नैनी',
            location: 'Kathmandu',
            totalWeight: 100,
            userDemandId: '2121',
          ),
        ),
        UiHelper.verticalSpacing(23),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: CardListing(
            avgWeight: 50,
            date: '2080/03/17',
            fishName: 'ग्रास कार्प',
            location: 'Kathmandu',
            totalWeight: 100,
            userDemandId: '2121',
          ),
        ),
        UiHelper.verticalSpacing(23),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: CardListing(
            avgWeight: 50,
            date: '2080/03/17',
            fishName: ' नैनी ',
            location: 'Kathmandu',
            totalWeight: 100,
            userDemandId: '2121',
          ),
        ),
        UiHelper.verticalSpacing(23),
      ]),
    );
  }
}
