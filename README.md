# Cadastro de Clientes

## Descrição

Este projeto é um aplicativo simples de cadastro de clientes desenvolvido com Flutter. O aplicativo permite aos usuários registrar uma conta, fazer login, recuperar senha e cadastrar informações pessoais como foto, nome, data de nascimento, CPF e gênero. Os dados dos usuários são armazenados no Firebase Firestore.

## Funcionalidades

- Registro de novo usuário com email e senha.
- Login de usuário existente.
- Recuperação de senha via email.
- Cadastro de informações pessoais (foto, nome, data de nascimento, CPF e gênero).
- Armazenamento de dados no Firebase Firestore.

## Pré-requisitos

- Flutter 3.22.2
- Dart 3.4.3
- Firebase account
- Visual Studio Code 1.90.1
- Java 17.0.11
- Node.js 20.9.0

## Configuração do Ambiente

### 1. Clone o repositório

```bash
git clone https://github.com/seu-usuario/cadastro-clientes.git
cd cadastro-clientes
```

### 2. Instale as dependências

```bash
flutter pub get
```

### 3. Configure o Firebase

- Acesse o [Firebase Console](https://console.firebase.google.com/).
- Crie um novo projeto no Firebase.
- Adicione um aplicativo Android e/ou iOS ao seu projeto Firebase e siga as instruções para obter os arquivos `google-services.json` (para Android) e/ou `GoogleService-Info.plist` (para iOS).
- Coloque o arquivo `google-services.json` na pasta `android/app` e/ou `GoogleService-Info.plist` na pasta `ios/Runner`.

### 4. Configure o `pubspec.yaml`

Verifique se as dependências do Firebase estão corretas:

```yaml
dependencies:
  flutter:
    sdk: flutter
  firebase_core: ^2.12.0
  firebase_auth: ^4.8.0
  cloud_firestore: ^5.2.0
  provider: ^6.0.5
  image_picker: ^0.8.7
```

### 5. Execute o aplicativo

```bash
flutter run
```

## Estrutura do Projeto

lib/
├── main.dart
├── models/
│   └── user_model.dart
├── screens/
│   ├── login_screen.dart
│   ├── registration_screen.dart
│   ├── password_recovery_screen.dart
│   └── user_details_screen.dart
├── services/
│   ├── auth_service.dart
│   └── user_service.dart

## Descrição dos Arquivos

- `main.dart`: Arquivo principal que inicializa o Firebase e configura o provedor de estado.
- `user_model.dart`: Modelo de dados do usuário.
- `login_screen.dart`: Tela de login.
- `registration_screen.dart`: Tela de registro de novo usuário.
- `password_recovery_screen.dart`: Tela de recuperação de senha.
- `user_details_screen.dart`: Tela de cadastro de informações pessoais.
- `auth_service.dart`: Serviço de autenticação com Firebase.
- `user_service.dart`: Serviço de gerenciamento de dados do usuário no Firestore.

## Como Contribuir

1. Faça um fork do repositório.
2. Crie uma branch para sua feature (`git checkout -b feature/nova-feature`).
3. Faça commit das suas alterações (`git commit -am 'Adiciona nova feature'`).
4. Faça push para a branch (`git push origin feature/nova-feature`).
5. Abra um Pull Request.

## Licença

Este projeto está licenciado sob a licença MIT - veja o arquivo [LICENSE](LICENSE) para mais detalhes.

## Contato

Para dúvidas e suporte, entre em contato pelo email: <ideiacode@ideiacode.com> ou siga-nos no Instagram [@ideiacode](https://instagram.com/ideiacode).
