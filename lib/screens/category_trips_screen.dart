import 'package:flutter/material.dart';
import '../widgets/trip_item.dart';
import '../models/trip.dart';
class CategoryTripsScreen extends StatefulWidget {
  final List<Trip> availableTrips;
  const CategoryTripsScreen({Key? key, required this.availableTrips}) : super(key: key);
  static const screenRoute = '/category-trips';

  @override
  State<CategoryTripsScreen> createState() => _CategoryTripsScreenState();
}

class _CategoryTripsScreenState extends State<CategoryTripsScreen> {
  late String categoryTitle;
  late List<Trip> displayTrips;


  @override
  void didChangeDependencies() {
    final routeArgument = ModalRoute.of(context)?.settings.arguments as Map<String, String>;

    categoryTitle = routeArgument['title']!;

    final categoryId = routeArgument['id'];

    displayTrips = widget.availableTrips.where((trip) {

      return trip.categories.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle)),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return TripItem(
            id: displayTrips[index].id,
              imageUrl: displayTrips[index].imageUrl,
              title: displayTrips[index].title,
              duration: displayTrips[index].duration,
              season: displayTrips[index].season,
              tripType: displayTrips[index].tripType,
          );

        },
        itemCount: displayTrips.length,
      ),
    );
  }
}
