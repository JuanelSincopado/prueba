import 'package:flutter/material.dart';
import 'package:prueba/widgets/home/local_widgets/home_body.dart';
import 'package:prueba/widgets/home/local_widgets/routes_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String currentPage = 'Home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: const Image(
                image: NetworkImage(
                    'https://cdn.iconscout.com/icon/free/png-256/avatar-370-456322.png'),
                height: 50,
              ),
            ),
            Column(
              children: const [
                Text('User'),
                Text('Data'),
              ],
            ),
            DropdownButton(
              icon: const Icon(Icons.clear_all),
              iconEnabledColor: Colors.white,
              iconSize: 40,
              onChanged: (String? value) {
                if (value == 'Home') {
                  setState(() {
                    currentPage = 'Home';
                  });
                } else {
                  setState(() {
                    currentPage = 'Rutas';
                  });
                }
              },
              items: <String>['Home', 'Rutas'].map<DropdownMenuItem<String>>(
                (String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                },
              ).toList(),
            ),
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: currentPage == 'Home' ? const HomeBody() : const RoutesBody(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.add, color: Colors.black),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.black),
            label: '',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.card_giftcard, color: Colors.black), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.monetization_on_outlined, color: Colors.black),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings, color: Colors.black), label: ''),
        ],
      ),
    );
  }
}
