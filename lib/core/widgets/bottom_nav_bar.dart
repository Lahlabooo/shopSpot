

import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  final Function(int) onTap;
  const BottomNavBar({
    super.key,
    required this.onTap,
  });

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(45),
        child: BottomNavigationBar(selectedItemColor: Colors.deepPurpleAccent,
          unselectedItemColor: Colors.white,
          backgroundColor: blackColor,
          type: BottomNavigationBarType.fixed,
          items: [
            for (int i = 0; i < bottomNavBarIcons.length; i++)
              BottomNavigationBarItem(
                icon: Icon(bottomNavBarIcons[i]),
                label: bottomNavBarTitle[i],
              ),
          ],
          currentIndex: currentIndex, // Index of the currently selected item
          onTap: (index) {
            setState(() {
              //currentIndex = index;
              widget.onTap(index);
              //if(index==0){
                currentIndex=1;
              //}
            });
          },
        ),
      ),
    );
  }
}
const List<IconData> bottomNavBarIcons = [
  Icons.toc_outlined,
  Icons.storefront,
  Icons.favorite_border_outlined,
  Icons.person,
];
 const List<String> bottomNavBarTitle = [
  "More",
  "Home",
  "Fav",
  "Me",
];
 const blackColor = Color(0xff000000);