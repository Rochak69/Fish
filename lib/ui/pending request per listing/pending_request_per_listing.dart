import 'package:fish_shop/res/colors.dart';
import 'package:fish_shop/ui/pending%20request%20per%20listing/bloc/pending_request_per_listing_bloc.dart';
import 'package:fish_shop/ui/pending%20request%20per%20listing/bloc/pending_request_per_listing_state.dart';
import 'package:fish_shop/ui/utils/uihelper.dart';
import 'package:fish_shop/ui/your_listing/your_listing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuyerRequestsScreen extends StatelessWidget {
  final String avgWeight;
  final String totalWeight;
  final String fishType;
  final String yeildDate;
  const BuyerRequestsScreen(
      {super.key,
      required this.avgWeight,
      required this.totalWeight,
      required this.fishType,
      required this.yeildDate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          leading: Padding(
            padding: EdgeInsets.only(left: 20.w),
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
            '$fishType ($avgWeight kg)',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w900,
                fontSize: 20.sp),
          ),
        ),
        body: SingleChildScrollView(
          child: _buildUpperText(context),
        ));
  }

  _buildUpperText(context) {
    return BlocConsumer<PendingRequestPerListingBloc,
        PendingRequestPerListingState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.9,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
            child: RefreshIndicator(
              onRefresh: () => _refresh(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 12.0.w),
                    child: Row(
                      children: [
                        Text(
                          'Fish weight : ',
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        ),
                        Text(
                          '$avgWeight kg',
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColors.AppCardColor),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 12.w),
                    child: Row(
                      children: [
                        Text(
                          'Total weight : ',
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        ),
                        Text(
                          '$totalWeight kg',
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColors.AppCardColor),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 12.w),
                    child: Row(
                      children: [
                        Text(
                          'Yeild Date : ',
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        ),
                        Text(
                          formarDate(yeildDate),
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColors.AppCardColor),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 12.w),
                    child: Row(
                      children: [
                        Text(
                          'Expiration Date : ',
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        ),
                        Text(
                          formarDate(yeildDate),
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColors.AppCardColor),
                        ),
                      ],
                    ),
                  ),
                  UiHelper.verticalSpacing(12.h),
                  Expanded(
                    child: ListView.separated(
                        padding: EdgeInsets.only(bottom: 40.h),
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) =>
                            _buildSlverCrap(context),
                        separatorBuilder: (context, index) =>
                            UiHelper.verticalSpacing(23.h),
                        itemCount: 8),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  _buildSlverCrap(context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
          color: AppColors.cardContainerColor,
          borderRadius: BorderRadius.circular(25.r)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$fishType ($avgWeight kg)',
                style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
              UiHelper.verticalSpacing(4.h),
              Row(
                children: [
                  Text(
                    'Average weight : ',
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                  Text(
                    '$avgWeight Kg',
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.AppCardColor),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Total weight : ',
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                  Text(
                    '$totalWeight Kg',
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.AppCardColor),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Yeild Date : ',
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                  Text(
                    formarDate(yeildDate),
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.AppCardColor),
                  ),
                ],
              ),
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
                                borderRadius: BorderRadius.circular(20.r),
                                border: Border.all(
                                    color: AppColors
                                        .textColor), // Specify the border color
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
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(
                        color: AppColors.textColor,
                        width: 1.5.w), // Specify the border color
                  ),
                  child: Center(
                    child: Text(
                      'Accept',
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textColor),
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
                                    color: Colors
                                        .blue), // Specify the border color
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
                    borderRadius: BorderRadius.circular(15.r),
                    border: Border.all(
                        color: Colors.red,
                        width: 1.5.r), // Specify the border color
                  ),
                  child: Center(
                    child: Text(
                      'Reject',
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textRedColor),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Future<void> _refresh() async {}
}
