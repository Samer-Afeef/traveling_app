import 'package:flutter/material.dart';
import '../screens/trip_detail_screen.dart';

import '../models/trip.dart';

class TripItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final TripType tripType;
  final Season season;
   //final Function(Object tripId) removeTrip;

  const TripItem({Key? key,
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.duration,
    required this.tripType,
    required this.season,
   // required this.removeTrip,
  })

      : super(key: key);

  String get seasonText {
    switch (season) {
      case Season.winter:
        return 'شتاء';
        break;
      case Season.spring:
        return 'ربيع';
        break;
      case Season.summer:
        return 'صيف';
        break;
      case Season.autumn:
        return 'خريف';
        break;
      default:
        return 'غير معروف';
    }
  }

  String get tripTypeText {
    switch (tripType) {
      case TripType.exploration:
        return 'استكشاف';
        break;
      case TripType.recovery:
        return 'نقاهة';
        break;
      case TripType.activities:
        return 'انشطة';
        break;
      case TripType.therapy:
        return 'معالجة';
        break;
      default:
        return 'غير معروف';
    }
  }

  void selectTrip(BuildContext context) {
    Navigator.of(context).pushNamed(
        TripDetailScreen.screenRoute,
        arguments: id,

    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectTrip(context),
      child: Card(
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        elevation: 10,
        margin: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  alignment: Alignment.bottomRight,
                  height: 250,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black.withOpacity(0),
                            Colors.black.withOpacity(1),
                          ],
                          stops: const [0.6, 1]
                      )),
                  child: Text(title,
                      style: Theme
                          .of(context)
                          .textTheme
                          .headline6,
                      overflow: TextOverflow.fade),
                )
              ],
            ),
            Padding(padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.today_outlined,
                        color: Theme
                            .of(context)
                            .colorScheme
                            .secondary,),
                      const SizedBox(width: 6.0,),
                      Text('$duration يوم')
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.wb_sunny_outlined,
                        color: Theme
                            .of(context)
                            .colorScheme
                            .secondary,),
                      const SizedBox(width: 6.0,),
                      Text(seasonText)
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.type_specimen,
                        color: Theme
                            .of(context)
                            .colorScheme
                            .secondary,),
                      const SizedBox(width: 6.0,),
                      Text(tripTypeText)
                    ],
                  ),
                ],),)
          ],
        ),
      ),
    );
  }


}
