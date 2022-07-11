import 'package:flutter/material.dart';

class MenuItemCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Function() action;
  final Color color;

  const MenuItemCard(
      {Key? key,
      required this.icon,
      required this.title,
      required this.subtitle,
      required this.action,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: action,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        height: size.height * 0.2,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Icon(
                icon,
                size: size.width * .16,
                color: Colors.white,
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      title,
                      style: const TextStyle(fontWeight: FontWeight.w900, color: Colors.white, fontSize: 24,  fontFamily: 'Nexa',),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text(
                      subtitle,
                      overflow: TextOverflow.fade,
                      style: const TextStyle(fontWeight: FontWeight.w400, color: Colors.white,  height: 1.2, fontFamily: 'Nexa', fontSize: 14,),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.0),
              child: Icon(
              Icons.arrow_forward_ios_rounded,
                size: 40,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
