import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:fish_shop/common/validator.dart';
import 'package:fish_shop/res/colors.dart';
import 'package:fish_shop/ui/common_widget/FishTextField.dart';
import 'package:fish_shop/ui/common_widget/app_dropdown.dart';
import 'package:fish_shop/ui/fisher_farm_details/bloc/fish_farmer_detail_bloc.dart';
import 'package:fish_shop/ui/fisher_farm_details/bloc/fish_farmer_detail_event.dart';
import 'package:fish_shop/ui/fisher_farm_details/bloc/fish_farmer_detail_state.dart';
import 'package:fish_shop/ui/login/login.dart';
import 'package:fish_shop/ui/utils/uihelper.dart';
import 'package:fish_shop/ui/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart' as path;
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IdentificationDocuments extends StatefulWidget {
  final String userId;
  final String farmName;
  final String phoneNumber;
  final String farmersName;
  final String district;
  final String nagarpalika;
  final String woda;
  final String pradesh;

  const IdentificationDocuments(
      {super.key,
      required this.userId,
      required this.farmName,
      required this.farmersName,
      required this.district,
      required this.nagarpalika,
      required this.woda,
      required this.pradesh,
      required this.phoneNumber});

  @override
  State<IdentificationDocuments> createState() =>
      _IdentificationDocumentsState();
}

