import 'package:direct_drive/src/constant/asset_string.dart';
import 'package:direct_drive/src/core/extension/context_ext._extension.dart';
import 'package:direct_drive/src/feature/appbar_bottom_bar/widget/appbar_widget.dart';

import 'package:direct_drive/src/feature/home/model/driver_model.dart';
import 'package:direct_drive/src/services/map_curent_location.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UserAppBar(),
      body: Stack(
        children: [
          WorldMapWidget(),

          SizedBox(height: 20),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Where to?",
                hintStyle: context.mytexttheme.titleMedium?.copyWith(
                  color: Colors.black,
                  fontSize: 16,
                ),
                prefixIcon: SvgPicture.asset(AssetString.search),

                border: InputBorder.none,
              ),
            ),
          ),

          Positioned(
            bottom: 05,
            left: 0,
            right: 0,

            child: Container(
              width: double.infinity,
              height: 130,
              color: Colors.white,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: drivers.length + 1,
                padding: EdgeInsets.symmetric(horizontal: 12),
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 12, top: 16),
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Icon(
                              Icons.add,
                              size: 30,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          "Add Driver",
                          style: context.mytexttheme.titleMedium?.copyWith(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    );
                  }

                  final driver = drivers[index - 1];

                  return Container(
                    margin: EdgeInsets.only(right: 12, top: 16),
                    child: Column(
                      children: [
                        Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            CircleAvatar(
                              radius: 35,
                              backgroundImage: NetworkImage(driver.imageUrl),
                            ),
                            Positioned(
                              bottom: 0,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 6,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                      size: 14,
                                    ),
                                    SizedBox(width: 2),
                                    Text(
                                      driver.rating.toString(),
                                      style: context.mytexttheme.titleMedium
                                          ?.copyWith(
                                            color: Colors.black,
                                            fontSize: 12,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 6),
                        Text(
                          driver.name,
                          style: context.mytexttheme.titleMedium?.copyWith(
                            color: Colors.black,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
