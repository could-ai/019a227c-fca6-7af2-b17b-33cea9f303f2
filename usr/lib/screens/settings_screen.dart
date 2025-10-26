import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'App Settings',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Card(
              child: Column(
                children: [
                  ListTile(
                    title: const Text('Theme'),
                    subtitle: const Text('Light mode (Dark mode coming soon)'),
                    leading: const Icon(Icons.palette),
                  ),
                  const Divider(),
                  ListTile(
                    title: const Text('Language'),
                    subtitle: const Text('English'),
                    leading: const Icon(Icons.language),
                  ),
                  const Divider(),
                  ListTile(
                    title: const Text('Notifications'),
                    subtitle: const Text('Enable push notifications'),
                    leading: const Icon(Icons.notifications),
                    trailing: Switch(
                      value: false,
                      onChanged: (value) {
                        // TODO: Implement notification settings
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'About',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'CouldAI Tutor v1.0.0',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Generate professional prompts for AI-powered educational videos. Perfect for teachers, tutors, and content creators.',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}