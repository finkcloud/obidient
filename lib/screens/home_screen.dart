import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pgo/screens/register_pvc.dart';
import 'package:twitter_intent/twitter_intent.dart';

import '../helpers.dart';
import '../widgets/menu_card.dart';
import 'create_flier.dart';
import 'easy_tweets.dart';

class HomeScreenTab extends StatefulWidget {

  const HomeScreenTab({Key? key, }) : super(key: key);

  @override
  _HomeScreenTabState createState() => _HomeScreenTabState();
}

class _HomeScreenTabState extends State<HomeScreenTab> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height,
      width: size.width,
      padding: const EdgeInsets.all(16),
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          MenuItemCard(
            action: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CreateIsupportFlier()));
            },
            color: Colors.orange,
            icon: CupertinoIcons.add,
            title: "I Support ⛳",
            subtitle:
                "Get a custom #Isupport flyer in a second and share with friends, Tweet #ISupportPO",
          ),
          MenuItemCard(
            action: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RegisterForPVC()),
              );
            },
            color: Colors.teal,
            icon: CupertinoIcons.barcode_viewfinder,
            title: "GET 🗳️ PVC",
            subtitle:
                "Elections is not won online; Get your PVC if you have not,  tweet a picture of your PVC with #POMyPVCIsReady",
          ),
          MenuItemCard(
            action: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const EasyTweets()),
              );
            },
            color: Colors.blueGrey,
            icon: CupertinoIcons.share,
            title: "Spread the word 🗣️",
            subtitle:
            "Share your conviction with friends and family, the state of the nation is a nightmare now, share ready made tweets.",
          ),
          // MenuItemCard(
          //   action: () {},
          //   color: Colors.grey,
          //   icon: CupertinoIcons.shield,
          //   title: "Manifesto",
          //   subtitle:
          //       "You can create a support flyer in a second and convince friends",
          // ),

        ],
      ),
    );
  }
}
