import 'package:fish_shop/core/injection/dependency_injection.dart';
import 'package:fish_shop/navigation_service.dart';
import 'package:fish_shop/res/colors.dart';
import 'package:fish_shop/ui/fisher_farm_details/bloc/fish_farmer_detail_bloc.dart';
import 'package:fish_shop/ui/home_listing/bloc/home_listings_bloc.dart';
import 'package:fish_shop/ui/home_listing/home_listing.dart';
import 'package:fish_shop/ui/login/bloc/login_bloc.dart';
import 'package:fish_shop/ui/my_language/bloc/my_language_bloc.dart';
import 'package:fish_shop/ui/my_language/bloc/my_language_state.dart';
import 'package:fish_shop/ui/order_history/bloc/order_history_bloc.dart';
import 'package:fish_shop/ui/pending_request_per_listing/bloc/pending_request_per_listing_bloc.dart';
import 'package:fish_shop/ui/register/bloc/register_bloc.dart';
import 'package:fish_shop/ui/reset_password/bloc/reset_password_bloc.dart';
import 'package:fish_shop/ui/support/bloc/support_bloc.dart';
import 'package:fish_shop/ui/verify_otp/bloc/verify_otp_bloc.dart';
import 'package:fish_shop/ui/yield_farm/bloc/yeild_form_bloc.dart';
import 'package:fish_shop/ui/your_listing/bloc/your_listing_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'ui/forgot_password/bloc/send_otp_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
    statusBarColor: Colors.white, // Set the status bar color to white
    statusBarIconBrightness:
        Brightness.dark, // Set the status bar icon color to dark
    statusBarBrightness:
        Brightness.dark, // Set the status bar text color to dark
  ));
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
  configureDependencies();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return MultiBlocProvider(
          providers: [
            BlocProvider<MyLanguageBloc>(
                create: (context) => sl<MyLanguageBloc>()),
            BlocProvider<RegisterBloc>(
              create: (context) => sl<RegisterBloc>(),
            ),
            BlocProvider<LoginBloc>(
              create: (context) => sl<LoginBloc>(),
            ),
            BlocProvider<ResetPasswordBloc>(
              create: (context) => sl<ResetPasswordBloc>(),
            ),
            BlocProvider<SendOtpBloc>(
              create: (context) => sl<SendOtpBloc>(),
            ),
            BlocProvider<VerifyOtpBloc>(
              create: (context) => sl<VerifyOtpBloc>(),
            ),
            BlocProvider<FishFarmerDetailBloc>(
              create: (context) => sl<FishFarmerDetailBloc>(),
            ),
            BlocProvider<YeildFormBloc>(
              create: (context) => sl<YeildFormBloc>(),
            ),
            BlocProvider<YourListingBloc>(
              create: (context) => sl<YourListingBloc>(),
            ),
            BlocProvider<HomeListingsBloc>(
              create: (context) => sl<HomeListingsBloc>(),
            ),
            BlocProvider<OrderHistoryBloc>(
              create: (context) => sl<OrderHistoryBloc>(),
            ),
            BlocProvider<PendingRequestPerListingBloc>(
              create: (context) => sl<PendingRequestPerListingBloc>(),
            ),
            BlocProvider<SupportBloc>(
              create: (context) => sl<SupportBloc>(),
            ),
          ],
          child: ScreenUtilInit(
              designSize: const Size(375, 812),
              useInheritedMediaQuery: true,
              builder: (context, child) {
                return BlocBuilder<MyLanguageBloc, MyLanguageState>(
                  builder: (context, state) {
                    return MaterialApp(
                        theme: ThemeData(
                            scaffoldBackgroundColor: Colors.white,
                            elevatedButtonTheme: ElevatedButtonThemeData(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        AppColors.textColor),
                              ),
                            )),
                        navigatorKey: NavigationService.navigatorKey,
                        debugShowCheckedModeBanner: false,
                        locale: state is EnglishState
                            ? const Locale('en')
                            : const Locale('ne'),
                        home: const HomeListing(),
                        localizationsDelegates:
                            AppLocalizations.localizationsDelegates,
                        supportedLocales: AppLocalizations.supportedLocales);
                  },
                );
              }));
    });
  }
}
