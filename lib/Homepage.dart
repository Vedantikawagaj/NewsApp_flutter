import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project/Favorites.dart';
import 'package:project/NewsFeed.dart';

class Homepage extends StatefulWidget {
  
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
   int selectedIndex = 0;
    final Options = [
    NewsFeed(),
    Favorites(),
    ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body:
          Center(
            child: Options.elementAt(selectedIndex),
            ),
          
       

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        backgroundColor: Color(0xff6C63FF),
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.red,
        
        onTap: onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.list,size: 40,),
            label: 'User',
          
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite,size: 40,
            
            ),
            label: 'Favorite',
            
          )
        ],
        
      ),
    );
  }

  void onItemTapped(int index){
    setState(() {
      selectedIndex = index;
    });
  }
}




























