import 'package:flutter/material.dart';
import 'package:mediplus/splash_screen.dart';
import 'package:mediplus/utils/assets/app_colors.dart';
import 'package:mediplus/viewModel/AdminRoleProvider/add_new_user_provider.dart';
import 'package:mediplus/viewModel/AdminRoleProvider/admin_role_screen_route_provider.dart';
import 'package:mediplus/viewModel/AdminRoleProvider/customer_screen_provider.dart';
import 'package:mediplus/viewModel/AdminRoleProvider/manage_product_provider.dart';
import 'package:mediplus/viewModel/AdminRoleProvider/user_screen_provider.dart';
import 'package:mediplus/viewModel/auth_provider.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(
            create: (context) => AdminRoleScreenRouteProvider()),
        ChangeNotifierProvider(create: (context) => UserScreenProvider()),
        ChangeNotifierProvider(create: (context) => AddNewUserProvider()),
        ChangeNotifierProvider(create: (context) => CustomerScreenProvider()),
        ChangeNotifierProvider(create: (context) => ManageProductProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mediplus',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primaryColor),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}
