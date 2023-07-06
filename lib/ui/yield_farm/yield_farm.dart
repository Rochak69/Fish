import 'package:fish_shop/res/colors.dart';
import 'package:fish_shop/ui/common_widget/FishTextField.dart';
import 'package:fish_shop/ui/common_widget/app_dropdown.dart';
import 'package:fish_shop/ui/utils/uihelper.dart';
import 'package:fish_shop/ui/utils/utils.dart';
import 'package:fish_shop/ui/yield_farm/bloc/yeild_form_bloc.dart';
import 'package:fish_shop/ui/yield_farm/bloc/yeild_form_event.dart';
import 'package:fish_shop/ui/yield_farm/bloc/yeild_form_state.dart';
import 'package:fish_shop/ui/your_listing/bloc/your_listing_bloc.dart';
import 'package:fish_shop/ui/your_listing/bloc/your_listing_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class YieldForm extends StatefulWidget {
  const YieldForm({super.key});

  @override
  State<YieldForm> createState() => _YieldFormState();
}

class _YieldFormState extends State<YieldForm> {
  DateTime? date;
  String avgUnit = 'kg';
  String totalWeightUnit = 'kg';

  final TextEditingController _edControllerDate = TextEditingController();
  final TextEditingController _fishTypeController = TextEditingController();
  final TextEditingController _totalWeightController = TextEditingController();
  final TextEditingController _weightPerFishController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<YeildFormBloc, YeildFormState>(
      listener: (context, state) {
        Navigator.pop(context);
        if (state is YeildFormSuccess) {
          displayToastMessage('Successfully created');
          BlocProvider.of<YourListingBloc>(context).add(GetMyListings());
          Navigator.pop(context);
        } else if (state is YeildFormFailed) {
          displayToastMessage(state.errorMessage);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            translation(context).hello,
            style: TextStyle(
                color: AppColors.textColor,
                fontWeight: FontWeight.w700,
                fontSize: 22.sp),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildUpperText(context),
                UiHelper.verticalSpacing(10.h),
                RichText(
                  text: TextSpan(
                      text: 'Type of fish',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 16.sp),
                      children: [
                        TextSpan(
                            text: ' *',
                            style:
                                TextStyle(color: Colors.red, fontSize: 16.sp))
                      ]),
                ),
                UiHelper.verticalSpacing(5),
                FishTextField(
                  textEditingController: _fishTypeController,
                  contentPadding: EdgeInsets.only(left: 15.w),
                  label: '',
                ),
                UiHelper.verticalSpacing(15),
                RichText(
                  text: TextSpan(
                      text: 'Weight per fish',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 16.sp),
                      children: [
                        TextSpan(
                            text: ' *',
                            style:
                                TextStyle(color: Colors.red, fontSize: 16.sp))
                      ]),
                ),
                UiHelper.verticalSpacing(5),
                Row(
                  children: [
                    FishTextField(
                      textInputType:
                          const TextInputType.numberWithOptions(decimal: true),
                      textEditingController: _weightPerFishController,
                      label: '',
                      width: 186.w,
                    ),
                    UiHelper.horizontalSpacing(10.w),
                    AppDropDown(
                      items: const [
                        DropdownMenuItem(value: 'kg', child: Text('kg')),
                        DropdownMenuItem(value: 'gram', child: Text('gram')),
                      ],
                      onChanged: (value) {
                        avgUnit = value ?? 'kg';
                      },
                    )
                  ],
                ),
                UiHelper.verticalSpacing(15.h),
                RichText(
                  text: TextSpan(
                      text: 'Total weight',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 16.sp),
                      children: [
                        TextSpan(
                            text: ' *',
                            style:
                                TextStyle(color: Colors.red, fontSize: 16.sp))
                      ]),
                ),
                UiHelper.verticalSpacing(5.h),
                Row(
                  children: [
                    FishTextField(
                      textEditingController: _totalWeightController,
                      label: '',
                      width: 186.w,
                      textInputType:
                          const TextInputType.numberWithOptions(decimal: true),
                    ),
                    UiHelper.horizontalSpacing(10.w),
                    AppDropDown(
                      items: const [
                        DropdownMenuItem(value: 'kg', child: Text('kg')),
                        DropdownMenuItem(value: 'gram', child: Text('gram')),
                      ],
                      onChanged: (value) {
                        totalWeightUnit = value ?? 'kg';
                      },
                    )
                  ],
                ),
                UiHelper.verticalSpacing(15.h),
                RichText(
                  text: TextSpan(
                      text: 'Yeild Date',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 16.sp),
                      children: [
                        TextSpan(
                            text: ' *',
                            style:
                                TextStyle(color: Colors.red, fontSize: 16.sp))
                      ]),
                ),
                UiHelper.verticalSpacing(5.h),
                FishTextField(
                  onTap: () {
                    pickDate(context);
                  },
                  isReadOnly: true,
                  textEditingController: _edControllerDate,
                  contentPadding: EdgeInsets.only(left: 15.w),
                  sufixIcon: Image.asset('assets/arrow_down.png'),
                  label: 'Select Date',
                  onSuffixIconTap: () {
                    pickDate(context);
                  },
                ),
                UiHelper.verticalSpacing(15),
                Center(
                  child: SizedBox(
                    width: 330.w,
                    height: 48.h,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_weightPerFishController.text.isEmpty ||
                              _totalWeightController.text.isEmpty ||
                              _edControllerDate.text.isEmpty ||
                              _fishTypeController.text.isEmpty) {
                            displayToastMessage(
                                'PLease fill in all the deatials');
                            return;
                          }
                          if (date == null) {
                            displayToastMessage('Please pick a date');
                            return;
                          }

                          showLoaderDialog(context);
                          BlocProvider.of<YeildFormBloc>(context).add(
                              PostYeildForm(
                                  avgFishWeight: double.parse(
                                      _weightPerFishController.text),
                                  fishType: _fishTypeController.text,
                                  totalWeight:
                                      double.parse(_totalWeightController.text),
                                  yieldDate: date.toString()));
                        },
                        child: Text(
                          '+  Add to Listing',
                          style:
                              TextStyle(fontSize: 12.sp, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildUpperText(context) {
    return Text(
      'Fill the details for your yields',
      style: TextStyle(
        color: AppColors.secondaryTextColor,
        fontWeight: FontWeight.w400,
        fontSize: 12.sp,
      ),
    );
  }

  Future<void> pickDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
      builder: (context, child) => Theme(
        data: Theme.of(context).copyWith(
          colorScheme: const ColorScheme.light(primary: Colors.green),
        ),
        child: child!,
      ),
    );

    if (pickedDate != null) {
      print('Picked Date: $pickedDate');
      _edControllerDate.text = pickedDate.toString().substring(0, 10);
      date = pickedDate;
      setState(() {});
    } else {
      print('No date selected');
    }
  }
}
