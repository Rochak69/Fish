import 'package:fish_shop/common/validator.dart';
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
  String? selectedFish;
  String? selectedunitsize;

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
            translation(context).fish_yields,
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
                      text: translation(context).fish_type,
                      //    text: 'Type of fish',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 16.sp),
                      children: [
                        TextSpan(
                            text: ' *',
                            style:
                                TextStyle(color: Colors.red, fontSize: 16.sp)),
                      ]),
                ),
                UiHelper.verticalSpacing(5),
                AppDropDown(
                  isExpanded: true,
                  //  defaultText: "Select",
                  items: const [
                    DropdownMenuItem(
                        value: 'सिल्भर कार्प माछा ',
                        child: Text('सिल्भर कार्प माछा ')),
                    DropdownMenuItem(
                        value: 'विगहेड कार्प माछा ', child: Text('नैनी')),
                    DropdownMenuItem(
                        value: 'कमन', child: Text('विगहेड कार्प माछा ')),
                    DropdownMenuItem(
                        value: 'ग्रास कार्प माछा',
                        child: Text('नैनीग्रास कार्प माछा')),
                    DropdownMenuItem(
                        value: 'रहु माछा ', child: Text('रहु माछा ')),
                    DropdownMenuItem(
                        value: 'नैनी माछा', child: Text('नैनी माछा ')),
                    DropdownMenuItem(
                        value: 'कमन कार्प माछा ',
                        child: Text('कमन कार्प माछा ')),
                    DropdownMenuItem(
                        value: 'टिलापिया माछा ', child: Text('टिलापिया माछा ')),
                    DropdownMenuItem(
                        value: 'पाङ्गास माछा ', child: Text('पाङ्गास माछा ')),
                    DropdownMenuItem(
                        value: 'रेन्वो ट्राउट माछा',
                        child: Text('रेन्वो ट्राउट माछा')),
                  ],
                  onChanged: (value) {
                    avgUnit = value ?? 'value';
                  },
                ),

                // FishTextField(
                //   validator: (value) => Validator.validateEmpty(value),
                //   textEditingController: _fishTypeController,
                //   contentPadding: EdgeInsets.only(left: 15.w),
                //   label: '',
                // ),
                UiHelper.verticalSpacing(15),
                RichText(
                  text: TextSpan(
                      text: translation(context).fish_weight,
                      // text: 'Weight per fish',
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
                DropdownButton(
  value: selectedFish,
  onChanged: (String newValue) {
    setState(() {
      selectedFish = newValue;
     });
},
items: _locations.map((String location) {
  return new DropdownMenuItem<String>(
     child: new Text(location),
  );
}).toList(),
                AppDropDown(
                  
                  isExpanded: true,
                  defaultText: 'Select fish',
                  items:  [
                    DropdownMenuItem(
                      
                        value: selectedFish, ', child: Text('सानो  माछा, ')),
                    DropdownMenuItem(
                        value: ' 0.1 के.जी', child: Text(' 0.1 के.जी')),
                    DropdownMenuItem(
                        value: '0.2 के.जी.', child: Text('0.2 के.जी. ')),
                    DropdownMenuItem(
                        value: '0.4 के.जी',
                        child: Text(
                          '0.4 के.जी',
                        )),
                    DropdownMenuItem(
                        value: '0.5 के.जी', child: Text(' 0.5 के.जी')),
                    DropdownMenuItem(
                        value: ' 0.7 के.जी', child: Text(' 0.7 के.जी')),
                    DropdownMenuItem(
                        value: ' 0.9 के.जी', child: Text('0.9 के.जी')),
                    DropdownMenuItem(value: ' 1 के.जी', child: Text('1 के.जी')),
                    DropdownMenuItem(
                        value: ' 1.3 के.जी', child: Text('1.3 के.जी')),
                    DropdownMenuItem(
                        value: '1.5 के.जी', child: Text('1.5 के.जी')),
                    DropdownMenuItem(
                        value: ' 1.7 के.जी', child: Text('1.7 के.जी')),
                    DropdownMenuItem(
                        value: ' 1.8 के.जी', child: Text('1.8 के.जी')),
                    DropdownMenuItem(value: ' 2 के.जी', child: Text('2 के.जी')),
                    DropdownMenuItem(
                        value: ' 2.2 के.जी', child: Text('2.2 के.जी')),
                    DropdownMenuItem(
                        value: ' 2.5 के.जी', child: Text('2.5 के.जी')),
                    DropdownMenuItem(value: '3 के.जी', child: Text('3 के.जी')),
                    DropdownMenuItem(
                        value: ' 3.5 के.जी', child: Text('5 के.जी')),
                    DropdownMenuItem(value: ' 4 के.जी', child: Text('4 के.जी')),
                    DropdownMenuItem(value: ' 5 के.जी', child: Text('5 के.जी')),
                    DropdownMenuItem(
                        value: ' 5.5 के.जी', child: Text('5.5 के.जी')),
                    DropdownMenuItem(
                        value: '6 के.जी ठूलो माछाभन्दा',
                        child: Text('6 के.जी')),
                  ],
                  onChanged: (value) {
                    totalWeightUnit = value ?? 'kg';
                  },
                ),
                UiHelper.verticalSpacing(15.h),
                RichText(
                  text: TextSpan(
                      text: translation(context).total_weight,
                      //  text: 'Total weight',
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
                  validator: (value) => Validator.validateEmpty(value),
                  textEditingController: _totalWeightController,
                  label: "(kg)",
                  //'Farm\'s Name',
                  contentPadding: EdgeInsets.only(left: 15.w),
                ),

  AppDropDown<String>(
                            value: selectedPradesh,
                            isExpanded: true,
                            items: state.provinceResponse
                                    ?.map((e) => DropdownMenuItem(
                                        value: e.id,
                                        child: Text(e.englishName!)))
                                    .toList() ??
                                [],
                            onChanged: (value) {
                              selectedPradesh = value;
                              setState(() {});

                              BlocProvider.of<FishFarmerDetailBloc>(context)
                                  .add(GetDistrict(
                                      provinceId: selectedPradesh ?? '1'));
                            },
                          ),
                // AppDropDown(
                //   isExpanded: true,
                //   defaultText: 'Kg',
                //   items: const [
                //     DropdownMenuItem(value: 'kg', child: Text('kg')),
                //     DropdownMenuItem(value: 'gram', child: Text('gram')),
                //   ],
                //   onChanged: (value) {
                //     totalWeightUnit = value ?? 'kg';
                //   },
                // ),

                // Row(
                //   children: [
                //     // FishTextField(
                //     //   validator: (value) => Validator.validateEmpty(value),
                //     //   textEditingController: _totalWeightController,
                //     //   label: '',
                //     //   width: 186.w,
                //     //   textInputType:
                //     //       const TextInputType.numberWithOptions(decimal: true),
                //     // ),
                //     UiHelper.horizontalSpacing(10.w),
                //     AppDropDown(
                //       defaultText: 'Kg',
                //       items: const [
                //         DropdownMenuItem(value: 'kg', child: Text('kg')),
                //         DropdownMenuItem(value: 'gram', child: Text('gram')),
                //       ],
                //       onChanged: (value) {
                //         totalWeightUnit = value ?? 'kg';
                //       },
                //     )
                //   ],
                // ),
                UiHelper.verticalSpacing(15.h),
                RichText(
                  text: TextSpan(
                      text: translation(context).yield_date,
                      //'Yeild Date',
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
      translation(context).fish_yields_details,
      // 'Fill the details for your yields',
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
