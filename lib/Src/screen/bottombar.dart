import 'package:flutter/material.dart';
import 'package:getx_crud_restapi/Src/screen/homepage.dart';
import 'package:getx_crud_restapi/Src/screen/loginpage.dart';

import '../constants/appcolors.dart';

class Bottombar extends StatefulWidget {
  const Bottombar({super.key});

  @override
  State<Bottombar> createState() => _BottombarState();
}

class _BottombarState extends State<Bottombar> {
  int _currentTab = 0;
  final PageStorageBucket bucket = PageStorageBucket();
  Widget _currentScreens = Homepage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: white,
      body: PageStorage(
        bucket: bucket,
        child: _currentScreens,
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(top: 20),
        child: Container(
          height: 65,
          width: 65,
          child: FittedBox(
            alignment: Alignment.bottomCenter,
            child: FloatingActionButton(
              backgroundColor: blueGrey,
              elevation: 0,
              onPressed: () {},
              child: MaterialButton(
                onPressed: () => () {
                  setState(() {
                    // _currentTab = 0;
                  });
                },
                child: Icon(
                  Icons.add,
                  color: white,
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomSheet: BottomAppBar(
        color: white,
        elevation: 0,
        notchMargin: 10,
        child: Container(
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.1),
                  spreadRadius: 80,
                  blurRadius: 70,
                ),
              ],
            ),
            child: Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MaterialButton(
                      onPressed: () {
                        setState(() {
                          _currentScreens = Homepage();
                          _currentTab = 0;
                        });
                      },
                      child: Icon(
                        _currentTab == 0 ? Icons.home : Icons.home_outlined,
                        color: _currentTab == 0 ? blueGrey : black54,
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        setState(() {
                          //_currentScreens = SearchUserPage();
                          _currentTab = 1;
                        });
                      },
                      child: Icon(
                        _currentTab == 1 ? Icons.group : Icons.group_outlined,
                        color: _currentTab == 1 ? blueGrey : black54,
                      ),
                    ),
                    SizedBox(width: 40),
                    SizedBox(width: 40),
                    MaterialButton(
                      onPressed: () {
                        setState(() {
                          // _currentScreens = HomePage();
                          _currentTab = 2;
                        });
                      },
                      child: Icon(
                        _currentTab == 2
                            ? Icons.favorite
                            : Icons.favorite_outline,
                        color: _currentTab == 2 ? blueGrey : black54,
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        setState(() {
                          // _currentScreens = ProfilePage();
                          _currentTab = 3;
                        });
                      },
                      child: Icon(
                        _currentTab == 3 ? Icons.person : Icons.person_outline,
                        color: _currentTab == 3 ? blueGrey : black54,
                      ),
                    ),
                  ],
                )
              ],
            )),
      ),
    );
  }
}
