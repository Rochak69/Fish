import 'package:fish_shop/ui/home_listing/bloc/home_listings_bloc.dart';
import 'package:fish_shop/ui/home_listing/bloc/home_listings_event.dart';
import 'package:fish_shop/ui/home_listing/bloc/home_listings_state.dart';
import 'package:fish_shop/ui/home_listing/listing.dart';
import 'package:fish_shop/ui/pending%20request%20per%20listing/pending_request_per_listing.dart';
import 'package:fish_shop/ui/support/support.dart';
import 'package:fish_shop/ui/yield_farm/yield_farm.dart';
import 'package:fish_shop/ui/your_listing/your_listing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../order history/order_history.dart';

class HomeListing extends StatefulWidget {
  const HomeListing({Key? key}) : super(key: key);

  @override
  State<HomeListing> createState() => _HomeListingState();
}

class _HomeListingState extends State<HomeListing> {
  int _selectedIndex = 0;
  List<Widget> screens = [
    const Listings(), //done
    const PendingRequestPerListing(),
    const OrderHistory(),
    const YourListings(),
    const Support(),
    //const YieldForm(),
    // const Messages(),
    // const ShowHelpView(),
  ];
  @override
  void initState() {
    BlocProvider.of<HomeListingsBloc>(context).add(GetHomeListings());

    super.initState();
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
              bottomNavigationBar: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0),
                ),
                child: BottomNavigationBar(
                  landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
                  // fixedColor: AppColors.colorWhite,
                  backgroundColor: Colors.white,
                  unselectedLabelStyle: GoogleFonts.inter(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    //  color: AppColors.appTextWhite,
                  ),
                  items: <BottomNavigationBarItem>[
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
                      'Orders',
                      'assets/bottom_navigation_bar/tasks.png',
                      'assets/bottom_navigation_bar/tasks.png',
                      2,
                    ),
                    _buildBottomNavigationBarItem(
                      'Listing',
                      'assets/bottom_navigation_bar/tasks.png',
                      'assets/bottom_navigation_bar/tasks.png',
                      3,
                    ),
                    _buildBottomNavigationBarItem(
                      'Support',
                      'assets/bottom_navigation_bar/user.png',
                      'assets/bottom_navigation_bar/user.png',
                      3,
                    ),
                  ],
                  currentIndex: _selectedIndex,
                  onTap: _onItemTapped,
                ),
              ),
              body: screens[_selectedIndex],
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const YieldForm()),
                  );
                },
                child: const Icon(Icons.add),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerFloat,
            ),
          ),
        );
      },
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem(
    String label,
    String selectedIconPath,
    String unselectedIconPath,
    int index,
  ) {
    return BottomNavigationBarItem(
      icon: _selectedIndex == index
          ? Image.asset(selectedIconPath)
          : Image.asset(unselectedIconPath),
      label: label,
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
