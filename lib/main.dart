import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ideiacode_cadastro/services/auth_check.dart';
import 'firebase_options.dart';
import 'package:ideiacode_cadastro/Styles/app_styles.dart';
import 'package:provider/provider.dart';
import 'package:ideiacode_cadastro/services/auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        //ChangeNotifierProvider.value(
          //value: AuthService(), // Use ChangeNotifierProvider.value instead of ChangeNotifierProvider
        ChangeNotifierProvider(create: (_) => AuthService()),  
      ],
      child: MaterialApp(
        title: 'IdeiaCode Cadastro',
        theme: ThemeData(
          primaryColor: AppStyles.primaryColor,
          appBarTheme: AppStyles.appBarTheme, // Aplicando o tema da AppBar globalmente
        ),
        
        
        home: const AuthCheck(),//novo contexto
      ),
    );
  }
}
