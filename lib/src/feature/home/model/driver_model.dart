class DriverModel {
  final String name;
  final String imageUrl;
  final double rating;

  DriverModel({
    required this.name,
    required this.imageUrl,
    required this.rating,
  });
}



final List<DriverModel> drivers = [
  DriverModel(name: "Ali Khan", imageUrl: "https://i.pravatar.cc/150?img=1", rating: 4.8),
  DriverModel(name: "Sara Khan", imageUrl: "https://i.pravatar.cc/150?img=2", rating: 4.5),
  DriverModel(name: "Hamza Ali", imageUrl: "https://i.pravatar.cc/150?img=3", rating: 4.7),
    DriverModel(name: "Ali Khan", imageUrl: "https://i.pravatar.cc/150?img=1", rating: 4.8),
  DriverModel(name: "Sara Khan", imageUrl: "https://i.pravatar.cc/150?img=2", rating: 4.5),
  DriverModel(name: "Hamza Ali", imageUrl: "https://i.pravatar.cc/150?img=3", rating: 4.7),
];
