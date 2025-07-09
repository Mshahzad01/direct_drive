import 'package:direct_drive/src/constant/app_color.dart';
import 'package:direct_drive/src/constant/asset_string.dart';
import 'package:direct_drive/src/constant/text_style.dart';

import 'package:direct_drive/src/feature/booking/model/booking_model.dart';
import 'package:direct_drive/src/feature/booking/widget/booking_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BookingsScreen extends StatelessWidget {
  const BookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          centerTitle: false,
          title: Text("My Bookings", style: mytextsytle.titleLarge),
          backgroundColor: Colors.white,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.add),
              color: MyColors.primaryColor,
              iconSize: 30,
            ),

            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                AssetString.search,
                color: MyColors.primaryColor,
                height: 25,
                width: 25,
              ),
            ),

            const SizedBox(width: 12),
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: Padding(
              padding: EdgeInsets.only(bottom: 10, left: 20, right: 20),
              child: TabBar(
                labelColor: MyColors.primaryColor,
                unselectedLabelColor: Colors.grey,
                indicatorColor: MyColors.primaryColor,
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(
                    width: 2.0,
                    color: MyColors.primaryColor,
                  ),
                  insets: EdgeInsets.symmetric(horizontal: 18.0),
                ),
                
        
                tabs: [
                  Tab(text: "Completed"),
                  Tab(text: "Confirmed"),
                  Tab(text: "Cancelled"),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            BookingList(bookings: dummyBookings),
            Center(child: Text("No Confirmed Bookings")),
            Center(child: Text("No Cancelled Bookings")),
          ],
        ),
      ),
    );
  }
}

