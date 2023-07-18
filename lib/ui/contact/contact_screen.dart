import 'package:fish_shop/res/colors.dart';
import 'package:fish_shop/ui/contact/bloc/contact_bloc.dart';
import 'package:fish_shop/ui/contact/bloc/contact_state.dart';
import 'package:fish_shop/ui/login/login.dart';
import 'package:fish_shop/ui/utils/endpoints.dart';
import 'package:fish_shop/ui/utils/preferences.dart';
import 'package:fish_shop/ui/utils/uihelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
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
        body: Column(
          children: [
            UiHelper.verticalSpacing(30.h),
            _buildBottomText(context),
          ],
        ),
      ),
    );
  }

  _buildBottomText(BuildContext context) {
    return Column(
      children: [
        const Text(
          // translation(context).agriculture,
          'लुम्बिनी प्रदेश सरकार',
          // '  Ministry of Agriculture and Land Management ',
          style: TextStyle(
            color: AppColors.textColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Text(
          'कृषि तथा भूमि व्यवस्था मन्त्रालय',
          //      'Directorate of Livestock and Fisheries',
          style: TextStyle(
            color: AppColors.textColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 20.w),
          child: const Text(
            // translation(context).butwal,
            'पशुपन्छी तथा मत्स्य बिकास निर्देशनालय ',
            //  '  Development',
            style: TextStyle(
              color: AppColors.textRedColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const Text(
          'कृमुकाम, बुटवल',
          //      'Directorate of Livestock and Fisheries',
          style: TextStyle(
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
              style: TextStyle(
                color: AppColors.textRedColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            Row(
              children: [
                InkWell(
                  onTap: () async {
                    final Uri launchUri = Uri(
                      scheme: 'tel',
                      path: '071420434',
                    );
                    await launchUrl(launchUri);
                  },
                  child: Text(
                    '०७१४२०४३४, ',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: AppColors.textColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    final Uri launchUri = Uri(
                      scheme: 'tel',
                      path: '071420435',
                    );
                    await launchUrl(launchUri);
                  },
                  child: Text(
                    '०७१४२०४३५, ',
                    //      'Directorate of Livestock and Fisheries',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: AppColors.textColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        InkWell(
          onTap: () async {
            final Uri launchUri = Uri(
              scheme: 'tel',
              path: '071420436',
            );
            await launchUrl(launchUri);
          },
          child: Text(
            ' ०७१४२०४३६ ',
            //      'Directorate of Livestock and Fisheries',
            style: TextStyle(
              decoration: TextDecoration.underline,
              color: AppColors.textColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        InkWell(
          onTap: () async {
            final Uri launchUri = Uri(
              scheme: 'mailto',
              path: 'dolfdp5@gmail.com',
            );
            await launchUrl(launchUri);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'इमेल:    ',
                //      'Directorate of Livestock and Fisheries',
                style: TextStyle(
                  color: AppColors.textRedColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'dolfdp5@gmail.com ',
                //      'Directorate of Livestock and Fisheries',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: AppColors.textColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        UiHelper.verticalSpacing(30.h),
        SizedBox(
          width: 340.w,
          height: 48.h,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: ElevatedButton(
              onPressed: () async {
                Preferences preferences = Preferences();
                await preferences.removeAll();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const LoginPage();
                    },
                  ),
                  (route) => false,
                );
                // )
              },
              child: Text(
                'Log Out',
                style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
            ),
          ),
        ),
        // ०७१४२०४३६
      ],
    );
  }
}
