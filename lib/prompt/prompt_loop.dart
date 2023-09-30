import 'dart:io';

import 'package:dchat/configuration/configuration.dart';
import 'package:dchat/prompt/prompt.dart';
import 'package:maybe_just_nothing/maybe_just_nothing.dart';

/// Decides what input to request from the user
class PromptLoop {
  List<ChatMessage> init(PromptConfig config) {
    // TODO impl where configurable  custom instructions
    return [
      ChatMessage(
          content: 'As IT expert your answers are short and concise',
          isUserMessage: true)
    ];
  }

  Maybe<ChatMessage> next(PromptConfig config) {
    // TODO read command line
    print("ME:");

    final userPrompt = Just(stdin.readLineSync()).type<String>();

    return userPrompt
        .map((value) => ChatMessage(content: value, isUserMessage: true));
  }
}
