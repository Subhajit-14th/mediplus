import 'package:flutter/material.dart';
import 'package:mediplus/utils/assets/app_colors.dart';
import 'package:mediplus/utils/widgets/common_button.dart';
import 'package:mediplus/view/AdminRootScreen/UsersScreen/add_new_user_screen.dart';
import 'package:mediplus/view/AdminRootScreen/UsersScreen/user_details_screen.dart';
import 'package:mediplus/viewModel/AdminRoleProvider/user_screen_provider.dart';
import 'package:provider/provider.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: CommonButton(
            width: 140,
            buttonText: "Add New",
            buttonColor: AppColor.primaryColor,
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddNewUserScreen()));
            },
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: context.read<UserScreenProvider>().userList.length,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.only(left: 16, right: 16, top: 16),
            itemBuilder: (context, index) {
              return Dismissible(
                key: Key("$index"),
                direction: DismissDirection.endToStart,
                background: Container(
                  margin: EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: const Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                ),
                confirmDismiss: (direction) async {
                  return await _showDeleteConfirmationDialog(context, index);
                },
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 16),
                      padding: EdgeInsets.only(
                          left: 10, right: 10, bottom: 10, top: 30),
                      decoration: BoxDecoration(
                        color: AppColor.textColorLight,
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: [
                          BoxShadow(
                            color: AppColor.textColorDark.withAlpha(50),
                            blurRadius: 10,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          /// User Type
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'User Type',
                                style: TextStyle(
                                  color: AppColor.textColorDark,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(context
                                  .read<UserScreenProvider>()
                                  .userList[index]
                                  .userType),
                            ],
                          ),
                          SizedBox(height: height * 0.01),

                          /// First Name
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'First Name',
                                style: TextStyle(
                                  color: AppColor.textColorDark,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(context
                                  .read<UserScreenProvider>()
                                  .userList[index]
                                  .firstName),
                            ],
                          ),
                          SizedBox(height: height * 0.01),

                          /// Last Name
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Last Name',
                                style: TextStyle(
                                  color: AppColor.textColorDark,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(context
                                  .read<UserScreenProvider>()
                                  .userList[index]
                                  .lastName),
                            ],
                          ),
                          SizedBox(height: height * 0.01),

                          /// Designation
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Designation',
                                style: TextStyle(
                                  color: AppColor.textColorDark,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(context
                                  .read<UserScreenProvider>()
                                  .userList[index]
                                  .designation),
                            ],
                          ),
                          SizedBox(height: height * 0.01),

                          /// Email
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Email',
                                style: TextStyle(
                                  color: AppColor.textColorDark,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(context
                                  .read<UserScreenProvider>()
                                  .userList[index]
                                  .email),
                            ],
                          ),
                          SizedBox(height: height * 0.01),
                        ],
                      ),
                    ),
                    Positioned(
                      right: 0,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UserDetailsScreen()));
                        },
                        child: Container(
                          width: 35,
                          height: 30,
                          alignment: Alignment.topRight,
                          decoration: BoxDecoration(
                            color: AppColor.primaryColor,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(14),
                              bottomLeft: Radius.circular(14),
                            ),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.edit,
                              size: 20,
                              color: AppColor.textColorLight,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }

  /// Show Delete Confirmation Dialog
  Future<bool?> _showDeleteConfirmationDialog(
      BuildContext context, int index) async {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Confirm Delete'),
          content: const Text('Are you sure you want to delete this user?'),
          actions: [
            CommonButton(
              width: double.infinity,
              buttonText: 'No',
              buttonColor: Colors.white,
              buttonTxtColor: AppColor.textColorDark,
              onTap: () {
                Navigator.of(dialogContext).pop(false); // Cancel
              },
            ),
            SizedBox(height: 10),
            CommonButton(
              width: double.infinity,
              buttonText: 'Yes',
              buttonColor: AppColor.primaryColor,
              buttonTxtColor: AppColor.textColorDark,
              onTap: () {
                Navigator.of(dialogContext).pop(true); // yes
              },
            ),
          ],
        );
      },
    );
  }
}
