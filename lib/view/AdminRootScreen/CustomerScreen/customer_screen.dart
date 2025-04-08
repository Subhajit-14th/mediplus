import 'package:flutter/material.dart';
import 'package:mediplus/utils/assets/app_colors.dart';
import 'package:mediplus/viewModel/AdminRoleProvider/customer_screen_provider.dart';
import 'package:provider/provider.dart';

class CustomerScreen extends StatelessWidget {
  const CustomerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return ListView.builder(
      itemCount: context.read<CustomerScreenProvider>().customerModel.length,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.only(left: 16, right: 16, top: 16),
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
          child: Column(
            children: [
              /// Customer Name
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Customer Name',
                    style: TextStyle(
                      color: AppColor.textColorDark,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(context
                      .read<CustomerScreenProvider>()
                      .customerModel[index]
                      .name),
                ],
              ),
              SizedBox(height: height * 0.01),

              /// Mobile
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Mobile',
                    style: TextStyle(
                      color: AppColor.textColorDark,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(context
                      .read<CustomerScreenProvider>()
                      .customerModel[index]
                      .mobile),
                ],
              ),
              SizedBox(height: height * 0.01),

              /// Patients
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Patients',
                    style: TextStyle(
                      color: AppColor.textColorDark,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(context
                      .read<CustomerScreenProvider>()
                      .customerModel[index]
                      .patients),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
