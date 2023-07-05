import 'package:fish_shop/ui/common_widget/CardListing.dart';
import 'package:fish_shop/ui/common_widget/FishTextField.dart';
import 'package:fish_shop/ui/home_listing/bloc/home_listings_bloc.dart';
import 'package:fish_shop/ui/home_listing/bloc/home_listings_state.dart';
import 'package:fish_shop/ui/settings_page/settings_page.dart';
import 'package:fish_shop/ui/utils/uihelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Listings extends StatefulWidget {
  const Listings({super.key});

  @override
  State<Listings> createState() => _ListingsState();
}

class _ListingsState extends State<Listings> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: _buildUpperText(),
    );
  }

  _buildUpperText() {
    return BlocConsumer<HomeListingsBloc, HomeListingsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is HomeListingsSuccess) {
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              centerTitle: true,
              elevation: 0,
              backgroundColor: Colors.white,
              title: Text(
                'Home',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                    fontSize: 20.sp),
              ),
              actions: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SettingsPage()));
                  },
                  child: Image.asset('assets/avatar_small.png', width: 38.w),
                ),
                UiHelper.horizontalSpacing(24.w)
              ],
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0.w),
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                UiHelper.verticalSpacing(12.h),
                FishTextField(
                  label: 'Search',
                  contentPadding: EdgeInsets.only(left: 15.w),
                  prefixIcon: const Icon(Icons.search),
                ),
                Expanded(
                  child: ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return CardListing(
                          avgWeight:
                              state.result.data?[index].avgFishWeight ?? 0,
                          date:
                              state.result.data?[index].yieldDate.toString() ??
                                  '',
                          fishName:
                              state.result.data?[index].fishType.toString() ??
                                  '',
                          totalWeight:
                              state.result.data?[index].totalWeight ?? 0,
                          location: 'Kathmandu',
                          userDemandId: state.result.data?[index].id ?? '',
                        );
                      },
                      separatorBuilder: (context, index) =>
                          UiHelper.verticalSpacing(23.h),
                      itemCount: state.result.data?.length ?? 0),
                )
              ]),
            ),
          );
        }
        return Container();
      },
    );
  }
}
