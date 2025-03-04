import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_writer/features/create_tag/presentation/notifier/create_tag_notifier.dart';
import 'package:recipe_writer/features/create_tag/presentation/widgets/create_tag_body.dart';

class CreateTagScreen extends StatelessWidget {
  const CreateTagScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CreateTagNotifier(),
      builder: (context, child) {
        return Scaffold(
          body: CreateTagBody(),
        );
      }
    );
  }
}
