import 'package:flutter/material.dart';

class PromptProvider extends ChangeNotifier {
  String? _generatedPrompt;
  bool _isLoading = false;

  String? get generatedPrompt => _generatedPrompt;
  bool get isLoading => _isLoading;

  void generatePrompt({
    required String category,
    required String topic,
    String? audience,
    String? duration,
    String? objectives,
  }) {
    _isLoading = true;
    notifyListeners();

    // Simulate API call delay
    Future.delayed(const Duration(seconds: 2), () {
      _generatedPrompt = _buildPrompt(
        category: category,
        topic: topic,
        audience: audience,
        duration: duration,
        objectives: objectives,
      );
      _isLoading = false;
      notifyListeners();
    });
  }

  String _buildPrompt({
    required String category,
    required String topic,
    String? audience,
    String? duration,
    String? objectives,
  }) {
    final buffer = StringBuffer();

    buffer.writeln('AI Video Tutorial Prompt:');
    buffer.writeln('Topic: $topic');
    buffer.writeln('Category: ${_getCategoryDisplayName(category)}');

    if (audience?.isNotEmpty ?? false) {
      buffer.writeln('Target Audience: $audience');
    }

    if (duration?.isNotEmpty ?? false) {
      buffer.writeln('Video Duration: $duration');
    }

    if (objectives?.isNotEmpty ?? false) {
      buffer.writeln('Learning Objectives: $objectives');
    }

    buffer.writeln();
    buffer.writeln('Video Script Structure:');
    buffer.writeln('1. Introduction (30 seconds): Hook the audience and state the learning objective');
    buffer.writeln('2. Main Content (Core of video): Explain concepts with visuals and examples');
    buffer.writeln('3. Practice/Examples (20% of time): Show practical applications');
    buffer.writeln('4. Conclusion (30 seconds): Summarize key points and next steps');

    buffer.writeln('Visual Style: Clean, professional, educational');
    buffer.writeln('Tone: Engaging, clear, encouraging');

    return buffer.toString();
  }

  String _getCategoryDisplayName(String category) {
    switch (category) {
      case 'education':
        return 'Education & Lecturing';
      case 'skills':
        return 'Skills Acquisition';
      case 'tutoring':
        return 'Learning & Tutoring';
      default:
        return category;
    }
  }

  void clearPrompt() {
    _generatedPrompt = null;
    notifyListeners();
  }
}