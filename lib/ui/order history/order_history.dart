import 'package:fish_shop/res/colors.dart';
import 'package:fish_shop/ui/order%20history/bloc/order_history_bloc.dart';
import 'package:fish_shop/ui/order%20history/bloc/order_history_state.dart';
import 'package:fish_shop/ui/utils/uihelper.dart';
import 'package:fish_shop/ui/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderHistory extends StatefulWidget {
  const OrderHistory({super.key});

  @override
  State<OrderHistory> createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  final int _selectedIndex = 0;

  // const ChooseNumberListView(),
  // const Messages(),
  // const ShowHelpView(),

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          translation(context).order_history,
          //    'Order History',
          style: TextStyle(
              color: AppColors.textColor,
              fontWeight: FontWeight.w700,
              fontSize: 22.sp),
        ),
      ),
      body: _buildUpperText(context),
    );
  }

  _buildUpperText(context) {
    return BlocConsumer<OrderHistoryBloc, OrderHistoryState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return RefreshIndicator(
          onRefresh: () => _refresh(),
          child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
              itemBuilder: (context, index) => _buildSlverCrap(context),
              separatorBuilder: (context, index) =>
                  UiHelper.verticalSpacing(23.h),
              itemCount: 10),
        );
      },
    );
  }

  _buildSlverCrap(context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 14.w),
      decoration: BoxDecoration(
          color: AppColors.cardContainerColor,
          borderRadius: BorderRadius.circular(15.r),
          border:
              Border.all(width: 1.5.r, color: AppColors.cardContainerColor)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    translation(context).fish_type,
                    //    'Fish Type : ',
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textColor),
                  ),
                  Text(
                    'नैनी',
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                ],
              ),
              UiHelper.verticalSpacing(4.h),
              Row(
                children: [
                  Text(
                    translation(context).fish_weight,
                    //'Fish weight : ',
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                  Text(
                    '5 के.जी',
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
                    translation(context).quantity,
                    //   'Qunatity : ',
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                  Text(
                    '66',
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w800,
                        color: AppColors.AppCardColor),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    translation(context).yield_date,
                    //   'Yeild Date : ',
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                  Text(
                    '2023-12-22',
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
                    translation(context).buyer_name,
                    //   'Buyer\'s name : ',
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                  Text(
                    'Ram Yadav',
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
                    translation(context).buyer_address,
                    //      'Buyers Address : ',
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                  Text(
                    'Kathmandu',
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
                    translation(context).contact_details,
                    //          'Phone Number : ',
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                  Text(
                    '9860908787',
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
                              'Mark as Completed',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    translation(context)
                                        .fish_type, //'Are you sure you want to Mark this',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: AppColors.textColor,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Text(
                                    ': सिल्भर कार्प', //'Are you sure you want to Mark this',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: AppColors.secondaryTextColor,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                translation(context).fish_weight + ':1.5 के.जी',
                                //'Are you sure you want to Mark this',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: AppColors.secondaryTextColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                translation(context).quantity + ':100 के.जी',
                                //'Are you sure you want to Mark this',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: AppColors.secondaryTextColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                translation(context).yield_date + '2080/03/27',
                                //'Are you sure you want to Mark this',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: AppColors.secondaryTextColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                translation(context).listing_expired,
                                //'Are you sure you want to Mark this',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: AppColors.secondaryTextColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          actions: [
                            Container(
                              width: 91.w,
                              height: 40.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.r),
                                border: Border.all(
                                    color: AppColors
                                        .AppCardColor), // Specify the border color
                              ),
                              child: const Center(
                                child: Text(
                                  'Yes',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: AppColors.textColor,
                                    fontWeight: FontWeight.w600,
                                  ),
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
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(12.r),
                                  // border: Border.all(
                                  //     color: Colors
                                  //         .blue), // Specify the border color
                                ),
                                child: const Center(
                                  child: Text(
                                    'No',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
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
                        width: 1.5.w,
                        color: AppColors.textColor), // Specify the border color
                  ),
                  child: Center(
                    child: Text(
                      translation(context).completed,
                      // 'Completed',
                      style: TextStyle(
                          color: AppColors.textColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 12.sp),
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
                              'Mark as Canceled',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
// माछाको प्रजाती : सिल्भर कार्प
// माछाको आकार:
// ज्ञ।छ के.जी
// माछाको परिमाण के.जी:
// ज्ञण्ण् के.जी
// माछा मारको मिति:
// द्दण्ठडरण्घरद्दण्
// विज्ञापन सकिने दिन:
// ३ दिन बाँकी छ
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                translation(context).fish_type +
                                    'सिल्भर कार्प', //'Are you sure you want to Mark this',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: AppColors.secondaryTextColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                translation(context).fish_weight + ':1.5 के.जी',
                                //'Are you sure you want to Mark this',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: AppColors.secondaryTextColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                translation(context).quantity + ':100 के.जी',
                                //'Are you sure you want to Mark this',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: AppColors.secondaryTextColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                translation(context).yield_date + '2080/03/27',
                                //'Are you sure you want to Mark this',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: AppColors.secondaryTextColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                translation(context).listing_expired,
                                //'Are you sure you want to Mark this',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: AppColors.secondaryTextColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
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
                                  'Yes',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: AppColors.textColor,
                                    fontWeight: FontWeight.w600,
                                  ),
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
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(12.r),
                                  //   border: Border.all(
                                  //       color: Colors
                                  //           .blue), // Specify the border color
                                ),
                                child: const Center(
                                  child: Text(
                                    'No',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
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
                        color: Colors.red,
                        width: 1.5.w), // Specify the border color
                  ),
                  child: Center(
                    child: Text(translation(context).cancelled,
                        //  'Cancelled',
                        style: TextStyle(
                          color: AppColors.textRedContainerColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                        )),
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
