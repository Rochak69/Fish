import 'package:fish_shop/res/colors.dart';
import 'package:fish_shop/ui/order%20history/bloc/order_history_bloc.dart';
import 'package:fish_shop/ui/order%20history/bloc/order_history_state.dart';
import 'package:fish_shop/ui/utils/uihelper.dart';
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
          'Order History',
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w900,
              fontSize: 20.sp),
        ),
      ),
      body: Column(
        children: [UiHelper.verticalSpacing(15.5.h), _buildUpperText(context)],
      ),
    );
  }

  _buildUpperText(context) {
    return BlocConsumer<OrderHistoryBloc, OrderHistoryState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 34.w, vertical: 12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500)),
            Text('Contact: 980307638',
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
                            'Mark as Completed',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                        content: const Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Are you sure you want to Mark this',
                              style: TextStyle(
                                fontSize: 14,
                                color: AppColors.secondaryTextColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              'deal as completed ?',
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
                                  color:
                                      Colors.blue), // Specify the border color
                            ),
                            child: const Center(
                              child: Text(
                                'Sure',
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
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(12.r),
                                border: Border.all(
                                    color: Colors
                                        .blue), // Specify the border color
                              ),
                              child: const Center(
                                child: Text(
                                  'Cancel',
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
                      color: Colors.blue), // Specify the border color
                ),
                child: const Center(
                  child: Text(
                    'Completed',
                    style: TextStyle(
                        color: AppColors.textColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 12),
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
                        content: const Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Are you sure you want to Mark this',
                              style: TextStyle(
                                fontSize: 14,
                                color: AppColors.secondaryTextColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              'deal as cancelled ?',
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
                                  color:
                                      Colors.blue), // Specify the border color
                            ),
                            child: const Center(
                              child: Text(
                                'Sure',
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
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(12.r),
                                border: Border.all(
                                    color: Colors
                                        .blue), // Specify the border color
                              ),
                              child: const Center(
                                child: Text(
                                  'Cancel',
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
                  border:
                      Border.all(color: Colors.red), // Specify the border color
                ),
                child: const Center(
                  child: Text('Cancelled',
                      style: TextStyle(
                        color: AppColors.textRedContainerColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      )),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