class _IdentificationDocumentsState extends State<IdentificationDocuments> {
  String selectedUnit = 'm';
  String? profilePicturePath;
  String? citizenshipPicturePath;
  String? palikaPicturePath;
  String? othersPath;
  TextEditingController pondSize = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FishFarmerDetailBloc, FishFarmerDetailState>(
      listener: (context, state) {
        if (state.theStates == TheStates.success && state.isPosted) {
          displayToastMessage('Farmer created successfully');
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return const LoginPage();
            },
          ));
        } else if (state.theStates == TheStates.failed) {
          displayToastMessage(state.errorMessage,
              backgroundColor: AppColors.textRedContainerColor);
        }
      },
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              centerTitle: true,
              elevation: 0,
              backgroundColor: Colors.white,
              title: Text(
                'Fish Farm Details',
                style: TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 22.sp),
              ),
            ),
            body: SingleChildScrollView(
                child: Padding(
              padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                                text: '    Farms size',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12.sp),
                                children: [
                                  TextSpan(
                                      text: ' *',
                                      style: TextStyle(
                                          color: Colors.red, fontSize: 16.sp))
                                ]),
                          ),
                          UiHelper.verticalSpacing(8.h),
                          SizedBox(
                            width: 220,
                            child: FishTextField(
                              validator: (value) =>
                                  Validators.validateEmpty(value),
                              label: '',
                              textEditingController: pondSize,
                            ),
                          )
                        ],
                      ),
                      UiHelper.horizontalSpacing(16.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                                text: '   Unit',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12.sp),
                                children: [
                                  TextSpan(
                                      text: ' *',
                                      style: TextStyle(
                                          color: Colors.red, fontSize: 16.sp))
                                ]),
                          ),
                          UiHelper.verticalSpacing(8.h),
                          AppDropDown(
                              onChanged: (p0) {
                                selectedUnit = p0 ?? 'm';
                                setState(() {});
                              },
                              value: selectedUnit,
                              items: const [
                                DropdownMenuItem(value: 'm', child: Text('m')),
                                DropdownMenuItem(value: 'km', child: Text('km'))
                              ])
                        ],
                      ),
                    ],
                  ),
                  UiHelper.verticalSpacing(12.h),
                  RichText(
                    text: TextSpan(
                        text: 'Citizenship\'s name',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 12.sp),
                        children: [
                          TextSpan(
                              text: ' *',
                              style:
                                  TextStyle(color: Colors.red, fontSize: 16.sp))
                        ]),
                  ),
                  UiHelper.verticalSpacing(8.h),
                  FishTextField(
                      validator: (value) => Validators.validateEmpty(value),
                      label: ''),
                  UiHelper.verticalSpacing(12.h),
                  RichText(
                    text: TextSpan(
                        text: 'Citizenship\'s Number',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 12.sp),
                        children: [
                          TextSpan(
                              text: ' *',
                              style:
                                  TextStyle(color: Colors.red, fontSize: 16.sp))
                        ]),
                  ),
                  UiHelper.verticalSpacing(8.h),
                  FishTextField(
                      validator: (value) => Validators.validateEmpty(value),
                      label: ''),
                  UiHelper.verticalSpacing(12.h),
                  RichText(
                    text: TextSpan(
                        text: 'Citizenship\'s Location',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 12.sp),
                        children: [
                          TextSpan(
                              text: ' *',
                              style:
                                  TextStyle(color: Colors.red, fontSize: 16.sp))
                        ]),
                  ),
                  UiHelper.verticalSpacing(8.h),
                  AppDropDown(isExpanded: true, onChanged: (p0) {}, items: []),
                  UiHelper.verticalSpacing(12.h),
                  RichText(
                    text: TextSpan(
                        text: 'Please upload your picture',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 12.sp),
                        children: [
                          TextSpan(
                              text: ' *',
                              style:
                                  TextStyle(color: Colors.red, fontSize: 16.sp))
                        ]),
                  ),
                  UiHelper.verticalSpacing(8.h),
                  FishTextField(
                      isReadOnly: true,
                      label: path.basename(profilePicturePath ?? ''),
                      prefixIcon: ElevatedButton(
                        onPressed: () async {
                          FilePickerResult? result =
                              await FilePicker.platform.pickFiles();

                          if (result != null) {
                            File file = File(result.files.single.path ?? '');
                            if (file.path.isEmpty) {
                              displayToastMessage('Invalid file path',
                                  backgroundColor: AppColors.textRedColor);
                              return;
                            }
                            profilePicturePath = file.path;
                            setState(() {});
                          } else {
                            // User canceled the picker
                          }
                        },
                        child: const Text('Choose'),
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all<double>(
                              0), // Set elevation to 0
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  10), // Change border radius to desired value
                            ),
                          ),
                        ),
                      )),
                  UiHelper.verticalSpacing(12.h),
                  RichText(
                    text: TextSpan(
                        text: 'Please upload your citizenship\'s picture',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 12.sp),
                        children: [
                          TextSpan(
                              text: ' *',
                              style:
                                  TextStyle(color: Colors.red, fontSize: 16.sp))
                        ]),
                  ),
                  UiHelper.verticalSpacing(8.h),
                  FishTextField(
                      isReadOnly: true,
                      label: path.basename(citizenshipPicturePath ?? ''),
                      prefixIcon: ElevatedButton(
                        onPressed: () async {
                          FilePickerResult? result =
                              await FilePicker.platform.pickFiles();

                          if (result != null) {
                            File file = File(result.files.single.path ?? '');
                            if (file.path.isEmpty) {
                              displayToastMessage('Invalid file path',
                                  backgroundColor: AppColors.textRedColor);
                              return;
                            }
                            citizenshipPicturePath = file.path;
                            setState(() {});
                          } else {
                            // User canceled the picker
                          }
                        },
                        child: const Text('Choose'),
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all<double>(
                              0), // Set elevation to 0
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  10), // Change border radius to desired value
                            ),
                          ),
                        ),
                      )),
                  UiHelper.verticalSpacing(12.h),
                  RichText(
                    text: TextSpan(
                        text: 'Please upload your picture',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 12.sp),
                        children: [
                          TextSpan(
                              text: ' *',
                              style:
                                  TextStyle(color: Colors.red, fontSize: 16.sp))
                        ]),
                  ),
                  UiHelper.verticalSpacing(8.h),
                  FishTextField(
                      isReadOnly: true,
                      label: path.basename(palikaPicturePath ?? ''),
                      prefixIcon: ElevatedButton(
                        onPressed: () async {
                          FilePickerResult? result =
                              await FilePicker.platform.pickFiles();

                          if (result != null) {
                            File file = File(result.files.single.path ?? '');
                            if (file.path.isEmpty) {
                              displayToastMessage('Invalid file path',
                                  backgroundColor: AppColors.textRedColor);
                              return;
                            }
                            palikaPicturePath = file.path;
                            setState(() {});
                          } else {
                            // User canceled the picker
                          }
                        },
                        child: const Text('Choose'),
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all<double>(
                              0), // Set elevation to 0
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  10), // Change border radius to desired value
                            ),
                          ),
                        ),
                      )),
                  UiHelper.verticalSpacing(12.h),
                  RichText(
                    text: TextSpan(
                        text: 'Please upload your picture',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 12.sp),
                        children: [
                          TextSpan(
                              text: ' *',
                              style:
                                  TextStyle(color: Colors.red, fontSize: 16.sp))
                        ]),
                  ),
                  UiHelper.verticalSpacing(8.h),
                  FishTextField(
                      isReadOnly: true,
                      label: path.basename(othersPath ?? ''),
                      prefixIcon: ElevatedButton(
                        onPressed: () async {
                          FilePickerResult? result =
                              await FilePicker.platform.pickFiles();

                          if (result != null) {
                            File file = File(result.files.single.path ?? '');
                            if (file.path.isEmpty) {
                              displayToastMessage('Invalid file path',
                                  backgroundColor: AppColors.textRedColor);
                              return;
                            }
                            othersPath = file.path;
                            setState(() {});
                          } else {
                            // User canceled the picker
                          }
                        },
                        child: const Text('Choose'),
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all<double>(
                              0), // Set elevation to 0
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  10), // Change border radius to desired value
                            ),
                          ),
                        ),
                      )),
                  UiHelper.verticalSpacing(20.h),
                  SizedBox(
                    width: 330.w,
                    height: 48.h,
                    child: ElevatedButton(
                      onPressed: () {
                        showLoaderDialog(context);
                        BlocProvider.of<FishFarmerDetailBloc>(context).add(
                            PostFarmerDetailsEvent(
                                userId: widget.userId,
                                farmName: widget.farmName,
                                farmersName: widget.farmersName,
                                phoneNumber: widget.phoneNumber,
                                pradesh: widget.pradesh,
                                district: widget.district,
                                pondSize: int.tryParse(pondSize.text),
                                nagarpalika: widget.nagarpalika,
                                woda: int.tryParse(widget.woda) ?? 0));
                      },
                      child: const Text('Save'),
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all<double>(
                            0), // Set elevation to 0
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                10.r), // Change border radius to desired value
                          ),
                        ),
                      ),
                    ),
                  ),
                  UiHelper.verticalSpacing(20.h),
                ],
              ),
            )));
      },
    );
  }
}
