import 'package:flutter/material.dart';

class BusinessCardView extends StatefulWidget {
  const BusinessCardView({Key? key}) : super(key: key);

  @override
  State<BusinessCardView> createState() => _BusinessCardViewState();
}

class _BusinessCardViewState extends State<BusinessCardView> {
  BusinessCard businessCard = BusinessCard.fromMap({
    "name": "moon",
    "phoneNumber": "010-6617-3768",
    "job": "The cutest cat",
    "email": "IamMoon@cats.com",
    "photo": const AssetImage('assets/businessCard/moon.jpg'),
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Business Card Design Sample')),
      body: businessCard.getBusinessCard(),
    );
  }
}

class BusinessCard {
  final String name;
  final String phoneNumber;
  final String email;
  final String job;
  final ImageProvider<Object>? photo;

  BusinessCard(
    this.photo, {
    required this.name,
    required this.phoneNumber,
    required this.email,
    required this.job,
  });

  BusinessCard.fromMap(Map<String, Object?> map)
      : name = map['name'] as String,
        phoneNumber = map['phoneNumber'] as String,
        email = map['email'] as String,
        job = map['job'] as String,
        photo = map['photo'] as ImageProvider<Object>;

  SafeArea getBusinessCard() {
    return SafeArea(
      child: Container(
        color: Colors.teal,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
                child: CircleAvatar(
              backgroundColor: Colors.greenAccent[400],
              radius: 100,
              backgroundImage:  photo ?? const AssetImage('assets/place_holder.jpg'),
            )),
            Text(
              name,
              style: const TextStyle(
                  fontSize: 40.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Handlee"),
            ),
            Text(
              job,
              style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.teal[100],
                  fontWeight: FontWeight.bold,
                  fontFamily: "SourceSansPro",
                  letterSpacing: 2.0),
            ),
            SizedBox(
              height: 10.0,
              width: 200,
              child: Center(
                child: Container(
                  margin:
                      const EdgeInsetsDirectional.only(start: 1.0, end: 1.0),
                  height: 1.0,
                  color: Colors.white,
                ),
              ),
            ),
            Card(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: ListTile(
                    leading: const Icon(
                      Icons.phone,
                      color: Colors.teal,
                    ),
                    title: Text(
                      phoneNumber,
                      style: TextStyle(
                        color: Colors.teal.shade900,
                        fontFamily: "SourceSansPro",
                        fontSize: 20,
                      ),
                    ),
                  )),
            ),
            Card(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: ListTile(
                    leading: const Icon(
                      Icons.email_rounded,
                      color: Colors.teal,
                    ),
                    title: Text(
                      email,
                      style: TextStyle(
                        color: Colors.teal.shade900,
                        fontFamily: "SourceSansPro",
                        fontSize: 17,
                      ),
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
