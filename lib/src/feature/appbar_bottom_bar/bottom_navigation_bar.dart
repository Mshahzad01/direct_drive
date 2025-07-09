

import 'package:direct_drive/src/constant/app_color.dart';
import 'package:direct_drive/src/constant/asset_string.dart';
import 'package:direct_drive/src/feature/appbar_bottom_bar/widget/appbar_widget.dart';
import 'package:direct_drive/src/feature/booking/screen/bookin_screen.dart';
import 'package:direct_drive/src/feature/home/screen/home_screen.dart';
import 'package:direct_drive/src/feature/my_driver/screen/my_dreiver.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppbarBottombar extends StatefulWidget {
  const AppbarBottombar({super.key});

  @override
  State<AppbarBottombar> createState() => _AppbarBottombarState();
}

class _AppbarBottombarState extends State<AppbarBottombar> {

    int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    BookingsScreen(),
      Center(child: Text("Search")),
  //  MyDreiver(),
      Center(child: Text("Search")),
    Center(child: Text("Profile")),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         backgroundColor:  Colors.grey,
       //  appBar: UserAppBar(),
         body: _pages[_selectedIndex],
  
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, 
        onTap: _onItemTapped,
        selectedItemColor: MyColors.primaryColor, 
        unselectedItemColor: Colors.grey, 
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AssetString.home),
            activeIcon:SvgPicture.asset(AssetString.homefill,color: MyColors.primaryColor,) , 
            label: 'Home',
          ),
              BottomNavigationBarItem(
            icon: SvgPicture.asset(AssetString.booking),
            activeIcon:SvgPicture.asset(AssetString.bookingfill,color: MyColors.primaryColor,) , 
            label: 'booking',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AssetString.driver),
            activeIcon:SvgPicture.asset(AssetString.driverfill,color: MyColors.primaryColor,) , 
            label: 'Drivers',
          ),
           BottomNavigationBarItem(
             icon: SvgPicture.asset(AssetString.message),
            activeIcon:SvgPicture.asset(AssetString.messagefill,color: MyColors.primaryColor,) , 
            label: 'Message',
          ),
             BottomNavigationBarItem(
             icon: SvgPicture.asset(AssetString.menue),
            activeIcon:SvgPicture.asset(AssetString.menuefill,color: MyColors.primaryColor,) , 
            label: 'Menu',
          ),
       
        ],
      ),
    );
  }
}