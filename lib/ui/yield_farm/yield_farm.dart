import 'package:fish_shop/common/validator.dart';
import 'package:fish_shop/res/colors.dart';
import 'package:fish_shop/ui/common_widget/FishTextField.dart';
import 'package:fish_shop/ui/common_widget/app_dropdown.dart';
import 'package:fish_shop/ui/home_listing/bloc/home_listings_bloc.dart';
import 'package:fish_shop/ui/home_listing/bloc/home_listings_state.dart';
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
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _edControllerDate = TextEditingController();

  final TextEditingController _totalWeightController = TextEditingController();
  final TextEditingController _weightPerFishController =
      TextEditingController();
  String? selectedFish;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<YeildFormBloc, YeildFormState>(
      listener: (context, state) {
        Navigator.pop(context);
        if (state is YeildFormSuccess) {
          displayToastMessage('Successfully created');
          BlocProvider.of<YourListingBloc>(context).add(GetMyListings());
        } else if (state is YeildFormFailed) {
          displayToastMessage(state.errorMessage);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          centerTitle: true,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.textColor,
                )),
          ),
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
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildUpperText(context),
                  UiHelper.verticalSpacing(10.h),
                  RichText(
                    text: TextSpan(
                        text: translation(context).fish_type,
                        //'Type of fish',
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
                  BlocBuilder<HomeListingsBloc, HomeListingsState>(
                    builder: (context, state) {
                      if (state is HomeListingsSuccess) {
                        return AppDropDown<String>(
                            isExpanded: true,
                            value: selectedFish,
                            onChanged: (p0) {
                              selectedFish = p0;
                              setState(() {});
                            },
                            items: state.fishes.data
                                    ?.map((e) => DropdownMenuItem(
                                        value: e.id,
                                        child: Text(e.name ?? 'Null')))
                                    .toList() ??
                                []);
                      }
                      return AppDropDown<String>(
                          isExpanded: true,
                          value: selectedFish,
                          onChanged: (p0) {
                            selectedFish = p0;
                            setState(() {});
                          },
                          items: []);
                    },
                  ),
                  UiHelper.verticalSpacing(15),
                  RichText(
                    text: TextSpan(
                        text: translation(context).per_fish_weight,
                        //'Weight per fish',
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
                        validator: (value) => Validators.validateEmpty(value),
                        textInputType: const TextInputType.numberWithOptions(
                            decimal: true),
                        textEditingController: _weightPerFishController,
                        label: '',
                        width: 186.w,
                      ),
                      UiHelper.horizontalSpacing(10.w),
                      AppDropDown(
                        value: avgUnit,
                        items: const [
                          DropdownMenuItem(value: 'kg', child: Text('kg')),
                          DropdownMenuItem(value: 'gram', child: Text('gram')),
                        ],
                        onChanged: (value) {
                          avgUnit = value ?? 'kg';
                          setState(() {});
                        },
                      )
                    ],
                  ),
                  UiHelper.verticalSpacing(15.h),
                  RichText(
                    text: TextSpan(
                        text: translation(context).pond_total_quantity,
                        //'Total weight',
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
                        validator: (value) => Validators.validateEmpty(value),
                        textEditingController: _totalWeightController,
                        label: '',
                        width: 186.w,
                        textInputType: const TextInputType.numberWithOptions(
                            decimal: true),
                      ),
                      UiHelper.horizontalSpacing(10.w),
                      AppDropDown(
                        value: totalWeightUnit,
                        items: const [
                          DropdownMenuItem(value: 'kg', child: Text('kg')),
                          DropdownMenuItem(value: 'gram', child: Text('gram')),
                        ],
                        onChanged: (value) {
                          totalWeightUnit = value ?? 'kg';
                          setState(() {});
                        },
                      )
                    ],
                  ),
                  UiHelper.verticalSpacing(15.h),
                  RichText(
                    text: TextSpan(
                        text: translation(context).pond_fish_date,
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
                            if (date == null) {
                              displayToastMessage('Please pick a date');
                              return;
                            }
                            if (selectedFish == null) {
                              displayToastMessage('Please select a fish',
                                  backgroundColor: AppColors.textRedColor);
                              return;
                            }

                            if (_formKey.currentState!.validate()) {
                              showLoaderDialog(context);
                              BlocProvider.of<YeildFormBloc>(context).add(
                                  PostYeildForm(
                                      avgFishWeight: getWeightInKg(
                                          double.parse(
                                              _weightPerFishController.text),
                                          avgUnit),
                                      fishType: selectedFish ?? '0',
                                      totalWeight: getWeightInKg(
                                          double.parse(
                                              _totalWeightController.text),
                                          totalWeightUnit),
                                      yieldDate: date.toString()));
                            }
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

getWeightInKg(double weight, String givenWeight) {
  if (givenWeight == 'gram') {
    return weight / 1000;
  } else {
    return weight;
  }
}
