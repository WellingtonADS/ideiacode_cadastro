# Cadastro de Clientes

## Descrição

Este projeto é um aplicativo simples de cadastro de clientes desenvolvido com Flutter. O aplicativo permite aos usuários registrar uma conta, fazer login, recuperar senha e cadastrar informações pessoais como foto, nome, data de nascimento, CPF e gênero.

## Funcionalidades

- Registro de novo usuário com email e senha.
- Login de usuário existente.
- Recuperação de senha via email.
- Cadastro de informações pessoais (foto, nome, data de nascimento, CPF e gênero).

## Pré-requisitos

- Flutter 3.22.2
- Dart 3.4.3
- Visual Studio Code 1.90.1

## Estrutura do Projeto

O projeto está estruturado da seguinte forma:

lib/
├── main.dart
├── models/
│   └── cliente.dart
├── routing/
│   └── rout.dart
├── screens/
│   ├── add_client_screen.dart
│   ├── home_screen.dart
│   ├── list_clients_screen.dart
│   ├── login_screen.dart
│   ├── main_screen.dart
│   └── register_screen.dart
└── services/
    └── auth_provider.dart

### Descrição dos Arquivos

- **`main.dart`**: Arquivo principal que inicializa o aplicativo.
  
- **`models/cliente.dart`**: Define o modelo de dados para um cliente, incluindo atributos como nome, data de nascimento, CPF, etc.

- **`routing/rout.dart`**: Arquivo de definição das rotas da aplicação, que direciona para as telas específicas do aplicativo.

- **`screens/`**: Diretório contendo todas as telas do aplicativo:
  - **`add_client_screen.dart`**: Tela para adicionar um novo cliente ao sistema.
  - **`home_screen.dart`**: Tela inicial após o login, exibindo as funcionalidades principais.
  - **`list_clients_screen.dart`**: Tela que lista todos os clientes cadastrados.
  - **`login_screen.dart`**: Tela de login para acesso ao sistema.
  - **`main_screen.dart`**: Tela principal do aplicativo, responsável pela navegação entre as funcionalidades.
  - **`register_screen.dart`**: Tela de registro de novo usuário.

- **`services/auth_provider.dart`**: Provedor de serviços de autenticação com Firebase, responsável por gerenciar a autenticação dos usuários.

## Como Contribuir

1. Faça um fork deste repositório.
2. Crie uma branch para sua feature (`git checkout -b feature/nova-feature`).
3. Faça commit das suas alterações (`git commit -am 'Adiciona nova feature'`).
4. Faça push para a branch (`git push origin feature/nova-feature`).
5. Abra um Pull Request.

## Licença

Este projeto está licenciado sob a licença MIT - veja o arquivo [LICENSE](LICENSE) para mais detalhes.

## Contato

Para dúvidas e suporte, entre em contato pelo email: <contato@ideiacode.com> ou siga-nos no Instagram [@ideiacode](https://instagram.com/ideiacode).
