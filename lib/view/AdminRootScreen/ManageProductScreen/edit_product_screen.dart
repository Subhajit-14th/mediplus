import 'package:flutter/material.dart';
import 'package:mediplus/utils/assets/app_colors.dart';
import 'package:mediplus/utils/widgets/common_button.dart';
import 'package:mediplus/utils/widgets/common_text_field.dart';
import 'package:mediplus/viewModel/AdminRoleProvider/manage_product_provider.dart';
import 'package:provider/provider.dart';

class EditProductScreen extends StatelessWidget {
  const EditProductScreen(
      {super.key, required this.productName, required this.productIndex});

  final String productName;
  final int productIndex;

  @override
  Widget build(BuildContext context) {
    // Pre-fill the text field with the current product name
    context.read<ManageProductProvider>().editProductController.text =
        productName;
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
                'Edit Product',
                style: TextStyle(
                  color: AppColor.textColorDark,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              CommonTextField(
                labelText: 'Edit product',
                hintText: 'Edit product',
                controller:
                    context.read<ManageProductProvider>().editProductController,
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
                        String updatedProductName = context
                            .read<ManageProductProvider>()
                            .editProductController
                            .text;
                        if (updatedProductName.isNotEmpty) {
                          context
                              .read<ManageProductProvider>()
                              .updateProduct(productIndex, updatedProductName);
                          Navigator.pop(context); // Pop after editing
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Product name cannot be empty!'),
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
