import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/prompt_provider.dart';

class PromptHistoryScreen extends StatelessWidget {
  const PromptHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prompt History'),
      ),
      body: Consumer<PromptProvider>(
        builder: (context, provider, child) {
          // For now, just show the current prompt if it exists
          // In a full implementation, this would show a list of saved prompts
          if (provider.generatedPrompt != null) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Recent Prompt',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Text(
                        provider.generatedPrompt!,
                        style: const TextStyle(
                          fontSize: 16,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }

          return const Center(
            child: Text(
              'No prompts generated yet.\nCreate your first AI video prompt!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          );
        },
      ),
    );
  }
}