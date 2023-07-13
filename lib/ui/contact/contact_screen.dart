import 'package:fish_shop/res/colors.dart';
import 'package:fish_shop/ui/contact/bloc/contact_bloc.dart';
import 'package:fish_shop/ui/contact/bloc/contact_state.dart';
import 'package:fish_shop/ui/utils/endpoints.dart';
import 'package:fish_shop/ui/utils/uihelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'सम्पर्क',
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w900,
              fontSize: 18.sp),
        ),
      ),
      body: BlocBuilder<ContactBloc, ContactState>(
        builder: (context, state) {
          if (state is ContactSuccess) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                UiHelper.verticalSpacing(30.h),
                state.contact?.photo == null
                    ? UiHelper.verticalSpacing(50.h)
                    : SizedBox(
                        height: 50.h,
                        child: Image.network(
                            Endpoints.baseFile + state.contact!.photo!)),
                UiHelper.verticalSpacing(10.h),
                Text(
                  state.contact?.name ?? '',
                  style: TextStyle(fontSize: 18.sp, color: AppColors.textColor),
                ),
                UiHelper.verticalSpacing(10.h),
                Text(
                  state.contact?.position ?? '',
                  style: TextStyle(fontSize: 18.sp, color: AppColors.textColor),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Contact number : ',
                      style: TextStyle(
                          fontSize: 18.sp, color: AppColors.textColor),
                    ),
                    Text(
                      state.contact?.contact ?? '',
                      style: TextStyle(
                          color: AppColors.textRedColor,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700),
                    )
                  ],
                ),
                UiHelper.verticalSpacing(50.h),
              ],
            );
          }
          return Column(
            children: [
              UiHelper.verticalSpacing(30.h),
            ],
          );
        },
      ),
    );
  }
}
