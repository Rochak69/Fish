import 'package:buyer_shop/common/validator.dart';
import 'package:buyer_shop/res/colors.dart';
import 'package:buyer_shop/ui/approval_pending/approval_pending.dart';
import 'package:buyer_shop/ui/common_widget/FishTextField.dart';
import 'package:buyer_shop/ui/utils/uihelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_file/open_file.dart';
import 'package:file_picker/file_picker.dart';

class UserDetails extends StatefulWidget {
  const UserDetails({super.key});
  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  final farmerNameController = TextEditingController();
  final pondSizeController = TextEditingController();
  final pradeshController = TextEditingController();
  final districtController = TextEditingController();
  final locationController = TextEditingController();
  String selectedDropdownValue = 'Nagarpalika';

  @override
  void _pickFile() async {
    // opens storage to pick files and the picked file or files
    // are assigned into result and if no file is chosen result is null.
    // you can also toggle "allowMultiple" true or false depending on your need
    final result = await FilePicker.platform.pickFiles(allowMultiple: true);

    // if no file is picked
    if (result == null) return;

    // we get the file from result object
    final file = result.files.first;

    _openFile(file);
  }

  void _openFile(PlatformFile file) {
    OpenFile.open(file.path);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UiHelper.verticalSpacing(36.h),
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
                  validator: (value) => Validators.validateEmpty(value),
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
                      value: 'Updamaharnagarpalika',
                      child: Text('Updamaharnagarpalika'),
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
                  label: 'Location',
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
                        label: '',
                      ),
                    ),
                    UiHelper.horizontalSpacing(10.w),
                    Expanded(
                      flex: 1,
                      child: FishTextField(
                        label: '',
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
                      onPressed: () {
                        _pickFile();
                      },
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
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ApprovalPending()));
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
    );
  }

  _buildUpperText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Fisher Farmers Detail',
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w900,
              fontSize: 16.sp),
        ),
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
}
