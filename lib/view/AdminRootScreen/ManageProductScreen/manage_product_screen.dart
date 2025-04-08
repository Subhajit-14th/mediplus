import 'package:flutter/material.dart';
import 'package:mediplus/utils/assets/app_colors.dart';
import 'package:mediplus/utils/widgets/common_button.dart';
import 'package:mediplus/view/AdminRootScreen/ManageProductScreen/add_new_product.dart';
import 'package:mediplus/view/AdminRootScreen/ManageProductScreen/edit_product_screen.dart';
import 'package:mediplus/viewModel/AdminRoleProvider/manage_product_provider.dart';
import 'package:provider/provider.dart';

class ManageProductScreen extends StatelessWidget {
  const ManageProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Add new Product Button
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CommonButton(
            width: 150,
            buttonText: 'Add New',
            buttonColor: AppColor.primaryColor,
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AddNewProduct(),
              );
            },
          ),
        ),
        SizedBox(height: 16),

        Consumer<ManageProductProvider>(builder: (context, provider, child) {
          return ListView.builder(
            itemCount: provider.productList.length,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.only(left: 16, right: 16),
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(bottom: 16),
                padding: EdgeInsets.all(10),
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
                child: Row(
                  children: [
                    Text(
                      provider.productList[index],
                      style: TextStyle(
                        color: AppColor.textColorDark,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),

                    /// Edit Icon
                    InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => EditProductScreen(
                            productName: provider.productList[index],
                            productIndex: index,
                          ),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: AppColor.primaryColor,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Icon(
                          Icons.edit,
                          color: AppColor.textColorLight,
                        ),
                      ),
                    ),
                    SizedBox(width: 6),

                    /// Delete Icon
                    InkWell(
                      onTap: () async {
                        final res =
                            await _showDeleteConfirmationDialog(context, index);
                        if (res != null && res) {
                          provider.removeProduct(index);
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
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
                        child: Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        }),
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
                Navigator.of(dialogContext).pop(true);
              },
            ),
          ],
        );
      },
    );
  }
}
