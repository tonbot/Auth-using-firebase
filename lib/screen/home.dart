import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sport_friends/componet/button.dart';
import 'package:sport_friends/componet/colors.dart';
import 'package:sport_friends/componet/spaces.dart';
import 'package:sport_friends/main.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const Icon(
            Icons.home,
            color: Colors.white,
          ),
          title: const Text(
            "Home",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          automaticallyImplyLeading: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("WELCOME BACK USER"),
              verticalSpace(20.0),
              InkWell(
                onTap: (() async {
                  await FirebaseAuth.instance.signOut();
                  // ignore: use_build_context_synchronously
                  Navigator.pushReplacementNamed(
                    context,
                    '/Login',
                  );
                }),
                child: button("SIGN OUT"),
              ),
            ],
          ),
        ));
  }
}
