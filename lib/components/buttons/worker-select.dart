  import 'package:flutter/material.dart';
  import 'package:gig/components/buttons/circular-avatar.dart';
  import 'package:gig/displays/service-details-page.dart';

  import '../../model/user.dart';

  class WorkerSelect extends StatelessWidget {
    final String image;
    final String? name;
    final Function? onPress1;
    final Function? onPress2;
    final TextStyle nameStyle;
    final AppUser worker;
    final String serviceType;

    const WorkerSelect({
      Key? key,
      this.onPress1,
      required this.image,
      this.name,
      this.onPress2,
      required this.nameStyle,
      required this.worker,
      required this.serviceType,
    }) : super(key: key);

    @override
    Widget build(BuildContext context) {
      return SizedBox(
        height: 100,
        child: Container(
          padding: EdgeInsets.only(top: 15.0, right: 20, left: 20, bottom: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
                color: Colors.teal.shade200),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircularAvatar(
                onPress: onPress1,
                image: 'lib/images/avatar.jpg',
                image_radius: 32.0,
              ),
              SizedBox(width: 10),
              Column(
                children: [
                  Text(
                    name!,
                    style: nameStyle,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 5),
                ],
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ServiceDetailsPage(worker: worker,image: image, serviceType: serviceType),
                    ),
                  );
                },
                child: Text(
                  'CHOOSE',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Poppins-Medium',
                    color: Colors.white,
                  ),
                ),
                style: ButtonStyle(
                  foregroundColor:
                  MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.teal.shade400),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
