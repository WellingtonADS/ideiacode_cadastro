import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:ideiacode_cadastro/Styles/app_styles.dart';
import 'package:ideiacode_cadastro/routing/routes.dart';
import 'package:provider/provider.dart';
import 'package:ideiacode_cadastro/services/auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Cadastro());
}

class Cadastro extends StatelessWidget {
  const Cadastro({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: AuthService(), // Use ChangeNotifierProvider.value instead of ChangeNotifierProvider
        ),
      ],
      child: MaterialApp(
        title: 'IdeiaCode Cadastro',
        theme: ThemeData(
          primaryColor: AppStyles.primaryColor,
          appBarTheme: AppStyles.appBarTheme, // Aplicando o tema da AppBar globalmente
        ),
        initialRoute: Routes.login,
        routes: Routes.getRoutes(),
      ),
    );
  }
}
