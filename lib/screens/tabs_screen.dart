import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';
import './categories_screen.dart';
import './favorites_screen.dart';
import '../models/trip.dart';

class TabsScreen extends StatefulWidget {
  final List<Trip> favoriteTrips;
  const TabsScreen({Key? key, required this.favoriteTrips}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
 late List _screens ;
   @override
  void initState() {
     _screens =[
       {'screen': const CategoriesScreen(),
         'title':'التصنيفات'
       },

       {'screen':  FavoritesScreen(favoriteTrips:widget.favoriteTrips),
         'title':'الرحلات المفضلة'
       },

     ];
    super.initState();
  }

  int _selectedScreenIndex=0;

  void selectScreen(index){
  setState(() {
    _selectedScreenIndex =index;
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset('assets/images/logo.jpg', height: 25),
            const SizedBox(width: 10),
            Text(_screens[_selectedScreenIndex]['title']),
          ],
        ),
      ),
      drawer:const AppDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        onTap:selectScreen,
        currentIndex: _selectedScreenIndex,
        backgroundColor: Theme.of(context).colorScheme.primary,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        unselectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard),label: 'التصنيفات'),
          BottomNavigationBarItem (
              icon: Icon(Icons.star),
              label: 'المفضلة'
          ),

        ],
      ),
      body: _screens[_selectedScreenIndex]['screen'],
    );
  }
}
