// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fish_shop/common/validator.dart';
import 'package:fish_shop/ui/common_widget/FishTextField.dart';
import 'package:fish_shop/ui/home_listing/bloc/home_listings_bloc.dart';
import 'package:fish_shop/ui/home_listing/bloc/home_listings_event.dart';
import 'package:fish_shop/ui/utils/preferences.dart';
import 'package:fish_shop/ui/utils/utils.dart';
import 'package:fish_shop/ui/your_listing/your_listing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:fish_shop/res/colors.dart';
import 'package:fish_shop/ui/utils/uihelper.dart';

class CardListing extends StatefulWidget {
  final Color? backgroundColor;
  final Color? textColor;
  final String fishName;
  final int avgWeight;
  final int totalWeight;
  final String location;
  final String date;
  final String userDemandId;
  const CardListing({
    Key? key,
    this.backgroundColor,
    this.textColor,
    required this.fishName,
    required this.avgWeight,
    required this.totalWeight,
    required this.location,
    required this.date,
    required this.userDemandId,
  }) : super(key: key);

  @override
  State<CardListing> createState() => _CardListingState();
}

class _CardListingState extends State<CardListing> {
  late TextEditingController offerWeight;

  @override
  void initState() {
    offerWeight = TextEditingController(text: widget.totalWeight.toString());
    super.initState();
  }

  @override
  void dispose() {
    offerWeight.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
      decoration: BoxDecoration(
        color: AppColors.cardContainerColor,
        border: Border.all(color: AppColors.cardContainerColor),
        borderRadius: BorderRadius.circular(20.r),
      ),
      alignment: Alignment.topLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              children: [
                Text(
                  'Fish Type : ',
                  style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textColor),
                ),
                Text(
                  widget.fishName,
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
                  'Fish weight : ',
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
                Text(
                  '${widget.avgWeight} Kg',
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
                  'Qunatity : ',
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
                Text(
                  widget.totalWeight.toString(),
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
                  'Yeild Date : ',
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
                Text(
                  formarDate(widget.date),
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.AppCardColor),
                ),
              ],
            ),
            // Text(
            //   'Location : ${widget.location}',
            //   style: TextStyle(
            //       fontSize: 12.sp,
            //       fontWeight: FontWeight.w800,
            //       color: AppColors.AppCardColor),
            // ),
          ]),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 6.w),
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.textColor, width: 1.5.w),
                borderRadius: const BorderRadius.all(Radius.circular(20))),
            child: TextButton(
                onPressed: () {
                  _showAlertDialog(
                    context: context,
                  );
                },
                child: const Text(
                  'Send Offer',
                  style: TextStyle(
                      color: AppColors.textColor, fontWeight: FontWeight.w500),
                )),
          ),
        ],
      ),
    );
  }

  void _showAlertDialog({required BuildContext context}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: AlertDialog(
            title: Center(
                child: Text(
              'Send Offer',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w600,
                color: AppColors.AppCardColor,
                fontSize: 14,
              ),
            )),
            // To display the title it is optional
            content: Container(
              padding: EdgeInsets.only(top: 20.h),
              width: 232.w,
              height: 120.h,
              child: Column(
                children: [
                  Text(
                    'Are you sure you want to send offer',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                      color: AppColors.AppCardColor,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    'for ${offerWeight.text} kg ${widget.fishName} ( ${widget.avgWeight} kg )',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                      color: AppColors.AppCardColor,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    ' ${widget.location}?',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                      color: AppColors.AppCardColor,
                      fontSize: 14,
                    ),
                  ),
                  FishTextField(
                    validator: (value) => Validator.validateEmpty(value),
                    textInputType: TextInputType.number,
                    label: 'Offer weight',
                    textEditingController: offerWeight,
                  ) // Message which will be pop up on the screen')
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
                    onPressed: () async {
                      Preferences preferences = Preferences();
                      String? phoneNumber =
                          await preferences.getString(Preference.phoneNumber);
                      if (phoneNumber == null || phoneNumber.isEmpty) {
                        displayToastMessage('Phone number is null',
                            backgroundColor: AppColors.textRedColor);
                        return;
                      }
                      BlocProvider.of<HomeListingsBloc>(context).add(SendOffer(
                          userDemandId: widget.userDemandId,
                          phoneNumber: phoneNumber,
                          weight: int.parse(offerWeight.text)));
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
