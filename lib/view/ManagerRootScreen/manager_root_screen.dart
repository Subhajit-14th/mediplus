import 'package:flutter/material.dart';
import 'package:mediplus/utils/assets/app_colors.dart';
import 'package:mediplus/view/ManagerRootScreen/manager_drawer_screen.dart';

class ManagerRootScreen extends StatelessWidget {
  const ManagerRootScreen({super.key});

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
      drawer: const ManagerDrawerScreen(),
    );
  }
}
