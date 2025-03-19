import 'package:flutter/material.dart';
import 'package:mediplus/view/AdminRootScreen/admin_root_screen.dart';
import 'package:mediplus/view/BillingOperatorRootScreen/billing_operator_root_screen.dart';
import 'package:mediplus/view/DeliveryPersonRootScreen/delivery_person_root_screen.dart';
import 'package:mediplus/view/ManagerRootScreen/manager_root_screen.dart';
import 'package:mediplus/view/PackagerRootScreen/packager_root_screen.dart';
import 'package:mediplus/view/ReceptionistRootScreen/receptionist_root_screen.dart';
import 'package:mediplus/viewModel/auth_provider.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          width: 350,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                spreadRadius: 2,
              )
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Logo
              Image.asset(
                "assets/app_logo/app_logo.png",
                height: 60,
              ),
              const SizedBox(height: 20),

              // Email Input
              TextField(
                controller: context.read<AuthProvider>().emailController,
                decoration: InputDecoration(
                  labelText: "Email address",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),

              // Password Input
              TextField(
                controller: context.read<AuthProvider>().passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.visibility),
                ),
              ),
              const SizedBox(height: 10),

              // Login Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    context.read<AuthProvider>().login();
                    if (context.read<AuthProvider>().role == "Admin") {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AdminRootScreen()));
                    } else if (context.read<AuthProvider>().role ==
                        "Receptionist") {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ReceptionistRootScreen()));
                    } else if (context.read<AuthProvider>().role ==
                        "Billing operator") {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  BillingOperatorRootScreen()));
                    } else if (context.read<AuthProvider>().role ==
                        "Packager") {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PackagerRootScreen()));
                    } else if (context.read<AuthProvider>().role ==
                        "Delivery person") {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  DeliveryPersonRootScreen()));
                    } else if (context.read<AuthProvider>().role == "Manager") {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ManagerRootScreen()));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(12),
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: const Text(
                    "Log In",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
