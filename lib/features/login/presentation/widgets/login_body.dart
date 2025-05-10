import 'package:flutter/material.dart';
import 'package:recipe_writer/core/presentation/app_button.dart';
import 'package:recipe_writer/core/themes/themes.dart';
import 'package:recipe_writer/features/actions/presentation/screens/actions_screen.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final String _correctLogin = 'admin';
  final String _correctPassword = 'admin123';

  void _navigateToActionsScreen(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const ActionsScreen(),
      ),
    );
  }

  void _onLoginTap(BuildContext context) {
    final login = _loginController.text.trim();
    final password = _passwordController.text.trim();

    if (login == _correctLogin && password == _correctPassword) {
      _navigateToActionsScreen(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Неверный логин или пароль')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18),
        child: SizedBox(
          width: theme.columnWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 16,
            children: [
              Text(
                'Введите данные',
                style: theme.textTheme.displayLarge,
              ),
              TextField(
                controller: _loginController,
                decoration: const InputDecoration(labelText: 'Логин'),
              ),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Пароль'),
              ),
              AppButton(
                text: 'Войти',
                onTap: () => _onLoginTap(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
