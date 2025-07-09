// import 'package:direct_drive/src/constant/app_color.dart';
// import 'package:direct_drive/src/constant/asset_string.dart';
// import 'package:direct_drive/src/constant/text_style.dart';
// import 'package:direct_drive/src/core/extension/context_ext._extension.dart';
// import 'package:direct_drive/src/feature/booking/model/booking_model.dart';
// import 'package:direct_drive/src/feature/booking/widget/booking_list.dart';
// import 'package:direct_drive/src/feature/home/model/driver_model.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';

// class MyDreiver extends StatelessWidget {
//   const MyDreiver({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(


//         appBar: AppBar(
//           automaticallyImplyLeading: false,
//           elevation: 0,
//           centerTitle: false,
//           title: Text("My Driver", style: mytextsytle.titleLarge),
//           backgroundColor: Colors.white,
//           actions: [
//             IconButton(
//               onPressed: () {},
//               icon: Icon(Icons.add),
//               color: MyColors.primaryColor,
//               iconSize: 30,
//             ),

//             IconButton(
//               onPressed: () {},
//               icon: SvgPicture.asset(
//                 AssetString.search,
//                 color: MyColors.primaryColor,
//                 height: 25,
//                 width: 25,
//               ),
//             ),

            
//             IconButton(
//               onPressed: () {},
//               icon: Icon(Icons.settings,color: MyColors.primaryColor,),

            
//               ),
            



//            // const SizedBox(width: 12),
//           ],
//         ),

//         body: ListView.builder(
//           itemCount:  dummyBookings.length,
//           itemBuilder: (context,index){
           
//            final driver = dummyBookings[index];
//            return Container(
//             padding: EdgeInsets.only(top: 10,left: 16,right: 16),
//             margin: EdgeInsets.only(top: 10,left: 16,right: 16),
//             height: 100, 
//             width: double.infinity,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//               border: Border.all(
//       color: Colors.grey, // Border color
//       width: 1.0,          // Border width
//     ),
              
              
//             ),
    
          
           
//               child:  Row(
//                   children: [
//                     Column(
//                       children: [
//                         Stack(
//                           alignment: Alignment.bottomCenter,
//                           children: [
//                             CircleAvatar(
//                               radius: 30,
//                               backgroundImage: NetworkImage(
//                                 driver.driverImage,
//                               ),
//                             ),
//                             SizedBox(height: 05),
//                             Positioned(
//                               bottom: 0,

//                               child: Container(
//                                 padding: EdgeInsets.symmetric(horizontal: 4),
//                                 decoration: BoxDecoration(
//                                   color: Colors.white,
//                                   borderRadius: BorderRadius.circular(12),
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Colors.grey,
//                                       blurRadius: 2,
//                                     ),
//                                   ],
//                                 ),
//                                 child: Row(
//                                   children: [
//                                     Icon(
//                                       Icons.star,
//                                       color: Colors.yellow,
//                                       size: 14,
//                                     ),
//                                     SizedBox(width: 2),
//                                     Text(
//                                       driver.rating.toString(),
//                                       style: context.mytexttheme.titleMedium
//                                           ?.copyWith(
//                                             color: Colors.black,
//                                             fontSize: 12,
//                                           ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),

//                     const SizedBox(width: 10),
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             driver.driverName,
//                             style: mytextsytle.titlemedium,
//                           ),
//                           const SizedBox(height: 2),

//                           Row(
//                             children: [
//                               SvgPicture.asset(
//                                 AssetString.driver,
//                                 height: 16,
//                                 width: 16,
//                               ),
//                               const SizedBox(width: 2),
//                               Text(
//                                 driver,
//                                 style: mytextsytle.titleSmall,
//                               ),
//                             ],
//                           ),

                      
//                         ],
//                       ),
//                     ),

//                     Container(
//                       padding: const EdgeInsets.all(6),
//                       decoration: BoxDecoration(
//                         color: Color(0xffF0F1F5),
//                         borderRadius: BorderRadius.circular(6),
//                       ),
//                       child: Text(
//                         driver.rating as String,
//                         style: mytextsytle.titlemedium,
//                       ),
//                     ),
//                   ],
//                 ),
            
//            );
//         }
//         )
//     );
//   }
// }