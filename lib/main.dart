import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import './screens/filters_screen.dart';
import './screens/tabs_screen.dart';
import './screens/category_trips_screen.dart';
import './screens/trip_detail_screen.dart';
import './app_data.dart';
import './models/trip.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'summer': false,
    'winter': false,
    'family': false,
  };

  List<Trip> _availableTrips = tripsData;


  void _changeFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableTrips = tripsData.where((trip) {
        if (_filters['summer'] == true && trip.isInSummer != true) {
          return false;
        }
        if (_filters['winter'] == true && trip.isInWinter != true) {
          return false;
        }
        if (_filters['family'] == true && trip.isForFamilies != true) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  final List<Trip> _favoriteTrips = [];

  void _manageFavorite(String tripId) {
    final existingIndex =
    _favoriteTrips.indexWhere((trip) => trip.id == tripId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteTrips.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteTrips.add(
          tripsData.firstWhere((trip) => trip.id == tripId),
        );
      });
    }
  }

  bool _isFovarite(String id) {
    return _favoriteTrips.any((trip) => trip.id == id);
  }


  @override
  Widget build(BuildContext context) {

      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Yemen Travel',
        localizationsDelegates:const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('ar','AE'), // English
          //Locale('es'), // Spanish
        ],
        theme: ThemeData(
          fontFamily: 'ElMessiri',
            textTheme: ThemeData.light().textTheme.copyWith(
              headline5:const TextStyle(
                color: Colors.deepPurple,
                fontSize: 24,
                fontFamily: 'ElMessiri',
                fontWeight: FontWeight.bold
              ),
              headline6:const TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontFamily: 'ElMessiri',
                fontWeight: FontWeight.bold
              )
            ),
          //  primarySwatch: Colors.blue,
           //accentColor: Colors.amber,

            colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple).copyWith(secondary: Colors.amber),
          useMaterial3: true,
        ),
         themeMode: ThemeMode.system,
        //initialRoute: '/',
        //home: const Login(),
        routes: {
          '/':(context) =>  TabsScreen(favoriteTrips:_favoriteTrips),
          CategoryTripsScreen.screenRoute:(context) =>  CategoryTripsScreen(availableTrips: _availableTrips),
          TripDetailScreen.screenRoute:(context) =>  TripDetailScreen(manageFavorite:_manageFavorite,isFovarite:_isFovarite),
          FiltersScreen.screenRoute:(context) =>  FiltersScreen(saveFilters:_changeFilters,currentFilters:_filters)
        },

    );
  }
}
