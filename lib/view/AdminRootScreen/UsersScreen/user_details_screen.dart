import 'package:flutter/material.dart';
import 'package:mediplus/utils/assets/app_colors.dart';
import 'package:mediplus/utils/widgets/common_button.dart';
import 'package:mediplus/utils/widgets/common_text_field.dart';

class UserDetailsScreen extends StatelessWidget {
  const UserDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.secondaryColor,
        title: Text(
          'Edit',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          children: [
            /// Form Fields
            _buildTextField("User Type", TextEditingController()),
            _buildTextField("First Name", TextEditingController()),
            _buildTextField("Last Name", TextEditingController()),
            _buildTextField("Designation", TextEditingController()),
            _buildTextField("Email", TextEditingController()),
            _buildTextField("Password", TextEditingController(),
                isPassword: true),
            const SizedBox(height: 24),

            CommonButton(
              width: double.infinity,
              buttonText: 'Update',
              buttonColor: AppColor.primaryColor,
            ),
          ],
        ),
      ),
    );
  }

  /// Build Text Field Widget
  Widget _buildTextField(String label, TextEditingController controller,
      {bool isPassword = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        CommonTextField(
          controller: TextEditingController(),
          hintText: label,
          labelText: label,
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
