import 'package:flutter/material.dart';
import 'package:mediplus/utils/assets/app_colors.dart';
import 'package:mediplus/utils/widgets/common_button.dart';
import 'package:mediplus/utils/widgets/common_password_field.dart';
import 'package:mediplus/utils/widgets/common_text_field.dart';
import 'package:mediplus/viewModel/AdminRoleProvider/add_new_user_provider.dart';
import 'package:provider/provider.dart';

class AddNewUserScreen extends StatelessWidget {
  const AddNewUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        title: Text('Add'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// User Type Dropdown
            _buildDropdown("User Type", context),

            /// First Name
            _buildTextField("First Name",
                context.read<AddNewUserProvider>().firstNameController),

            /// Last Name
            _buildTextField("Last Name",
                context.read<AddNewUserProvider>().lastNameController),

            /// Designation
            _buildTextField("Designation",
                context.read<AddNewUserProvider>().designationController),

            /// Email
            _buildTextField(
                "Email", context.read<AddNewUserProvider>().emailController),

            /// Password
            Text(
              'Password',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            CommonPasswordField(
              labelText: 'Password',
              hintText: 'Password',
            ),
            SizedBox(height: 16),

            /// Add Button
            CommonButton(
              width: double.infinity,
              buttonText: 'Add',
              buttonColor: AppColor.primaryColor,
            ),
          ],
        ),
      ),
    );
  }

  /// Build Dropdown Widget
  Widget _buildDropdown(String label, BuildContext context) {
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
        DropdownButtonFormField<String>(
          value: context.read<AddNewUserProvider>().selectedUserType,
          hint: const Text('Select User Type'),
          onChanged: (newValue) {
            context.read<AddNewUserProvider>().setUserType(newValue);
          },
          items:
              context.read<AddNewUserProvider>().userTypes.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.grey),
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  /// Build Editable Text Field Widget
  Widget _buildTextField(
    String label,
    TextEditingController controller,
  ) {
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
            labelText: label, hintText: label, controller: controller),
        const SizedBox(height: 16),
      ],
    );
  }
}
