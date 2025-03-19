import 'package:flutter/material.dart';
import 'package:mediplus/utils/assets/app_colors.dart';

class ReceptionistDrawerScreen extends StatelessWidget {
  const ReceptionistDrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Drawer(
      backgroundColor: AppColor.textColorLight,
      elevation: 0,
      child: Column(
        children: [
          SizedBox(height: height * 0.05),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 10,
                  children: [
                    CircleAvatar(
                      backgroundColor: AppColor.primaryColor,
                      radius: 42,
                      child: CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(
                          'https://plus.unsplash.com/premium_photo-1689568126014-06fea9d5d341?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D',
                        ),
                      ),
                    ),
                    Text(
                      'Receptionist',
                      style: TextStyle(
                        color: AppColor.textColorDark,
                        fontSize: 14,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Icon(
                  Icons.exit_to_app_rounded,
                  color: Colors.red,
                ),
              ],
            ),
          ),
          SizedBox(height: height * 0.02),

          /// Drawer items
          drawerItem(
            context: context,
            image: 'assets/icon_pic/home.png',
            newsName: 'Dashboard',
            index: 0,
          ),
          drawerItem(
            context: context,
            image: 'assets/icon_pic/smartphone.png',
            newsName: 'Users',
            index: 1,
          ),
          drawerItem(
            context: context,
            image: 'assets/icon_pic/report.png',
            newsName: 'Customer',
            index: 2,
          ),
          drawerItem(
            context: context,
            image: 'assets/icon_pic/report.png',
            newsName: 'Manage Product',
            index: 3,
          ),
          drawerItem(
            context: context,
            image: 'assets/icon_pic/report.png',
            newsName: 'Order',
            index: 4,
          ),
          drawerItem(
            context: context,
            image: 'assets/icon_pic/report.png',
            newsName: 'Report',
            index: 5,
          ),
        ],
      ),
    );
  }

  /// Get Drawer Items
  Widget drawerItem({
    required BuildContext context,
    required String image,
    required String newsName,
    required int index,
  }) {
    return ListTile(
      tileColor: Colors.transparent,
      title: Text(
        newsName,
        style: TextStyle(
          color: AppColor.textColorDark,
          fontSize: 14,
          fontFamily: 'Raleway',
        ),
      ),
      onTap: () {
        Navigator.pop(context);
      },
    );
  }
}
