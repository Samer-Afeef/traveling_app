import 'package:flutter/material.dart';
import 'package:traveling/app_data.dart';

class TripDetailScreen extends StatelessWidget {
  static const screenRoute = '/trip-detail';
  final Function manageFavorite;
  final Function isFovarite;

  const TripDetailScreen({Key? key, required this.manageFavorite, required this.isFovarite}) : super(key: key);

  Widget buildSectionTitle({required BuildContext context, required String titleText}) {

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      alignment: Alignment.topRight,
      child: Text(
        titleText,
        style: Theme.of(context).textTheme.headline5,
      ),
    );
  }

  Widget buildListViewContainer({required Widget listView}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      height: 200,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: listView,
    );
  }
  @override
  Widget build(BuildContext context) {
    final tripId = ModalRoute.of(context)?.settings.arguments as String;
    final selectDetail = tripsData.firstWhere((trips) => trips.id == tripId);
    return Scaffold(
        appBar: AppBar(
          title: Text(selectDetail.title),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 300,
                width: double.infinity,
                child: Image.network(selectDetail.imageUrl, fit: BoxFit.cover),
              ),
              buildSectionTitle(context: context, titleText: 'الانشطة'),
              buildListViewContainer(
                listView: ListView.builder(
                  itemCount: selectDetail.activities.length,
                  itemBuilder: (context, index) => Card(
                    elevation: 0.3,
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: Text(selectDetail.activities[index])),
                  ),
                ),
              ),
              buildSectionTitle(context: context, titleText: 'البرنامج اليومي'),
              buildListViewContainer(
                  listView: ListView.separated(
                      separatorBuilder: (context, index) {
                        return const Divider();
                      },
                      itemCount: selectDetail.program.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: CircleAvatar(
                            child: Text("ٍيوم${index + 1}"),
                          ),
                          title: Text(selectDetail.program[index]),
                        );
                      })),
              const SizedBox(
                height: 100,
              )
            ],
          ),
        ),
    floatingActionButton: FloatingActionButton(
      onPressed:() {
        manageFavorite(tripId);
      },
      child:Icon(
        isFovarite(tripId)?
       Icons.star:Icons.star_border),
    ),);
  }
}
