import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:the_designer_chowk/app/data/views/selected_card.dart';

import '../../utils/language_singleton.dart';

// ignore: must_be_immutable
class SelectedLocation extends StatelessWidget {
  SelectedLocation(
      {Key? key,
      required this.selectedLocation,
      required this.changeLocation,
      required this.onPressed})
      : super(key: key);

  List<String> location = [
    'INDORE',
    'BHOPAL',
    'NEW DELHI',
    'BANGALORE',
    'MUMBAI',
    'NAGPUR'
  ];

  final String selectedLocation;
  final Function(String value) changeLocation;
  final VoidCallback onPressed;
  late String localIndex;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.height * 0.02),
      child: Column(
        children: [
          SizedBox(height: size.height * 0.03),
          Text('Choose Location'.tr,
              style: Theme.of(context).textTheme.bodyText2),
          SizedBox(height: size.height * 0.02),
          Expanded(
            child: GridView.builder(
              primary: false,
              itemCount: location.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 2.7),
              itemBuilder: (context, index) => SelectedCard(
                imagePath: '',
                textTitle: location[index].tr,
                selected: selectedLocation == location[index],
                onPressed: () {
                  changeLocation(location[index]);
                  //localIndex = location[index];
                },
                showImage: false,
              ),
            ),
          ),
          SizedBox(height: size.height * 0.01),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 52)),
            onPressed: () {
              if (selectedLocation == 'INDORE') {
                DataSingleton.instance.locationId = 'INDORE';
              } else if (selectedLocation == 'BHOPAL') {
                DataSingleton.instance.locationId = 'BHOPAL';
              } else if (selectedLocation == 'NEW DELHI') {
                DataSingleton.instance.locationId = 'NEW DELHI';
              } else if (selectedLocation == 'BANGALORE') {
                DataSingleton.instance.locationId = 'BANGALORE';
              } else if (selectedLocation == 'MUMBAI') {
                DataSingleton.instance.locationId = 'MUMBAI';
              } else if (selectedLocation == 'NAGPUR') {
                DataSingleton.instance.locationId = 'NAGPUR';
              }
              Get.back();
            },
            child: Text('SAVE LOCATION'.tr,
                style: Theme.of(context).textTheme.button),
          ),
          SizedBox(height: size.height * 0.01),
        ],
      ),
    );
  }
}
