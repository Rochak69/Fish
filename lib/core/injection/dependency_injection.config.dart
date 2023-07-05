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

import '../../providers/api_client.dart' as _i7;
import '../../ui/fisher_farm_details/bloc/fish_farmer_detail_bloc.dart' as _i9;
import '../../ui/fisher_farm_details/repository/fish_farmer_detail_api_client.dart'
    as _i8;
import '../../ui/forgot_password/bloc/send_otp_bloc.dart' as _i23;
import '../../ui/forgot_password/repository/send_otp_api_client.dart' as _i22;
import '../../ui/home_listing/bloc/home_listings_bloc.dart' as _i11;
import '../../ui/home_listing/repository/home_listings_api_client.dart' as _i10;
import '../../ui/login/bloc/login_bloc.dart' as _i13;
import '../../ui/login/repository/login_api_client.dart' as _i12;
import '../../ui/order%20history/bloc/order_history_bloc.dart' as _i15;
import '../../ui/order%20history/repository/order_history_api_client.dart'
    as _i14;
import '../../ui/pending%20request%20per%20listing/bloc/pending_request_per_listing_bloc.dart'
    as _i17;
import '../../ui/pending%20request%20per%20listing/repository/pending_request_listings_api_client.dart'
    as _i16;
import '../../ui/register/bloc/register_bloc.dart' as _i19;
import '../../ui/register/repository/register_api_client.dart' as _i18;
import '../../ui/reset_password/bloc/reset_password_bloc.dart' as _i21;
import '../../ui/reset_password/repository/reset_password_api_client.dart'
    as _i20;
import '../../ui/user_details/repository/user_details_api_client.dart' as _i24;
import '../../ui/utils/preferences.dart' as _i6;
import '../../ui/verify_otp/bloc/verify_otp_bloc.dart' as _i26;
import '../../ui/verify_otp/repository/verify_otp_api_client.dart' as _i25;
import '../../ui/yield_farm/bloc/yeild_form_bloc.dart' as _i28;
import '../../ui/yield_farm/repository/yeild_form_api_client.dart' as _i27;
import '../../ui/your_listing/bloc/your_listing_bloc.dart' as _i30;
import '../../ui/your_listing/repository/your_listing_api_client.dart' as _i29;
import '../notification/notification_services.dart' as _i5;
import 'dependency_injection.dart' as _i31;

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
    gh.singleton<_i5.NotificationServices>(_i5.NotificationServices());
    gh.factory<_i6.Preferences>(() => _i6.Preferences());
    gh.factory<_i7.ApiClient>(() => _i7.ApiClient(
          gh<_i3.Dio>(),
          gh<_i6.Preferences>(),
        ));
    gh.singleton<_i8.FishFarmerDetailApiClient>(
        _i8.FishFarmerDetailApiClient(gh<_i7.ApiClient>()));
    gh.factory<_i9.FishFarmerDetailBloc>(
        () => _i9.FishFarmerDetailBloc(gh<_i8.FishFarmerDetailApiClient>()));
    gh.singleton<_i10.HomeListingApiClient>(
        _i10.HomeListingApiClient(gh<_i7.ApiClient>()));
    gh.lazySingleton<_i11.HomeListingsBloc>(
        () => _i11.HomeListingsBloc(gh<_i10.HomeListingApiClient>()));
    gh.singleton<_i12.LoginApiClient>(_i12.LoginApiClient(gh<_i7.ApiClient>()));
    gh.factory<_i13.LoginBloc>(() => _i13.LoginBloc(gh<_i12.LoginApiClient>()));
    gh.singleton<_i14.OrderHistoryApiClient>(
        _i14.OrderHistoryApiClient(gh<_i7.ApiClient>()));
    gh.lazySingleton<_i15.OrderHistoryBloc>(
        () => _i15.OrderHistoryBloc(gh<_i14.OrderHistoryApiClient>()));
    gh.singleton<_i16.PendingRequestPerListingApiClient>(
        _i16.PendingRequestPerListingApiClient(gh<_i7.ApiClient>()));
    gh.lazySingleton<_i17.PendingRequestPerListingBloc>(() =>
        _i17.PendingRequestPerListingBloc(
            gh<_i16.PendingRequestPerListingApiClient>()));
    gh.singleton<_i18.RegisterApiClient>(
        _i18.RegisterApiClient(gh<_i7.ApiClient>()));
    gh.factory<_i19.RegisterBloc>(
        () => _i19.RegisterBloc(gh<_i18.RegisterApiClient>()));
    gh.singleton<_i20.ResetPasswordApiClient>(
        _i20.ResetPasswordApiClient(gh<_i7.ApiClient>()));
    gh.factory<_i21.ResetPasswordBloc>(
        () => _i21.ResetPasswordBloc(gh<_i20.ResetPasswordApiClient>()));
    gh.singleton<_i22.SendOtpApiClient>(
        _i22.SendOtpApiClient(gh<_i7.ApiClient>()));
    gh.factory<_i23.SendOtpBloc>(
        () => _i23.SendOtpBloc(gh<_i22.SendOtpApiClient>()));
    gh.singleton<_i24.UserDetailsApiClient>(
        _i24.UserDetailsApiClient(gh<_i7.ApiClient>()));
    gh.singleton<_i25.VerifyOtpApiClient>(
        _i25.VerifyOtpApiClient(gh<_i7.ApiClient>()));
    gh.factory<_i26.VerifyOtpBloc>(
        () => _i26.VerifyOtpBloc(gh<_i25.VerifyOtpApiClient>()));
    gh.singleton<_i27.YeildFormApiClient>(
        _i27.YeildFormApiClient(gh<_i7.ApiClient>()));
    gh.lazySingleton<_i28.YeildFormBloc>(
        () => _i28.YeildFormBloc(gh<_i27.YeildFormApiClient>()));
    gh.singleton<_i29.YourListingApiClient>(
        _i29.YourListingApiClient(gh<_i7.ApiClient>()));
    gh.lazySingleton<_i30.YourListingBloc>(
        () => _i30.YourListingBloc(gh<_i29.YourListingApiClient>()));
    return this;
  }
}

class _$GetModule extends _i31.GetModule {}
