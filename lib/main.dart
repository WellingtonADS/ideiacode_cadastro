import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ideiacode_cadastro/services/auth_check.dart';
import 'firebase_options.dart';
import 'package:ideiacode_cadastro/Styles/app_styles.dart';
import 'package:provider/provider.dart';
import 'package:ideiacode_cadastro/services/auth_service.dart';

/// Função principal que inicializa o aplicativo Flutter.
/// 
/// Essa função é chamada automaticamente quando o aplicativo é iniciado.
/// Ela garante que o Flutter esteja inicializado corretamente e, em seguida,
/// inicializa o Firebase usando as opções padrão definidas em [DefaultFirebaseOptions.currentPlatform].
/// Em seguida, ela inicia o aplicativo chamando a classe [MyApp].
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

/// Classe principal do aplicativo Flutter.
/// 
/// Essa classe é um widget stateless que cria a estrutura básica do aplicativo.
/// Ela utiliza o widget [MultiProvider] para fornecer a instância do [AuthService]
/// para os widgets filhos. Além disso, define o tema do aplicativo e define a
/// tela inicial como [AuthCheck].
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ 
        ChangeNotifierProvider(create: (_) => AuthService()),  
      ],
      child: MaterialApp(
        title: 'IdeiaCode Cadastro',
        theme: ThemeData(
          primaryColor: AppStyles.primaryColor,
          appBarTheme: AppStyles.appBarTheme,
        ),
        home: const AuthCheck(),
      ),
    );
  }
}
