import 'package:flutter/material.dart';
import '../screens/filters_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  Widget buildListTile({required String title,required IconData icon,  required Function() onTapLink }) {
    return ListTile(
      leading: Icon(
        icon,
        size: 30,
        color: Colors.blue,
      ),
      title: Text(
        title,
        style:const TextStyle(
          fontFamily: 'ElMessiri',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onTapLink,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            padding:const EdgeInsets.only(top: 40),
            alignment: Alignment.center,
            color: Theme.of(context).colorScheme.secondary,
            child: Text(
              'دليلك السياحي',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
         const SizedBox(height: 20),
         buildListTile(
           title:  'الرحلات',
           icon: Icons.card_travel,
           onTapLink: () {
           Navigator.of(context).pushReplacementNamed('/');
         },
         ),
          buildListTile(
            title: 'الفلترة',
            icon: Icons.filter_list,
            onTapLink: () {
              Navigator.of(context).pushReplacementNamed(FiltersScreen.screenRoute);
            },

          ),
        ],
      ),
    );
  }
}
