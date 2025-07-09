import 'package:direct_drive/src/constant/app_color.dart';
import 'package:direct_drive/src/constant/asset_string.dart';
import 'package:direct_drive/src/constant/text_style.dart';
import 'package:direct_drive/src/core/extension/context_ext._extension.dart';
import 'package:direct_drive/src/feature/booking/model/booking_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BookingList extends StatefulWidget {
  final List<BookingModel> bookings;

  const BookingList({super.key, required this.bookings});

  @override
  State<BookingList> createState() => _BookingListState();
}

class _BookingListState extends State<BookingList> {


  bool isexpended = false;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: widget.bookings.length,
      itemBuilder: (context, index) {
        final booking = widget.bookings[index];
        return Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: Colors.grey.shade300),
          ),

          elevation: 1,
          margin: const EdgeInsets.only(bottom: 12),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Column(
                      children: [
                        Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundImage: NetworkImage(
                                booking.driverImage,
                              ),
                            ),
                            SizedBox(height: 05),
                            Positioned(
                              bottom: 0,

                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 4),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 2,
                                    ),
                                  ],
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
                                      booking.rating.toString(),
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
                      ],
                    ),

                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            booking.driverName,
                            style: mytextsytle.titlemedium,
                          ),
                          const SizedBox(height: 2),

                          Row(
                            children: [
                              SvgPicture.asset(
                                AssetString.driver,
                                height: 16,
                                width: 16,
                              ),
                              const SizedBox(width: 2),
                              Text(
                                booking.driverRole.title,
                                style: mytextsytle.titleSmall,
                              ),
                            ],
                          ),

                          Row(
                            children: [
                              SvgPicture.asset(
                                AssetString.booking,
                                height: 16,
                                width: 16,
                              ),
                              const SizedBox(width: 2),
                              const SizedBox(height: 2),

                              Text(booking.date, style: mytextsytle.titleSmall),
                            ],
                          ),
                        ],
                      ),
                    ),

                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Color(0xffF0F1F5),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        booking.price,
                        style: mytextsytle.titlemedium,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),
                Row(
                  children: [
                    const Icon(
                      Icons.radio_button_checked,
                      color: MyColors.primaryColor,
                      size: 18,
                    ),
                    const SizedBox(width: 6),

                    Text(
                      booking.pickupLocation,
                      style: context.mytexttheme.titleMedium?.copyWith(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),

                Container(
                  margin: EdgeInsets.only(left: 06),
                  height: 20,
                  width: 05,
                  color: Colors.grey.shade300,
                ),

                Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      color: MyColors.primaryColor,
                      size: 18,
                    ),
                    const SizedBox(width: 6),
                    //  Expanded(child:
                    Text(
                      booking.dropLocation,
                      style: context.mytexttheme.titleMedium?.copyWith(
                        color: Colors.black,
                      ),
                    ),
                    //  ),
                  ],
                ),
                const Divider(height: 20),
                Center(
                  child: Container(
                    height: 40,
                    width: 130,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0xffF0F1F5),
                    ),

                    child: TextButton.icon(
                      onPressed: () {


                        setState(() {
                          isexpended =!isexpended;
                        });
                      },

                      label: Row(
                        children: [
                          Text(  isexpended ?"Show less":"Show more", style: mytextsytle.titlemedium),
                          Icon(
                            isexpended ? Icons.keyboard_arrow_up:
                            Icons.keyboard_arrow_down,color: Colors.black,),
                        ],
                      ),
                    ),
                  ),
                ),

                   if (isexpended) ...[
              const SizedBox(height: 10),

              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    
                     Text("Driver term and conditon"),
                       Icon(Icons.arrow_forward_ios,size: 16,),
                    ]
                         
                  ),

                  SizedBox(
                    height: 05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                             Text("Dreiver updates"),
                                   Icon(Icons.arrow_forward_ios,size: 16,),
                    ],
                  )
                ],
              )
        
       
              
              // Add more dummy fields if you want
            ],
              ],
            ),
          ),
        );
      },
    );
  }
}
