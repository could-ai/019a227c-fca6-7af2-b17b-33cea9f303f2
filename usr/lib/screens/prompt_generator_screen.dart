import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/prompt_provider.dart';
import '../widgets/prompt_result_card.dart';

class PromptGeneratorScreen extends StatefulWidget {
  final String category;

  const PromptGeneratorScreen({super.key, required this.category});

  @override
  State<PromptGeneratorScreen> createState() => _PromptGeneratorScreenState();
}

class _PromptGeneratorScreenState extends State<PromptGeneratorScreen> {
  final _topicController = TextEditingController();
  final _audienceController = TextEditingController();
  final _durationController = TextEditingController();
  final _objectivesController = TextEditingController();

  @override
  void dispose() {
    _topicController.dispose();
    _audienceController.dispose();
    _durationController.dispose();
    _objectivesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${_getCategoryTitle(widget.category)} Generator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Generate Prompts for ${_getCategoryTitle(widget.category)}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              _buildInputField(
                controller: _topicController,
                label: 'Topic',
                hint: 'Enter the main topic or subject',
                icon: Icons.topic,
              ),
              const SizedBox(height: 16),
              _buildInputField(
                controller: _audienceController,
                label: 'Target Audience',
                hint: 'e.g., High school students, professionals, beginners',
                icon: Icons.people,
              ),
              const SizedBox(height: 16),
              _buildInputField(
                controller: _durationController,
                label: 'Video Duration',
                hint: 'e.g., 5 minutes, 10-15 minutes',
                icon: Icons.timer,
              ),
              const SizedBox(height: 16),
              _buildInputField(
                controller: _objectivesController,
                label: 'Learning Objectives',
                hint: 'What should viewers learn by the end?',
                icon: Icons.target,
                maxLines: 3,
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: _generatePrompt,
                  icon: const Icon(Icons.auto_awesome),
                  label: const Text('Generate AI Prompt'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Consumer<PromptProvider>(
                builder: (context, provider, child) {
                  if (provider.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (provider.generatedPrompt != null) {
                    return PromptResultCard(prompt: provider.generatedPrompt!);
                  }
                  return const SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    int maxLines = 1,
  }) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        filled: true,
        fillColor: Theme.of(context).colorScheme.surface,
      ),
    );
  }

  void _generatePrompt() {
    if (_topicController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a topic')),
      );
      return;
    }

    final provider = Provider.of<PromptProvider>(context, listen: false);
    provider.generatePrompt(
      category: widget.category,
      topic: _topicController.text,
      audience: _audienceController.text,
      duration: _durationController.text,
      objectives: _objectivesController.text,
    );
  }

  String _getCategoryTitle(String category) {
    switch (category) {
      case 'education':
        return 'Education';
      case 'skills':
        return 'Skills';
      case 'tutoring':
        return 'Tutoring';
      default:
        return 'Content';
    }
  }
}