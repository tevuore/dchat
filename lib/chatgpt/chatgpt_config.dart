import 'package:meta/meta.dart';

@immutable
class ChatGPTConfig {
  final String model;
  final String apiRoot;
  final String apiKey;

  const ChatGPTConfig({
    required this.apiRoot,
    required this.model,
    required this.apiKey,
  });
}
