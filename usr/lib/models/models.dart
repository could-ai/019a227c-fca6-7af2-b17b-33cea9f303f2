import 'package:flutter/material.dart';

class CategoryModel {
  final String id;
  final String title;
  final String description;
  final IconData icon;
  final Color color;

  const CategoryModel({
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
  });
}

class PromptModel {
  final String id;
  final String category;
  final String topic;
  final String? audience;
  final String? duration;
  final String? objectives;
  final String generatedPrompt;
  final DateTime createdAt;

  const PromptModel({
    required this.id,
    required this.category,
    required this.topic,
    this.audience,
    this.duration,
    this.objectives,
    required this.generatedPrompt,
    required this.createdAt,
  });
}