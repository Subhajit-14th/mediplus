import 'package:flutter/material.dart';
import 'package:mediplus/utils/assets/app_colors.dart';
import 'package:mediplus/view/AdminRootScreen/DashBoardScreen/dash_board_screen.dart';
import 'package:mediplus/view/AdminRootScreen/drawer_screen.dart';

class AdminRootScreen extends StatelessWidget {
  const AdminRootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.textColorLight,
      appBar: AppBar(
        backgroundColor: AppColor.textColorLight,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search_rounded,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: CircleAvatar(
              backgroundColor: AppColor.secondaryColor,
              child: Icon(
                Icons.person_rounded,
              ),
            ),
          ),
        ],
      ),
      drawer: const DrawerScreen(),
      body: DashBoardScreen(),
    );
  }
}
