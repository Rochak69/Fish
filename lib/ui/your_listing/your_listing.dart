import 'package:fish_shop/res/colors.dart';
import 'package:fish_shop/ui/pending_request_per_listing/pending_request_per_listing.dart';
import 'package:fish_shop/ui/utils/uihelper.dart';
import 'package:fish_shop/ui/utils/utils.dart';
import 'package:fish_shop/ui/your_listing/bloc/your_listing_bloc.dart';
import 'package:fish_shop/ui/your_listing/bloc/your_listing_event.dart';
import 'package:fish_shop/ui/your_listing/bloc/your_listing_state.dart';
import 'package:fish_shop/ui/your_listing/model/your_listing_model.dart';
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
                  // translation(context).your_listings,
                  'मेरो माछाको प्रजातीहरु ',
                  style: TextStyle(
                      color: AppColors.textColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 22.sp),
                ),
              ),
              body: RefreshIndicator(
                onRefresh: () => _refresh(),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 25.w, vertical: 12.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 12.w),
                        child: Text(
                          'बजारको लागी बिक्री अर्डरमा राखेयाको बाकी माछाको विवरण',
                          //  translation(context).your_listing_details,
                          //  'Details for fish listed for selling by you',
                          style: const TextStyle(color: AppColors.AppCardColor),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      UiHelper.verticalSpacing(10.h),
                      Expanded(
                        child: ListView.separated(
                          itemCount: state.result.data?.length ?? 0,
                          separatorBuilder: (context, index) =>
                              UiHelper.verticalSpacing(23.h),
                          itemBuilder: (context, index) {
                            return _buildListingCard(state, index, context);
                          },
                        ),
                      ),
                    ],
                  ),
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

  Container _buildListingCard(
      YourListingSuccess state, int index, BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(top: 16.w, bottom: 16.w, left: 18.h, right: 26.w),
      decoration: BoxDecoration(
        color: AppColors.cardContainerColor,
        border: Border.all(color: AppColors.cardContainerColor),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            alignment: WrapAlignment.start,
            children: [
              Wrap(
                alignment: WrapAlignment.start,
                children: [
                  Text(
                    translation(context).fish_type,
                    //  'Fish Type : ',
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textColor),
                  ),
                  getFishType(state.result.data?[index].fishType?.name)
                ],
              ),
              UiHelper.horizontalSpacing(6.w),
              InkWell(
                  onTap: () {
                    _showAlertDialog(
                      context: context,
                      id: state.result.data?[index].id ?? '',
                      avgWeight: state.result.data?[index].avgFishWeight ?? 0,
                      totalWeight: state.result.data?[index].totalWeight ?? 0,
                      yeildDate: state.result.data?[index].yieldDate ?? '',
                      fistType: state.result.data?[index].fishType?.name ?? '',
                    );
                  },
                  child: Image.asset(
                    'assets/trash.png',
                    height: 16.h,
                    fit: BoxFit.fill,
                  )),
            ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                    '${state.result.data?[index].avgFishWeight} के.जी',
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
                    // 'Total weight : ',
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                  Text(
                    '${state.result.data?[index].totalWeight} के.जी',
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
                    translation(context).yield_date,
                    //   'Yeild Date : ',
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                  Text(
                    formarDate(state.result.data?[index].yieldDate),
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
                    translation(context).listing_expired,
                    //  'Expiration Date : ',
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                  Text(
                    formarDate(state.result.data?[index].expireDate),
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.AppCardColor),
                  ),
                ],
              ),
              UiHelper.verticalSpacing(3.h),
              state.result.data?[index].buyerRequest?.isEmpty ?? true
                  ? Text(
                      translation(context).no_offer,
                      style: TextStyle(
                          fontSize: 8.sp, color: AppColors.AppCardColor),
                    )
                  : const SizedBox.shrink(),
            ]),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: AppColors.textColor, width: 1.5.r),
                    borderRadius: BorderRadius.all(Radius.circular(12.r)),
                  ),
                  child: TextButton(
                    onPressed: () {
                      List<BuyerRequest> list =
                          state.result.data?[index].buyerRequest ?? [];
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BuyerRequestsScreen(
                                avgWeight: state
                                        .result.data?[index].avgFishWeight
                                        .toString() ??
                                    '',
                                totalWeight: state
                                        .result.data?[index].totalWeight
                                        .toString() ??
                                    '',
                                yeildDate:
                                    state.result.data?[index].yieldDate ?? '',
                                fishType:
                                    state.result.data?[index].fishType?.name ??
                                        '',
                                buyerRequests:
                                    state.result.data?[index].buyerRequest ??
                                        []),
                          ));
                    },
                    child: const Text(
                      'View Offers',
                      style: TextStyle(
                          color: AppColors.textColor,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                Positioned(
                  top: -12.h,
                  right: -12.w,
                  child: Container(
                    height: 24.h,
                    width: 31.w,
                    decoration: BoxDecoration(
                      color: AppColors.textColor,
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    child: Center(
                      child: Text(
                        state.result.data?[index].buyerRequest?.length
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
          ]),
        ],
      ),
    );
  }

  void _showAlertDialog(
      {required BuildContext context,
      required String yeildDate,
      required num totalWeight,
      required String fistType,
      required num avgWeight,
      required String id}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.r)),
          title: Center(
              child: Text(
            'के तपाइँ यो जानकारी मेटाउन चाहानुहुन्छ ?',
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w900,
              color: Colors.black,
              fontSize: 14.sp,
            ),
          )), // To display the title it is optional
          content: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Text(
                      translation(context).fish_type,
                      //'Fish Type : ',
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textColor),
                    ),
                    Text(
                      fistType,
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
                      // 'Fish weight : ',
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ),
                    Text(
                      '$avgWeight के.जी',
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
                      // 'Qunatity : ',
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ),
                    Text(
                      totalWeight.toString() + ' के.जी',
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
                      'माछा मारको मिति:',
                      //'Yeild Date : ',
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
                Row(
                  children: [
                    Text(
                      'विज्ञापन सकिने दिन:  ',
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
              ]),
          actionsAlignment: MainAxisAlignment.center,
          // Action widget which will provide the user to acknowledge the choice
          actions: [
            Container(
              width: 110.w,
              height: 40.h,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: AppColors.textColor),
                  borderRadius: BorderRadius.all(Radius.circular(20.r))),
              child: TextButton(
                  onPressed: () {
                    BlocProvider.of<YourListingBloc>(context)
                        .add(DeleteMyListings(id: id));
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Yes',
                    style: GoogleFonts.inter(
                      color: AppColors.textColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 12.sp,
                    ),
                  )),
            ),
            Container(
              width: 110.h,
              height: 40.h,
              decoration: BoxDecoration(
                  color: AppColors.textRedColor,
                  border: Border.all(color: AppColors.textRedColor),
                  borderRadius: BorderRadius.all(Radius.circular(20.r))),
              child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'No',
                    style: TextStyle(color: Colors.white),
                  )),
            ),
          ],
        );
      },
    );
  }

  Future<void> _refresh() async {
    BlocProvider.of<YourListingBloc>(context).add(GetMyListings());
  }
}

Text getFishType(String? fish) {
  // String fishType = fish ?? '';
  // if (fishType.length > 7) {
  //   fishType = '${fishType.substring(0, 7)}\n${fishType.substring(7)}';
  // }

  return Text(fish ?? '',
      style: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w700,
        color: Colors.black,
      ));
}

String formarDate(String? date) {
  if (date == null) {
    return 'Null';
  } else {
    return date.substring(0, 10);
  }
}
