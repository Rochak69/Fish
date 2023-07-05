import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;
  List screens = [
    // const ChooseNumberListView(),
    // const Messages(),
    // const ShowHelpView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          fixedColor: Colors.black,
          backgroundColor: Colors.black,

          unselectedLabelStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w300,
            //  color: AppColors.appTextWhite,
          ),
          items: <BottomNavigationBarItem>[
            _selectedIndex == 0
                ? const BottomNavigationBarItem(
                    backgroundColor: Colors.black,
                    icon: Icon(CupertinoIcons.home),
                    label: 'Dashboard',
                  )
                : const BottomNavigationBarItem(
                    backgroundColor: Colors.white,
                    icon: Icon(CupertinoIcons.home),
                    label: 'Dashboard',
                  ),
            _selectedIndex == 1
                ? const BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.folder),
                    label: 'Documents',
                  )
                : const BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.folder),
                    label: 'Documents',
                  ),
            _selectedIndex == 2
                ? const BottomNavigationBarItem(
                    //backgroundColor: Colors.white,
                    icon: Icon(CupertinoIcons.bell),
                    label: 'bell',
                  )
                : const BottomNavigationBarItem(
                    // backgroundColor: Colors.white,
                    icon: Icon(CupertinoIcons.bell),
                    label: 'bell',
                  ),
            _selectedIndex == 3
                ? const BottomNavigationBarItem(
                    //backgroundColor: Colors.white,
                    icon: Icon(CupertinoIcons.person),
                    label: '',
                  )
                : const BottomNavigationBarItem(
                    // backgroundColor: Colors.white,
                    icon: Icon(CupertinoIcons.person),
                    label: '',
                  ),
          ],
          currentIndex: _selectedIndex, //New
          onTap: _onItemTapped,
        ),
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 40,
            ),
            Center(
              child: _buildUpperAppBar(),
            ),
            const SizedBox(
              height: 30,
            ),
            _buildPendingRequestContainer(),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Your Yields',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Table(
                border: TableBorder.all(color: Colors.white),
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: [
                  const TableRow(
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                      ),
                      children: [
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Text('Fish'),
                          ),
                        ),
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Text('Quantity Remaining'),
                          ),
                        ),
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Text('Expires on'),
                          ),
                        )
                      ]),
                  ...List.generate(
                      3,
                      (index) => const TableRow(children: [
                            TableCell(
                                verticalAlignment:
                                    TableCellVerticalAlignment.middle,
                                child: Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Text('Carp'))),
                            TableCell(
                                verticalAlignment:
                                    TableCellVerticalAlignment.middle,
                                child: Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Text('10 Kg'))),
                            TableCell(
                                verticalAlignment:
                                    TableCellVerticalAlignment.middle,
                                child: Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Text('5 days')))
                          ]))
                ]),
          ],
        ),
      ),
    );
  }

  _buildPendingRequestContainer() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: 350,
      height: 100,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blueAccent),
        borderRadius: BorderRadius.circular(5),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'You have \n Pending requests',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            '5',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  _buildButtonsRow() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 100,
            height: 40,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                side: const BorderSide(
                  width: 0.5,
                  color: Colors.blue,
                ),
                shape: const RoundedRectangleBorder(),
                backgroundColor: Colors.green,
              ),
              onPressed: () {},

              //  signIn,
              child: const Text('Accept',
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
          ),
          SizedBox(
            width: 100,
            height: 40,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 10,
                side: const BorderSide(
                  width: 0.5,
                  color: Colors.blue,
                ),
                shape: const RoundedRectangleBorder(),
                backgroundColor: Colors.red,
              ),
              onPressed: () {},

              //  signIn,
              child: const Text('Reject',
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }

  _buildUpperAppBar() {
    return const Center(
        child: Text(
      'Fisher',
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
      ),
    ));
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
