import 'package:bookstore/src/logic/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/link.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Align(
              alignment: Alignment.topCenter,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 400),
                child: const Card(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 18, horizontal: 12),
                    child: SettingsContent(),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}

class SettingsContent extends ConsumerWidget {
  const SettingsContent({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        ...[
          Text(
            'Settings',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          FilledButton(
            onPressed: () {
              ref.read(loginLogic.notifier).logout();
            },
            child: const Text('Sign out'),
          ),
          const Text('Example using the Link widget:'),
          Link(
            uri: Uri.parse('/books/all/book/0'),
            builder: (context, followLink) => TextButton(
              onPressed: followLink,
              child: const Text('/books/all/book/0'),
            ),
          ),
          const Text('Example using GoRouter.of(context).go():'),
          TextButton(
            child: const Text('/books/all/book/0'),
            onPressed: () {
              GoRouter.of(context).go('/books/all/book/0');
            },
          ),
        ].map((w) => Padding(padding: const EdgeInsets.all(8), child: w)),
        const Text('Displays a dialog on the root Navigator:'),
        TextButton(
          onPressed: () => showDialog<String>(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Alert!'),
              content: const Text('The alert description goes here.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Cancel'),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context, 'OK'),
                  child: const Text('OK'),
                ),
              ],
            ),
          ),
          child: const Text('Show Dialog'),
        )
      ],
    );
  }
}
