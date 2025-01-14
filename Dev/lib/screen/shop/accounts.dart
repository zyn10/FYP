import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:petbook/Layout/app_style.dart';
import 'package:petbook/providers/user_provider.dart';
import 'package:petbook/responsive/mobile_screen_layout.dart';
import 'package:petbook/screen/Post/user_posts.dart';
import 'package:provider/provider.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Provider.of<UserProvider>(context);
    userProvider.getUser?.uid;

    return Scaffold(
      backgroundColor: kWhite,
      appBar: AppBar(
        backgroundColor: kWhite,
        title: const Text("Profile"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MobileScreenLayout(),
              ),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 70.0),
              child: Center(
                child: SizedBox(
                  height: 115,
                  width: 115,
                  child: Stack(
                    fit: StackFit.expand,
                    clipBehavior: Clip.none,
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                          userProvider.getUser!.photoUrl,
                        ),
                      ),
                      Positioned(
                        bottom: -10,
                        left: 80,
                        child: SizedBox(
                          height: 42,
                          width: 42,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                                side: const BorderSide(color: Colors.orange),
                              ),
                              //Color: Colors.white,
                              backgroundColor: Colors.white,
                            ),
                            onPressed: () {},
                            child: const Icon(
                                color: Colors.orange, Icons.verified),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  backgroundColor: kBackground,
                ),
                onPressed: () {},
                child: Row(
                  children: [
                    const Icon(
                      Icons.waving_hand,
                      color: kGrey,
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          "${userProvider.getUser!.username} ",
                          style: const TextStyle(
                            color: kGrey,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  backgroundColor: kBackground,
                ),
                onPressed: () {},
                child: Row(
                  children: [
                    const Icon(
                      Icons.person,
                      color: kGrey,
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          "${userProvider.getUser!.fullname} ",
                          style: const TextStyle(
                            color: kGrey,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  backgroundColor: kBackground,
                ),
                onPressed: () {},
                child: Row(
                  children: [
                    const Icon(
                      Icons.email,
                      color: kGrey,
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          "${userProvider.getUser!.email} ",
                          style: const TextStyle(
                            color: kGrey,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  backgroundColor: kBackground,
                ),
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return PostGrid(uid: userProvider.getUser!.uid);
                      },
                    ),
                  );
                },
                child: Row(
                  children: const [
                    Icon(
                      Icons.grade_rounded,
                      color: kGrey,
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          " Posts",
                          style: TextStyle(
                            color: kGrey,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  backgroundColor: Colors.orange,
                ),
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                },
                child: Row(
                  children: [
                    Image.asset(
                      "assets/logout.png",
                      color: kWhite,
                      width: 22,
                    ),
                    const SizedBox(width: 10),
                    const Expanded(
                      child: Center(
                        child: Text(
                          'Log Out',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
