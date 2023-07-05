import 'package:fish_shop/res/colors.dart';
import 'package:fish_shop/ui/home_listing/bloc/home_listings_bloc.dart';
import 'package:fish_shop/ui/home_listing/bloc/home_listings_event.dart';
import 'package:fish_shop/ui/home_listing/bloc/home_listings_state.dart';
import 'package:fish_shop/ui/home_listing/listing.dart';
import 'package:fish_shop/ui/order%20history/order_history.dart';
import 'package:fish_shop/ui/support/support.dart';
import 'package:fish_shop/ui/yield_farm/yield_farm.dart';
import 'package:fish_shop/ui/your_listing/your_listing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeListing extends StatefulWidget {
  const HomeListing({Key? key}) : super(key: key);

  @override
  State<HomeListing> createState() => _HomeListingState();
}

class _HomeListingState extends State<HomeListing>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  int _selectedIndex = 0;
  List<Widget> screens = [
    const Listings(),
    const YourListings(),
    const OrderHistory(),
    const Support(),
    const YieldForm()
  ];

  @override
  void initState() {
    BlocProvider.of<HomeListingsBloc>(context).add(GetHomeListings());

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeIn,
      ),
    );

    Future.delayed(const Duration(milliseconds: 500), () {
      _animationController.forward();
    });

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeListingsBloc, HomeListingsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: SafeArea(
            child: Scaffold(
              body: FadeTransition(
                opacity: _animation,
                child: IndexedStack(
                  index: _selectedIndex,
                  children: screens,
                ),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  setState(() {
                    _selectedIndex = 4;
                  });
                },
                child: const Icon(Icons.add),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerFloat,
              bottomNavigationBar: Container(
                padding: EdgeInsets.symmetric(vertical: 6.h),
                height: 56.h,
                width: double.infinity,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildBottomNavigationBarItem(
                      'Home',
                      'assets/bottom_navigation_bar/home.png',
                      'assets/bottom_navigation_bar/home.png',
                      0,
                    ),
                    _buildBottomNavigationBarItem(
                      'Requests',
                      'assets/bottom_navigation_bar/requests.png',
                      'assets/bottom_navigation_bar/requests.png',
                      1,
                    ),
                    _buildBottomNavigationBarItem(
                      'Listing',
                      'assets/bottom_navigation_bar/tasks.png',
                      'assets/bottom_navigation_bar/tasks.png',
                      2,
                    ),
                    _buildBottomNavigationBarItem(
                      'Support',
                      'assets/bottom_navigation_bar/user.png',
                      'assets/bottom_navigation_bar/user.png',
                      3,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildBottomNavigationBarItem(
    String label,
    String selectedIconPath,
    String unselectedIconPath,
    int index,
  ) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
        _animationController.forward(from: 0.0);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            selectedIconPath,
            color: _selectedIndex == index ? AppColors.textColor : null,
          ),
          Text(
            label,
            style: TextStyle(
              color: _selectedIndex == index ? AppColors.textColor : null,
              fontSize: 10.sp,
            ),
          )
        ],
      ),
    );
  }
}
