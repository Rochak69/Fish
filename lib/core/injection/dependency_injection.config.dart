// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../providers/api_client.dart' as _i8;
import '../../ui/contact/bloc/contact_bloc.dart' as _i10;
import '../../ui/contact/repository/contact_api_client.dart' as _i9;
import '../../ui/fisher_farm_details/bloc/fish_farmer_detail_bloc.dart' as _i12;
import '../../ui/fisher_farm_details/repository/fish_farmer_detail_api_client.dart'
    as _i11;
import '../../ui/forgot_password/bloc/send_otp_bloc.dart' as _i26;
import '../../ui/forgot_password/repository/send_otp_api_client.dart' as _i25;
import '../../ui/home_listing/bloc/home_listings_bloc.dart' as _i14;
import '../../ui/home_listing/repository/home_listings_api_client.dart' as _i13;
import '../../ui/login/bloc/login_bloc.dart' as _i16;
import '../../ui/login/repository/login_api_client.dart' as _i15;
import '../../ui/my_language/bloc/my_language_bloc.dart' as _i5;
import '../../ui/order_history/bloc/order_history_bloc.dart' as _i18;
import '../../ui/order_history/repository/order_history_api_client.dart'
    as _i17;
import '../../ui/pending_request_per_listing/bloc/pending_request_per_listing_bloc.dart'
    as _i20;
import '../../ui/pending_request_per_listing/repository/pending_request_listings_api_client.dart'
    as _i19;
import '../../ui/register/bloc/register_bloc.dart' as _i22;
import '../../ui/register/repository/register_api_client.dart' as _i21;
import '../../ui/reset_password/bloc/reset_password_bloc.dart' as _i24;
import '../../ui/reset_password/repository/reset_password_api_client.dart'
    as _i23;
import '../../ui/support/bloc/support_bloc.dart' as _i28;
import '../../ui/support/repository/support_api_client.dart' as _i27;
import '../../ui/user_details/repository/user_details_api_client.dart' as _i29;
import '../../ui/utils/preferences.dart' as _i7;
import '../../ui/verify_otp/bloc/verify_otp_bloc.dart' as _i31;
import '../../ui/verify_otp/repository/verify_otp_api_client.dart' as _i30;
import '../../ui/yield_farm/bloc/yeild_form_bloc.dart' as _i33;
import '../../ui/yield_farm/repository/yeild_form_api_client.dart' as _i32;
import '../../ui/your_listing/bloc/your_listing_bloc.dart' as _i35;
import '../../ui/your_listing/repository/your_listing_api_client.dart' as _i34;
import '../notification/notification_services.dart' as _i6;
import 'dependency_injection.dart' as _i36;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final getModule = _$GetModule();
    gh.factory<_i3.Dio>(() => getModule.connectivity);
    await gh.factoryAsync<_i4.FlutterSecureStorage>(
      () => getModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i5.MyLanguageBloc>(() => _i5.MyLanguageBloc());
    gh.singleton<_i6.NotificationServices>(_i6.NotificationServices());
    gh.factory<_i7.Preferences>(() => _i7.Preferences());
    gh.factory<_i8.ApiClient>(() => _i8.ApiClient(
          gh<_i3.Dio>(),
          gh<_i7.Preferences>(),
        ));
    gh.singleton<_i9.ContactApiClient>(
        _i9.ContactApiClient(gh<_i8.ApiClient>()));
    gh.factory<_i10.ContactBloc>(
        () => _i10.ContactBloc(gh<_i9.ContactApiClient>()));
    gh.singleton<_i11.FishFarmerDetailApiClient>(
        _i11.FishFarmerDetailApiClient(gh<_i8.ApiClient>()));
    gh.factory<_i12.FishFarmerDetailBloc>(
        () => _i12.FishFarmerDetailBloc(gh<_i11.FishFarmerDetailApiClient>()));
    gh.singleton<_i13.HomeListingApiClient>(
        _i13.HomeListingApiClient(gh<_i8.ApiClient>()));
    gh.lazySingleton<_i14.HomeListingsBloc>(
        () => _i14.HomeListingsBloc(gh<_i13.HomeListingApiClient>()));
    gh.singleton<_i15.LoginApiClient>(_i15.LoginApiClient(gh<_i8.ApiClient>()));
    gh.factory<_i16.LoginBloc>(() => _i16.LoginBloc(
          gh<_i15.LoginApiClient>(),
          gh<_i13.HomeListingApiClient>(),
        ));
    gh.singleton<_i17.OrderHistoryApiClient>(
        _i17.OrderHistoryApiClient(gh<_i8.ApiClient>()));
    gh.lazySingleton<_i18.OrderHistoryBloc>(
        () => _i18.OrderHistoryBloc(gh<_i17.OrderHistoryApiClient>()));
    gh.singleton<_i19.PendingRequestPerListingApiClient>(
        _i19.PendingRequestPerListingApiClient(gh<_i8.ApiClient>()));
    gh.lazySingleton<_i20.PendingRequestPerListingBloc>(() =>
        _i20.PendingRequestPerListingBloc(
            gh<_i19.PendingRequestPerListingApiClient>()));
    gh.singleton<_i21.RegisterApiClient>(
        _i21.RegisterApiClient(gh<_i8.ApiClient>()));
    gh.factory<_i22.RegisterBloc>(
        () => _i22.RegisterBloc(gh<_i21.RegisterApiClient>()));
    gh.singleton<_i23.ResetPasswordApiClient>(
        _i23.ResetPasswordApiClient(gh<_i8.ApiClient>()));
    gh.factory<_i24.ResetPasswordBloc>(
        () => _i24.ResetPasswordBloc(gh<_i23.ResetPasswordApiClient>()));
    gh.singleton<_i25.SendOtpApiClient>(
        _i25.SendOtpApiClient(gh<_i8.ApiClient>()));
    gh.factory<_i26.SendOtpBloc>(
        () => _i26.SendOtpBloc(gh<_i25.SendOtpApiClient>()));
    gh.singleton<_i27.SupportApiClient>(
        _i27.SupportApiClient(gh<_i8.ApiClient>()));
    gh.factory<_i28.SupportBloc>(
        () => _i28.SupportBloc(gh<_i27.SupportApiClient>()));
    gh.singleton<_i29.UserDetailsApiClient>(
        _i29.UserDetailsApiClient(gh<_i8.ApiClient>()));
    gh.singleton<_i30.VerifyOtpApiClient>(
        _i30.VerifyOtpApiClient(gh<_i8.ApiClient>()));
    gh.factory<_i31.VerifyOtpBloc>(
        () => _i31.VerifyOtpBloc(gh<_i30.VerifyOtpApiClient>()));
    gh.singleton<_i32.YeildFormApiClient>(
        _i32.YeildFormApiClient(gh<_i8.ApiClient>()));
    gh.lazySingleton<_i33.YeildFormBloc>(
        () => _i33.YeildFormBloc(gh<_i32.YeildFormApiClient>()));
    gh.singleton<_i34.YourListingApiClient>(
        _i34.YourListingApiClient(gh<_i8.ApiClient>()));
    gh.lazySingleton<_i35.YourListingBloc>(
        () => _i35.YourListingBloc(gh<_i34.YourListingApiClient>()));
    return this;
  }
}

class _$GetModule extends _i36.GetModule {}
