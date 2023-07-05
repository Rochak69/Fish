import 'package:fish_shop/res/colors.dart';
import 'package:fish_shop/ui/pending%20request%20per%20listing/bloc/pending_request_per_listing_bloc.dart';
import 'package:fish_shop/ui/pending%20request%20per%20listing/bloc/pending_request_per_listing_state.dart';
import 'package:fish_shop/ui/utils/uihelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PendingRequestPerListing extends StatelessWidget {
  const PendingRequestPerListing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Silver Carp (2kg) offers',
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w900,
              fontSize: 20.sp),
        ),
      ),
      body: _buildUpperText(context),
    );
  }

  _buildUpperText(context) {
    return BlocConsumer<PendingRequestPerListingBloc,
        PendingRequestPerListingState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 34.w, vertical: 12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Yield Date : 2073/02/21',
                style: TextStyle(
                  color: AppColors.secondaryTextColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
              ),
              const Text(
                ' Quantity : 100 kg ',
                style: TextStyle(
                  color: AppColors.secondaryTextColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
              ),
              UiHelper.verticalSpacing(20.h),
              _buildSlverCrap(context),
              UiHelper.verticalSpacing(30.h),
              _buildSlverCrap(context)
            ],
          ),
        );
      },
    );
  }

  Row _buildSlverCrap(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Silver Crap ( 2 kgs)',
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w800)),
            Text('Required Date: 2073/02/21',
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500)),
            Text('Quantity: 100kg',
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500)),
            Text('Location: Kathmandu 24',
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500))
          ],
        ),
        Column(
          children: [
            InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        actionsAlignment: MainAxisAlignment.center,
                        actionsPadding: EdgeInsets.symmetric(vertical: 12.h),
                        title: const Center(
                          child: Text(
                            'Accept Offer',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w700),
                          ),
                        ),
                        content: const Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Are you sure, you want to Accept',
                              style: TextStyle(fontSize: 12),
                            ),
                            Text(
                              'Offer for Silver Crap (2kg) for',
                              style: TextStyle(fontSize: 12),
                            ),
                            Text(
                              '2073/02/21 of 100kg?',
                              style: TextStyle(fontSize: 12),
                            )
                          ],
                        ),
                        actions: [
                          Container(
                            width: 91.w,
                            height: 40.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.r),
                              border: Border.all(
                                  color:
                                      Colors.blue), // Specify the border color
                            ),
                            child: const Center(
                              child: Text(
                                'Sure',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                          UiHelper.horizontalSpacing(15.w),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              width: 91.w,
                              height: 40.h,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(12.r),
                                border: Border.all(
                                    color: Colors
                                        .blue), // Specify the border color
                              ),
                              child: const Center(
                                child: Text(
                                  'Cancel',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    });
              },
              child: Container(
                width: 91.w,
                height: 40.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(
                      color: Colors.blue), // Specify the border color
                ),
                child: const Center(
                  child: Text(
                    'Accept',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ),
            UiHelper.verticalSpacing(5.h),
            InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        actionsAlignment: MainAxisAlignment.center,
                        actionsPadding: EdgeInsets.symmetric(vertical: 12.h),
                        title: const Center(
                          child: Text(
                            'Reject Offer',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w700),
                          ),
                        ),
                        content: const Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Are you sure, you want to Reject',
                              style: TextStyle(fontSize: 12),
                            ),
                            Text(
                              'Offer for Silver Crap (2kg) for',
                              style: TextStyle(fontSize: 12),
                            ),
                            Text(
                              '2073/02/21 of 100kg?',
                              style: TextStyle(fontSize: 12),
                            )
                          ],
                        ),
                        actions: [
                          Container(
                            width: 91.w,
                            height: 40.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.r),
                              border: Border.all(
                                  color:
                                      Colors.blue), // Specify the border color
                            ),
                            child: const Center(
                              child: Text(
                                'Sure',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                          UiHelper.horizontalSpacing(15.w),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              width: 91.w,
                              height: 40.h,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(12.r),
                                border: Border.all(
                                    color: Colors
                                        .blue), // Specify the border color
                              ),
                              child: const Center(
                                child: Text(
                                  'Cancel',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    });
              },
              child: Container(
                width: 91.w,
                height: 40.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  border:
                      Border.all(color: Colors.red), // Specify the border color
                ),
                child: const Center(
                  child: Text(
                    'Reject',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
