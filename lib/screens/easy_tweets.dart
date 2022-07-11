import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_intent/twitter_intent.dart';

import '../helpers.dart';
import '../widgets/menu_card.dart';

class EasyTweets extends StatefulWidget {
  const EasyTweets({Key? key}) : super(key: key);

  @override
  _EasyTweetsState createState() => _EasyTweetsState();
}

class _EasyTweetsState extends State<EasyTweets> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: const Text("Quick Tweets"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              MenuItemCard(
                action: () {
                  final intent = TweetIntent(
                    hashtags: [
                      'TakeBackNaija',
                      'PeterObi4President',
                      'Secure&UniteNaija',
                      'TurnAroundNaija',
                      'POApp',
                      'OBIDATTI',
                    ],
                    text:
                        '#POApp \n8 years from now, how old will you be?, will your future self & kids 4give you if you choose wrongly or stay idle, get ur PVC ready, Vote with your heart this time 🚀',
                    via: '_phils',
                    related: [
                      RelatedAccount(
                        username: 'PeterObi',
                        description: 'Software, Blockchain & Crypto ',
                      ),
                    ],
                  );
                  launchIntent(Uri.parse("$intent"));
                },
                color: Colors.blueGrey,
                icon: FontAwesomeIcons.twitter,
                title: "Hard Pill 💊",
                subtitle:
                    "Your fate for the next 8 years is in the ⚖️ Elections is not won online; Get your PVC if you have not,  tweet a pic #POMyPVCIsReady",
              ),
              MenuItemCard(
                action: () {
                  final intent = TweetIntent(
                    hashtags: [
                      'TakeBackNaija',
                      'PeterObi4President',
                      'Secure&UniteNaija',
                      'TurnAroundNaija',
                      'ObidientApp',
                      'OBIDATTI',

                    ],
                    text:
                        '#POApp \nSo you always say Japa is the solution, where will your old parent live, where will you get old, create the country wish you have! Will you #japa with whole family, 🚀',
                    via: '_phils',
                    related: [
                      RelatedAccount(
                        username: 'PeterObi',
                        description: 'Software, Blockchain & Crypto ',
                      ),
                    ],
                  );
                  launchIntent(Uri.parse("$intent"));
                },
                color: Colors.blue,
                icon:  FontAwesomeIcons.twitter,
                title: "👴 > Japa ✈️ 🧳",
                subtitle:
                    "So you always say Japa is the solution, where will your old parent live, where will you get old, create the country you wish you have!, be a part",
              ),
              MenuItemCard(
                action: () {
                  final intent = TweetIntent(
                    hashtags: [
                      'TakeBackNaija',
                      'PeterObi4President',
                      'Secure&UniteNaija',
                      'TurnAroundNaija',
                      'ObidientApp',
                      'OBIDATTI',
                    ],
                    text:
                        '#POApp \nHealth is wealth choose wisely, Applied knowledge is power: Choose with your heart & mind not emotionally, this is a serious matter,  Get your PVC 🗳️ if you have not,  tweet a picture of your PVC with #POMyPVCIsReady 🚀',
                    via: '_phils',
                    related: [
                      RelatedAccount(
                        username: 'PeterObi',
                        description: 'Software, Blockchain & Crypto ',
                      ),
                    ],
                  );
                  launchIntent(Uri.parse("$intent"));
                },
                color: Colors.orange,
                icon:  FontAwesomeIcons.twitter,
                title: "🧑‍⚕️ How are you 🤒",
                subtitle:
                    "Are you really fine? cos you mumbled fine inside, You know the answer, sometimes its daily price hike?. Do the needful it #IsupportPO",
              ),
              MenuItemCard(
                action: () {
                  final intent = TweetIntent(
                    hashtags: [
                      'TakeBackNaija',
                      'PeterObi4President',
                      'Secure&UniteNaija',
                      'TurnAroundNaija',
                      'ObidientApp',
                      'OBIDATTI',

                    ],
                    text:
                        '#POApp \n8 years from now, how old will you be?, can you guess the situation if things go wrong again, will you make that dream journey 🚀',
                    via: '_phils',
                    related: [
                      RelatedAccount(
                        username: 'PeterObi',
                        description: 'Software, Blockchain & Crypto ',
                      ),
                    ],
                  );
                  launchIntent(Uri.parse("$intent"));
                },
                color: Colors.teal,
                icon: FontAwesomeIcons.twitter,
                title: "Preach it 🗣️",
                subtitle:
                    "Elections is not won online; Get your PVC if you have not, tell your whole family and friends, everyone should be involved #POMyPVCIsReady",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
