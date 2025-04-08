import 'package:flutter/material.dart';
import 'package:mediplus/utils/assets/app_colors.dart';
import 'package:mediplus/utils/widgets/common_text_field.dart';

class CreateOrderScreen extends StatelessWidget {
  const CreateOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.textColorLight,
      appBar: AppBar(
        title: Text(
          'Create Order',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textFieldWithHeading(label: 'Mobile Number'),
              SizedBox(height: 16),
              textFieldWithHeading(label: 'Customer Name'),
              SizedBox(height: 16),
              textFieldWithHeading(label: 'Patient'),
              SizedBox(height: 16),
              textFieldWithHeading(label: 'Doctor Name'),
              SizedBox(height: 16),
              textFieldWithHeading(label: 'Whatsapp Number'),
              SizedBox(height: 16),
              textFieldWithHeading(label: 'Address Line 1', maxlines: 2),
              SizedBox(height: 16),
              textFieldWithHeading(label: 'Address Line 2', maxlines: 2),
            ],
          ),
        ),
      ),
    );
  }

  /// text field with heading
  Widget textFieldWithHeading({
    required String label,
    int? maxlines,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            color: AppColor.textColorDark,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 6),
        CommonTextField(
          labelText: label,
          hintText: label,
          controller: TextEditingController(),
          maxLines: maxlines,
        ),
      ],
    );
  }
}
