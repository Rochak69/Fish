import 'package:fish_shop/res/colors.dart';
import 'package:fish_shop/ui/pending%20request%20per%20listing/pending_request_per_listing.dart';
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
                  'Your Listings',
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
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 12.w),
                        child: const Text(
                          'Details for fish listed for selling by you',
                          style: TextStyle(color: AppColors.AppCardColor),
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
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              Row(
                children: [
                  Text(
                    'Fish Type : ',
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textColor),
                  ),
                  getFishType(state.result.data?[index].fishType)
                ],
              ),
              UiHelper.horizontalSpacing(6.w),
              GestureDetector(
                  onTap: () {
                    _showAlertDialog(
                      context: context,
                      id: state.result.data?[index].id ?? '',
                      avgWeight: state.result.data?[index].avgFishWeight ?? 0,
                      totalWeight: state.result.data?[index].totalWeight ?? 0,
                      yeildDate: state.result.data?[index].yieldDate ?? '',
                      fistType: state.result.data?[index].fishType ?? '',
                    );
                  },
                  child: Image.asset(
                    'assets/trash.png',
                    height: 16.h,
                    fit: BoxFit.fill,
                  )),
            ],
          ),
          UiHelper.verticalSpacing(4.h),
          Row(
            children: [
              Text(
                'Fish weight : ',
                style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
              Text(
                '${state.result.data?[index].avgFishWeight} Kg',
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
                '${state.result.data?[index].totalWeight} Kg',
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
                'Expiration Date : ',
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
          UiHelper.verticalSpacing(3.h),
          state.result.data?[index].buyerRequest?.isEmpty ?? true
              ? Text(
                  'You have not recieved any orders yet',
                  style:
                      TextStyle(fontSize: 10.sp, color: AppColors.AppCardColor),
                )
              : const SizedBox.shrink(),
        ]),
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.textColor, width: 1.5.r),
                borderRadius: BorderRadius.all(Radius.circular(12.r)),
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BuyerRequestsScreen(
                          avgWeight: state.result.data?[index].avgFishWeight
                                  .toString() ??
                              '',
                          totalWeight: state.result.data?[index].totalWeight
                                  .toString() ??
                              '',
                          yeildDate: state.result.data?[index].yieldDate ?? '',
                          fishType: state.result.data?[index].fishType ?? '',
                        ),
                      ));
                },
                child: const Text(
                  'View Offers',
                  style: TextStyle(
                      color: AppColors.textColor, fontWeight: FontWeight.w600),
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
                    state.result.data?[index].buyerRequest?.length.toString() ??
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

  Future<void> _refresh() async {
    BlocProvider.of<YourListingBloc>(context).add(GetMyListings());
  }
}

Text getFishType(String? fish) {
  String fishType = fish ?? '';
  if (fishType.length > 7) {
    fishType = '${fishType.substring(0, 7)}\n${fishType.substring(7)}';
  }

  return Text(fishType,
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
