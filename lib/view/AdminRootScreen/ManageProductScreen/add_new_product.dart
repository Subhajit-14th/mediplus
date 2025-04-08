import 'package:flutter/material.dart';
import 'package:mediplus/utils/assets/app_colors.dart';
import 'package:mediplus/utils/widgets/common_button.dart';
import 'package:mediplus/utils/widgets/common_text_field.dart';
import 'package:mediplus/viewModel/AdminRoleProvider/manage_product_provider.dart';
import 'package:provider/provider.dart';

class AddNewProduct extends StatelessWidget {
  const AddNewProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: Container(
          margin: EdgeInsets.only(left: 16, right: 16),
          padding: EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: AppColor.textColorLight,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Add New Product',
                style: TextStyle(
                  color: AppColor.textColorDark,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              CommonTextField(
                labelText: 'Add new product',
                hintText: 'Add new product',
                controller: context
                    .read<ManageProductProvider>()
                    .addNewProductController,
              ),
              SizedBox(height: 10),
              Row(
                spacing: 30,
                children: [
                  Expanded(
                    child: CommonButton(
                      width: double.infinity,
                      buttonText: 'Cancel',
                      buttonColor: AppColor.textColorLight,
                      buttonTxtColor: AppColor.textColorDark,
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Expanded(
                    child: CommonButton(
                      width: double.infinity,
                      buttonText: 'Yes',
                      buttonColor: AppColor.primaryColor,
                      buttonTxtColor: AppColor.textColorDark,
                      onTap: () {
                        String productName = context
                            .read<ManageProductProvider>()
                            .addNewProductController
                            .text;

                        if (productName.isNotEmpty) {
                          context
                              .read<ManageProductProvider>()
                              .addNewProduct(productName);

                          /// Clear the text field after adding
                          context
                              .read<ManageProductProvider>()
                              .addNewProductController
                              .clear();

                          /// Pop from the current screen after adding the product
                          Navigator.pop(context);
                        } else {
                          /// Show a snackbar if the field is empty
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content:
                                  Text('Please enter a valid product name.'),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
