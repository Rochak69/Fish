import 'package:fish_shop/res/colors.dart';
import 'package:fish_shop/ui/common_widget/FishTextField.dart';
import 'package:fish_shop/ui/fisher_farm_details/bloc/fish_farmer_detail_bloc.dart';
import 'package:fish_shop/ui/fisher_farm_details/bloc/fish_farmer_detail_event.dart';

import 'package:fish_shop/ui/fisher_farm_details/bloc/fish_farmer_detail_state.dart';
import 'package:fish_shop/ui/home_listing/home_listing.dart';
import 'package:fish_shop/ui/login/login.dart';
import 'package:fish_shop/ui/utils/preferences.dart';
import 'package:fish_shop/ui/utils/uihelper.dart';
import 'package:fish_shop/ui/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FishFarmDetails extends StatefulWidget {
  const FishFarmDetails({super.key});

  @override
  State<FishFarmDetails> createState() => _FishFarmDetailsState();
}

class _FishFarmDetailsState extends State<FishFarmDetails> {
  final farmerNameController = TextEditingController();
  final pondSizeController = TextEditingController();
  final pradeshController = TextEditingController();
  final districtController = TextEditingController();
  final locationController = TextEditingController();

  final woda = TextEditingController();
  String selectedDropdownValue = 'Nagarpalika';
  @override
  Widget build(BuildContext context) {
    return BlocListener<FishFarmerDetailBloc, FishFarmerDetailState>(
      listener: (context, state) {
        Navigator.pop(context);
        if (state is FishFarmerDetailSuccess) {
          displayToastMessage('Farmer created successfully');
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return const LoginPage();
            },
          ));
        } else if (state is FishFarmerDetailFailed) {
          displayToastMessage(state.errorMessage,
              backgroundColor: AppColors.textRedContainerColor);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Fisher Farmers Detail',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w900,
                fontSize: 16.sp),
          ),
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          elevation: 0,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildUpperText(),
                    Text(
                      'Farm\'s Name',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 12.sp),
                    ),
                    UiHelper.verticalSpacing(5.h),
                    /*
                     {
              "id": "ccd3a0a6-21fa-4f3b-a74e-87807e4ebd6d",
              "userId": "bf3c54f9-acb2-4fc2-be2c-3d88843592ee",
              "profilePicture": "Selfile",
              "farmName": "Kritan farm house",
              "pondSize": 300,
              "fiscalYear": "2023-06-27T07:33:24.352Z",
              "active": true,
              "approved": true,
              "location": {
                "pradesh": "Bagmati",
                "district": "Lalitpur",
                "mahaNagarpalika": null,
                "upaMahaNagarpalika": null,
                "gaupalika": null,
                "nagarpalika": "Godawori"
              },
                    */
                    FishTextField(
                      textEditingController: farmerNameController,
                      label: 'Farm\'s Name',
                      contentPadding: EdgeInsets.only(left: 15.w),
                    ),
                    UiHelper.verticalSpacing(20),
                    Text(
                      'Profile Picture',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 12.sp),
                    ),
                    UiHelper.verticalSpacing(5.h),
                    FishTextField(
                      label: '',
                      prefixIcon: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                          ),
                          child: const Text('Choose')),
                    ),
                    UiHelper.verticalSpacing(10.h),
                    Padding(
                      padding: EdgeInsets.only(left: 5.w),
                      child: Text(
                        'Your\'s Location',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 12.sp),
                      ),
                    ),
                    UiHelper.verticalSpacing(10.h),
                    FishTextField(
                      textEditingController: districtController,
                      label: 'District',
                      contentPadding: EdgeInsets.only(left: 5.w),
                      width: double.infinity,
                    ),
                    UiHelper.verticalSpacing(16.h),
                    FishTextField(
                      textEditingController: pradeshController,
                      label: 'Pradesh',
                      contentPadding: EdgeInsets.only(left: 5.w),
                      width: double.infinity,
                    ),
                    UiHelper.verticalSpacing(10.h),
                    DropdownButtonFormField<String>(
                      value: selectedDropdownValue,
                      onChanged: (value) {
                        setState(() {
                          selectedDropdownValue = value ?? 'Nagarpalika';
                        });
                      },
                      items: const [
                        DropdownMenuItem(
                          value: 'Nagarpalika',
                          child: Text('Nagarpalika'),
                        ),
                        DropdownMenuItem(
                          value: 'Gaupalika',
                          child: Text('Gaupalika'),
                        ),
                        DropdownMenuItem(
                          value: 'Mahanagarpalika',
                          child: Text('Mahanagarpalika'),
                        ),
                        DropdownMenuItem(
                          value: 'Upamaharnagarpalika',
                          child: Text('Upamaharnagarpalika'),
                        ),
                      ],
                      decoration: const InputDecoration(
                        labelText: 'Select an option',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    UiHelper.verticalSpacing(16.h),
                    FishTextField(
                      textEditingController: locationController,
                      label: selectedDropdownValue,
                      contentPadding: EdgeInsets.only(left: 5.w),
                      width: double.infinity,
                    ),
                    UiHelper.verticalSpacing(16.h),
                    FishTextField(
                      textEditingController: woda,
                      label: 'Woda',
                      contentPadding: EdgeInsets.only(left: 5.w),
                      width: double.infinity,
                    ),
                    UiHelper.verticalSpacing(16.h),
                    Padding(
                      padding: EdgeInsets.only(left: 5.w),
                      child: Text(
                        'Farm\'s Total Pond Size',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 12.sp),
                      ),
                    ),
                    UiHelper.verticalSpacing(5.h),
                    Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: FishTextField(
                            textEditingController: pondSizeController,
                            textInputType: TextInputType.number,
                            label: '',
                          ),
                        ),
                        UiHelper.horizontalSpacing(10.w),
                        const Expanded(
                          flex: 1,
                          child: FishTextField(
                            label: 'sqm',
                          ),
                        ),
                      ],
                    ),
                    UiHelper.verticalSpacing(20.h),
                    Text(
                      'Farm\'s Identification Document',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 12.sp),
                    ),
                    UiHelper.verticalSpacing(5.h),
                    FishTextField(
                      label: '',
                      prefixIcon: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                          ),
                          child: const Text('Choose')),
                    ),
                    UiHelper.verticalSpacing(10.h),
                    Text(
                      'Farm\'s Registration Document',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 12.sp),
                    ),
                    UiHelper.verticalSpacing(5.h),
                    FishTextField(
                      label: '',
                      prefixIcon: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                          ),
                          child: const Text('Choose')),
                    ),
                    UiHelper.verticalSpacing(22.h),
                    SizedBox(
                      width: 340.w,
                      height: 48.h,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: ElevatedButton(
                          onPressed: () async {
                            Preferences preferences = Preferences();
                            String? userId =
                                await preferences.getString(Preference.userID);
                            if (userId == null) {
                              displayToastMessage('USerId is null');
                              return;
                            }
                            if (farmerNameController.text.isEmpty ||
                                locationController.text.isEmpty ||
                                woda.text.isEmpty ||
                                districtController.text.isEmpty ||
                                pradeshController.text.isEmpty) {
                              displayToastMessage('Please input all fields');
                              return;
                            }
                            showLoaderDialog(context);
                            String locationKey =
                                getLocationKey(selectedDropdownValue);
                            BlocProvider.of<FishFarmerDetailBloc>(context)
                                .add(PostFarmerDetailsEvent(
                              userId: userId,
                              pondSize: int.parse(pondSizeController.text),
                              farmName: farmerNameController.text,
                              district: districtController.text,
                              location: locationController.text,
                              woda: int.parse(woda.text),
                              locationKey: locationKey,
                              pradesh: pradeshController.text,
                            ));
                            //HomeListing
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor:
                                Colors.blue, // Set the button's text color
                          ),
                          child: Text(
                            'Send For Approval',
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    UiHelper.verticalSpacing(30.h)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _buildUpperText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UiHelper.verticalSpacing(16.h),
        Text(
          'Fill in the details about your fish farm',
          style: TextStyle(
            color: AppColors.secondaryTextColor,
            fontWeight: FontWeight.w400,
            fontSize: 12.sp,
          ),
        ),
        UiHelper.verticalSpacing(24.h),
      ],
    );
  }

  String getLocationKey(String selectedDropdownValue) {
    switch (selectedDropdownValue) {
      case 'Nagarpalika':
        // Handle Nagarpalika case
        print('nagarpalika');
        return 'nagarpalika';
      // "mahaNagarpalika": null,
      //     "upaMahaNagarpalika": null,
      //     "gaupalika": null,
      //     "nagarpalika": "Godawori"
      case 'Gaupalika':
        // Handle Gaupalika case
        print('gaupalika');
        return 'gaupalika';
      case 'Mahanagarpalika':
        // Handle Mahanagarpalika case
        print('mahaNagarpalika');
        return 'mahaNagarpalika';
      case 'Updamaharnagarpalika':
        // Handle Updamaharnagarpalika case
        print('upaMahaNagarpalika');
        return 'upaMahaNagarpalika';
      default:
        return 'nagarpalika';
    }
  }
}
