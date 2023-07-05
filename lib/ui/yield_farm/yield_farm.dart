import 'package:fish_shop/res/colors.dart';
import 'package:fish_shop/ui/common_widget/FishTextField.dart';
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
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildUpperText(context),
                  const Text(
                    'Type of fish',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 12),
                  ),
                  UiHelper.verticalSpacing(5),
                  FishTextField(
                    textEditingController: _fishTypeController,
                    contentPadding: EdgeInsets.only(left: 15.w),
                    label: '',
                  ),
                  UiHelper.verticalSpacing(15),
                  const Text(
                    'Weight per fish',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 12),
                  ),
                  UiHelper.verticalSpacing(5),
                  Row(
                    children: [
                      FishTextField(
                        textInputType: const TextInputType.numberWithOptions(
                            decimal: true),
                        textEditingController: _weightPerFishController,
                        label: '',
                        width: 186.w,
                      ),
                      UiHelper.horizontalSpacing(10.w),
                      FishTextField(
                        isReadOnly: true,
                        label: 'Kg',
                        width: 80.w,
                      ),
                    ],
                  ),
                  UiHelper.verticalSpacing(15),
                  Container(
                    padding: const EdgeInsets.only(right: 235),
                    child: const Text(
                      'Total Yield Weight',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 12),
                    ),
                  ),
                  UiHelper.verticalSpacing(5),
                  Row(
                    children: [
                      FishTextField(
                        textEditingController: _totalWeightController,
                        label: '',
                        width: 186.w,
                        textInputType: const TextInputType.numberWithOptions(
                            decimal: true),
                      ),
                      UiHelper.horizontalSpacing(10.w),
                      FishTextField(
                        isReadOnly: true,
                        label: 'kg',
                        width: 80.w,
                      ),
                    ],
                  ),
                  UiHelper.verticalSpacing(15),
                  Text(
                    'Yield Date',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 12.sp),
                  ),
                  FishTextField(
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
                                    totalWeight: double.parse(
                                        _totalWeightController.text),
                                    yieldDate: date.toString()));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors
                                .blue, // Set the button's background color
                          ),
                          child: const Text(
                            '+ Add to Listing',
                            style: TextStyle(fontSize: 12, color: Colors.white),
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
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 15.w, top: 60.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios)),
              UiHelper.horizontalSpacing(80.w),
              const Text(
                'Yield Farm',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                    fontSize: 16),
              ),
            ],
          ),
        ),
        UiHelper.verticalSpacing(16.h),
        Row(
          children: [
            Container(
              padding: const EdgeInsets.only(
                left: 24.0,
              ),
              child: const Text(
                'Fill the details for your yields',
                style: TextStyle(
                  color: AppColors.secondaryTextColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
        UiHelper.verticalSpacing(24),
      ],
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
