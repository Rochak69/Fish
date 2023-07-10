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
  String selectedUnit = 'हेक्टर';
  String? profilePicturePath;
  String? citizenshipPicturePath;
  String? palikaPicturePath;
  String? othersPath;
  String? selectedDistrict;
  TextEditingController pondSize = TextEditingController();
  TextEditingController citizenNumber = TextEditingController();
  TextEditingController citizenName = TextEditingController();
  TextEditingController citizenDistricId = TextEditingController();

  @override
  void initState() {
    BlocProvider.of<FishFarmerDetailBloc>(context)
        .add(GetDistrict(provinceId: null));
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FishFarmerDetailBloc, FishFarmerDetailState>(
      listener: (context, state) {
        if (state.theStates == TheStates.success && state.isPosted) {
          displayToastMessage('Farmer created successfully');
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const LoginPage();
              },
            ),
            (route) => false,
          );
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
                translation(context).fish_farm_detials,
                //  'Fish Farm Details',
                style: TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 22.sp),
              ),
            ),
            body: Form(
              key: _formKey,
              child: SingleChildScrollView(
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
                                  text: translation(context).pond_area,
                                  //'    Farms size',
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
                              width: 200.w,
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
                                  text: translation(context).area_unit,
                                  // '   Unit',
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
                                  selectedUnit = p0 ?? 'हेक्टर';
                                  setState(() {});
                                },
                                value: selectedUnit,
                                items: const [
                                  DropdownMenuItem(
                                      value: 'हेक्टर', child: Text('हेक्टर')),
                                  DropdownMenuItem(
                                      value: 'कठ्ठा', child: Text('कठ्ठा')),
                                  DropdownMenuItem(
                                      value: 'विघाह', child: Text('विघाह')),
                                  DropdownMenuItem(
                                      value: 'वर्ग मिटर',
                                      child: Text('वर्ग मिटर')),
                                ])
                          ],
                        ),
                      ],
                    ),
                    UiHelper.verticalSpacing(12.h),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          translation(context).citizenship_form_detials1,
                          style: TextStyle(
                              color: AppColors.textColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 18.sp),
                        ),
                        Text(
                          translation(context).citizenship_form_detials2,
                          style: TextStyle(
                              color: AppColors.textColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 18.sp),
                        ),
                        Text(
                          translation(context).citizenship_form_detials3,
                          style: TextStyle(
                              color: AppColors.textRedColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 14.sp),
                        ),
                      ],
                    ),
                    UiHelper.verticalSpacing(12.h),
                    RichText(
                      text: TextSpan(
                          text: translation(context).citizenship_name,
                          //'Citizenship\'s name',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 12.sp),
                          children: []),
                    ),
                    UiHelper.verticalSpacing(8.h),
                    FishTextField(
                        textEditingController: citizenName, label: ''),
                    UiHelper.verticalSpacing(12.h),
                    RichText(
                      text: TextSpan(
                          text: translation(context).citizenship_number,
                          //'Citizenship\'s Number',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 12.sp),
                          children: []),
                    ),
                    UiHelper.verticalSpacing(8.h),
                    FishTextField(
                        textEditingController: citizenNumber, label: ''),
                    UiHelper.verticalSpacing(12.h),
                    RichText(
                      text: TextSpan(
                          text: translation(context).citizenship_place,
                          //'Citizenship\'s Location',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 12.sp),
                          children: []),
                    ),
                    UiHelper.verticalSpacing(8.h),
                    AppDropDown<String>(
                      value: selectedDistrict,
                      isExpanded: true,
                      items: state.districtResponse
                              ?.map((e) => DropdownMenuItem(
                                  value: e.id, child: Text(e.englishName!)))
                              .toList() ??
                          [],
                      onChanged: (value) {
                        selectedDistrict = value;
                        setState(() {});
                      },
                    ),
                    UiHelper.verticalSpacing(12.h),
                    RichText(
                      text: TextSpan(
                          text: translation(context).upload_document,
                          //'Please upload your picture',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 12.sp),
                          children: []),
                    ),
                    UiHelper.verticalSpacing(12.h),
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
                          style: ButtonStyle(
                            elevation: MaterialStateProperty.all<double>(
                                0), // Set elevation to 0
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    10), // Change border radius to desired value
                              ),
                            ),
                          ),
                          child: const Text('Choose'),
                        )),
                    UiHelper.verticalSpacing(12.h),
                    RichText(
                      text: TextSpan(
                          text: translation(context).citizenship_upload,
                          //'Please upload your citizenship\'s picture',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 12.sp),
                          children: []),
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
                          style: ButtonStyle(
                            elevation: MaterialStateProperty.all<double>(
                                0), // Set elevation to 0
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    10), // Change border radius to desired value
                              ),
                            ),
                          ),
                          child: const Text('Choose'),
                        )),
                    UiHelper.verticalSpacing(12.h),
                    Text(
                      translation(context).no_citizenship,
                      style: TextStyle(
                          color: AppColors.textColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 18.sp),
                    ),
                    UiHelper.verticalSpacing(8.h),
                    RichText(
                      text: TextSpan(
                          text: translation(context).ask_necessary_document,
                          //'Please upload your picture',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 12.sp),
                          children: []),
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
                          style: ButtonStyle(
                            elevation: MaterialStateProperty.all<double>(
                                0), // Set elevation to 0
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    10), // Change border radius to desired value
                              ),
                            ),
                          ),
                          child: const Text('Choose'),
                        )),
                    UiHelper.verticalSpacing(12.h),
                    Text(
                      translation(context).commpany_details,
                      style: TextStyle(
                          color: AppColors.textColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 18.sp),
                    ),
                    UiHelper.verticalSpacing(8.h),
                    RichText(
                      text: TextSpan(
                          text: translation(context).conpany_form_statement,
                          //'Please upload your picture',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 12.sp),
                          children: []),
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
                          style: ButtonStyle(
                            elevation: MaterialStateProperty.all<double>(
                                0), // Set elevation to 0
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    10), // Change border radius to desired value
                              ),
                            ),
                          ),
                          child: const Text('Choose'),
                        )),
                    UiHelper.verticalSpacing(20.h),
                    SizedBox(
                      width: 330.w,
                      height: 48.h,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            showLoaderDialog(context);
                            BlocProvider.of<FishFarmerDetailBloc>(context).add(
                              PostFarmerDetailsEvent(
                                  profilePicture: profilePicturePath,
                                  identification: citizenshipPicturePath,
                                  registerPic: palikaPicturePath,
                                  userId: widget.userId,
                                  farmName: widget.farmName,
                                  farmersName: widget.farmersName,
                                  phoneNumber: widget.phoneNumber,
                                  pradesh: widget.pradesh,
                                  district: widget.district,
                                  pondSize: getInMeter(
                                      double.tryParse(pondSize.text) ?? 0,
                                      selectedUnit),
                                  nagarpalika: widget.nagarpalika,
                                  woda: int.tryParse(widget.woda) ?? 0,
                                  citizenNumber: citizenNumber.text,
                                  citizenDistricId: selectedDistrict ?? '1',
                                  citizenName: citizenName.text),
                            );
                          }
                        },
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all<double>(
                              0), // Set elevation to 0
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10
                                  .r), // Change border radius to desired value
                            ),
                          ),
                        ),
                        child: const Text('Save'),
                      ),
                    ),
                    UiHelper.verticalSpacing(20.h),
                  ],
                ),
              )),
            ));
      },
    );
  }
}

double getInMeter(double value, String unit) {
  if (unit == 'वर्ग मिटर') {
    return value * 0.0001;
  }
  if (unit == 'विघाह') {
    return value * 0.6666;
  }
  if (unit == 'कठ्ठा') {
    return value * 0.03333;
  }
  return value;
}
