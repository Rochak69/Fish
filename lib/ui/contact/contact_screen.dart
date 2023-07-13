import 'package:fish_shop/res/colors.dart';
import 'package:fish_shop/ui/contact/bloc/contact_bloc.dart';
import 'package:fish_shop/ui/contact/bloc/contact_state.dart';
import 'package:fish_shop/ui/login/login.dart';
import 'package:fish_shop/ui/utils/endpoints.dart';
import 'package:fish_shop/ui/utils/uihelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
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
                        width: 150.w,
                        child: Image.network(
                            fit: BoxFit.fill,
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
                _buildBottomText(context),
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

  _buildBottomText(BuildContext context) {
    return Column(
      children: [
        Text(
          // translation(context).agriculture,
          'लुम्बिनी प्रदेश सरकार',
          // '  Ministry of Agriculture and Land Management ',
          style: const TextStyle(
            color: AppColors.textColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          'कृषि तथा भूमि व्यवस्था मन्त्रालय',
          //      'Directorate of Livestock and Fisheries',
          style: const TextStyle(
            color: AppColors.textColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 20.w),
          child: Text(
            // translation(context).butwal,
            'पशुपन्छी तथा मत्स्य बिकास निर्देशनालय ',
            //  '  Development',
            style: const TextStyle(
              color: AppColors.textRedColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Text(
          'कृमुकाम, बुटवल',
          //      'Directorate of Livestock and Fisheries',
          style: const TextStyle(
            color: AppColors.textRedColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'फोन नं.: ',
              //      'Directorate of Livestock and Fisheries',
              style: const TextStyle(
                color: AppColors.textRedColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              '०७१४२०४३४, ०७१४२०४३५, ',
              //      'Directorate of Livestock and Fisheries',
              style: const TextStyle(
                color: AppColors.textColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        Text(
          ' ०७१४२०४३६ ',
          //      'Directorate of Livestock and Fisheries',
          style: const TextStyle(
            color: AppColors.textColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'इमेल: ',
              //      'Directorate of Livestock and Fisheries',
              style: const TextStyle(
                color: AppColors.textRedColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              '   dolfdp5@gmail.com ',
              //      'Directorate of Livestock and Fisheries',
              style: const TextStyle(
                color: AppColors.textColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        UiHelper.verticalSpacing(20.h),
        // SizedBox(
        //   width: 340.w,
        //   height: 48.h,
        //   child: ClipRRect(
        //     borderRadius: BorderRadius.circular(12.r),
        //     child: ElevatedButton(
        //       onPressed: () {
        //         Navigator.pushAndRemoveUntil(
        //           context,
        //           MaterialPageRoute(
        //             builder: (context) {
        //               return const LoginPage();
        //             },
        //           ),
        //           (route) => false,
        //         );
        //         // )
        //       },
        //       child: Text(
        //         'Next',
        //         style: TextStyle(
        //             fontSize: 12.sp,
        //             fontWeight: FontWeight.w600,
        //             color: Colors.white),
        //       ),
        //     ),
        //   ),
        // ),
        // ०७१४२०४३६
      ],
    );
  }
}
