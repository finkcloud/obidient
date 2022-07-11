import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:twitter_intent/twitter_intent.dart';

import '../constants.dart';
import '../helpers.dart';

class DonateOrFollow extends StatelessWidget {
  const DonateOrFollow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              "Buy us a coffee ",
              style: TextStyle(fontWeight: FontWeight.w900),
              textScaleFactor: 1.5,
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
                "To encourage App Developer for updates, you can do either of these or both follow him, or send some  coin or reach out to @_phils on Twitter😊 🎉 💃 Support appreciated "),
            const SizedBox(
              height: 16,
            ),
            InkWell(
              onTap: () {
                final intent = FollowUserIntent(username: '_phils');
                // Convert the intent instance to a string.
                // Use either Dart's string interpolation or the toString() method.
                // The "launch" method is part of "url_launcher".
                launchIntent(Uri.parse('$intent'));
              },
              child: const ListTile(
                leading: Icon(
                  Icons.follow_the_signs,
                  color: Colors.teal,
                ),
                title: Text("Tap to follow Developer on Twitter"),
                subtitle: Text("@_phils"),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.teal,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.follow_the_signs,
                color: Colors.teal,
              ),
              title: const Text("Send BTC"),
              subtitle: const Text(POAppConstants.devAddress),
              trailing: GestureDetector(
                onTap: () async {
                  await Clipboard.setData(
                      const ClipboardData(text: POAppConstants.devAddress));
                  showTopSnackBar(
                      context,
                      const CustomSnackBar.info(
                        message: "Wallet copied!",
                      ));
                },
                child: const Icon(
                  Icons.copy_rounded,
                  color: Colors.teal,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("\n\n\nFound Error/improvement? \nShoot a mail to sudokode@protonmail.com"),
            )
          ],
        ),
      ),
    );
  }
}
