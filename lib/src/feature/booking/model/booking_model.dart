
// ignore: camel_case_types


enum DriverRole {public, private;



// ignore: constant_identifier_names
String get title => switch(this){
 public => "public driver",
 private=> "private driver",
};


}




class BookingModel {
  final String driverName;
  final String driverImage;
  final double rating;
  final DriverRole driverRole;
  final String date;
  final String pickupLocation;
  final String dropLocation;
  final String price;

  BookingModel({
    required this.driverName,
    required this.driverImage,
    required this.rating,
    required this.driverRole,
    required this.date,
    required this.pickupLocation,
    required this.dropLocation,
    required this.price,
  });
}




List<BookingModel> dummyBookings = [
  BookingModel(
    driverName: "Erik Ortner",
    driverImage: "https://i.pravatar.cc/150?img=1",
    rating: 5.0,
    driverRole: DriverRole.private,
    date: "18 December, 2023",
    pickupLocation: "Sandefjord, Norway",
    dropLocation: "Haugesund, Norway",
    price: "\$62",
  ),
  BookingModel(
    driverName: "Erik Ortner",
    driverImage: "https://i.pravatar.cc/150?img=2",
    rating: 5.0,
    driverRole: DriverRole.public,
    date: "18 December, 2023",
    pickupLocation: "Thrale Street, London",
    dropLocation: "Ealing Broadway Shopping",
    price: "\$75",
  ),
  BookingModel(
    driverName: "Erik Ortner",
    driverImage: "https://i.pravatar.cc/150?img=3",
    rating: 5.0,
    driverRole: DriverRole.private,
    date: "18 December, 2023",
    pickupLocation: "Oxford Street, London",
    dropLocation: "Baker Street, London",
    price: "\$86",
  ),
];
