import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';


class FiltersScreen extends StatefulWidget {

  final Function saveFilters;
  final Map<String, bool> currentFilters;
  const FiltersScreen({Key? key, required this.saveFilters, required this.currentFilters}) : super(key: key);
 static const String screenRoute='/filters';

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
 bool _isInSummer= false;
 bool _isInWinter= false;
 bool _isForFamilies= false;
 @override
 initState() {
   _isInSummer = widget.currentFilters['summer']!;
   _isInWinter = widget.currentFilters['winter']!;
   _isForFamilies = widget.currentFilters['family']!;
   super.initState();
 }
 Widget buildSwitchListTile({
     required String title, required String subtitle, required bool currentValue,  required Function(bool newValue) updateValue}) {
   return SwitchListTile(
     activeColor: Theme.of(context).colorScheme.secondary,
     title: Text(title,style:const TextStyle(
       fontFamily: 'ElMessiri',
       fontSize: 20
     ),),
     subtitle: Text(subtitle,style:const TextStyle(
         fontFamily: 'Amiri',
         fontSize: 16
     )),
     value: currentValue,
     onChanged: updateValue,

   );
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('الفلترة'),
        actions: [
          IconButton(
            color: Theme.of(context).colorScheme.secondary,
            onPressed: () {
               Map<String,bool> selectedFilters = {
                'summer': _isInSummer,
                'winter': _isInWinter,
                'family': _isForFamilies,
              };
              widget.saveFilters(selectedFilters);
            },
          icon:const Icon(Icons.save_outlined))
        ],
),
        drawer:const AppDrawer(),
        body:  Column(
         children: [
           const SizedBox(height: 50,),
          Expanded(
              child: ListView(
               children: [
              buildSwitchListTile(
                  title: 'الرحلات الصيفية فقط',
                  subtitle: 'إظهار الرحلات في فصل الصيف فقط',
                  currentValue:_isInSummer,
                  updateValue: (newValue) {
                    setState(() {
                      _isInSummer = newValue;
                    });
                  },),
                 buildSwitchListTile(
                   title:  'الرحلات الشتوية فقط',
                   subtitle:  'إظهار الرحلات في فصل الشتاء فقط',
                   currentValue:_isInWinter,
                   updateValue: (newValue) {
                     setState(() {
                       _isInWinter = newValue;
                     });
                   },),
                 buildSwitchListTile(
                   title: 'للعائلات',
                   subtitle:  'إظهار الرحلات التي للعائلات فقط',
                   currentValue:_isForFamilies,
                   updateValue: (newValue) {
                     setState(() {
                       _isForFamilies = newValue;
                     });
                   },)



               ],))
         ],
        ));
  }
}
