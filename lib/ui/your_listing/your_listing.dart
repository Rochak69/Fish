import 'package:fish_shop/res/colors.dart';
import 'package:fish_shop/ui/utils/uihelper.dart';
import 'package:fish_shop/ui/your_listing/bloc/your_listing_bloc.dart';
import 'package:fish_shop/ui/your_listing/bloc/your_listing_event.dart';
import 'package:fish_shop/ui/your_listing/bloc/your_listing_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class YourListings extends StatefulWidget {
  const YourListings({super.key});

  @override
  State<YourListings> createState() => _YourListingsState();
}

class _YourListingsState extends State<YourListings> {
  @override
  void initState() {
    BlocProvider.of<YourListingBloc>(context).add(GetMyListings());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<YourListingBloc, YourListingState>(
      listener: (context, state) {},
      child: BlocConsumer<YourListingBloc, YourListingState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is YourListingSuccess) {
            return Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                centerTitle: true,
                elevation: 0,
                backgroundColor: Colors.white,
                title: Text(
                  'Yield Farm',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w900,
                      fontSize: 20.sp),
                ),
              ),
              body: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        itemCount: state.result.data?.length ?? 0,
                        separatorBuilder: (context, index) =>
                            UiHelper.verticalSpacing(5.h),
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            height: 87.h,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: AppColors.cardContainerColor),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        color: AppColors.cardContainerColor,
                                        alignment: Alignment.topLeft,
                                        child: Column(children: [
                                          UiHelper.verticalSpacing(16.h),
                                          Text(
                                            '${state.result.data?[index].fishType} ( ${state.result.data?[index].avgFishWeight} kg )',
                                            style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w800,
                                                color: AppColors.AppCardColor),
                                          ),
                                          UiHelper.verticalSpacing(4),
                                          Text(
                                            'Date : ${formarDate(state.result.data?[index].yieldDate)}',
                                            style: TextStyle(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w800,
                                                color: AppColors.AppCardColor),
                                          ),
                                          UiHelper.verticalSpacing(4),
                                          Text(
                                            'Quantity : ${state.result.data?[index].totalWeight} kg',
                                            style: TextStyle(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w800,
                                                color: AppColors.AppCardColor),
                                          ),
                                        ]),
                                      ),
                                      Stack(
                                        clipBehavior: Clip.none,
                                        children: [
                                          Container(
                                            width: 92.w,
                                            height: 40.h,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.blue,
                                                  width: 1.5.r),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(12.r)),
                                            ),
                                            child: TextButton(
                                              onPressed: () {
                                                // Add your button's onPressed logic here
                                              },
                                              child: const Text('View Offers'),
                                            ),
                                          ),
                                          Positioned(
                                            top: -12.h,
                                            right: -12.w,
                                            child: Container(
                                              height: 24.h,
                                              width: 31.w,
                                              decoration: BoxDecoration(
                                                color: Colors.blue,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  state.result.data?[index]
                                                          .buyerRequest?.length
                                                          .toString() ??
                                                      '0',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      GestureDetector(
                                          onTap: () {
                                            _showAlertDialog(
                                              context: context,
                                              id: state
                                                      .result.data?[index].id ??
                                                  '',
                                              avgWeight: state
                                                      .result
                                                      .data?[index]
                                                      .avgFishWeight ??
                                                  0,
                                              totalWeight: state
                                                      .result
                                                      .data?[index]
                                                      .totalWeight ??
                                                  0,
                                              yeildDate: state.result
                                                      .data?[index].yieldDate ??
                                                  '',
                                              fistType: state.result
                                                      .data?[index].fishType ??
                                                  '',
                                            );
                                          },
                                          child: Image.asset(
                                            'assets/trash.png',
                                            height: 24.h,
                                            fit: BoxFit.fill,
                                          )),
                                    ]),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else if (state is YourListingInitial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return const Scaffold(
                body: Center(
              child: Text('Api error'),
            ));
          }
        },
      ),
    );
  }

  void _showAlertDialog(
      {required BuildContext context,
      required String yeildDate,
      required int totalWeight,
      required String fistType,
      required int avgWeight,
      required String id}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Container(
          width: 300,
          height: 190,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: AlertDialog(
            title: Center(
                child: Text(
              'Delete Yield',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w900,
                color: AppColors.AppCardColor,
                fontSize: 14,
              ),
            )), // To display the title it is optional
            content: SizedBox(
              width: 252,
              height: 68,
              child: Column(
                children: [
                  Text(
                    'Are you sure you want to delete yield ',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                      color: AppColors.AppCardColor,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    ' ${formarDate(yeildDate)} of $totalWeight kg $fistType',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                      color: AppColors.AppCardColor,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    '($avgWeight Kg)?',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                      color: AppColors.AppCardColor,
                      fontSize: 14,
                    ),
                  ), // Message which will be pop up on the screen')
                ],
              ),
            ),

            // Action widget which will provide the user to acknowledge the choice
            actions: [
              Container(
                width: 130,
                height: 40,
                decoration: BoxDecoration(
                    color: AppColors.textColor,
                    border: Border.all(color: AppColors.textColor),
                    borderRadius: const BorderRadius.all(Radius.circular(20))),
                child: TextButton(
                    onPressed: () {
                      BlocProvider.of<YourListingBloc>(context)
                          .add(DeleteMyListings(id: id));
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Sure',
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    )),
              ),
              Container(
                width: 130,
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: AppColors.textColor),
                    borderRadius: const BorderRadius.all(Radius.circular(20))),
                child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Cancel')),
              ),
            ],
          ),
        );
      },
    );
  }
}

String formarDate(String? date) {
  if (date == null) {
    return 'Null';
  } else {
    return date.substring(0, 10);
  }
}
