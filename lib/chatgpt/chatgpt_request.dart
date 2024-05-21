// TODO do we need a class, but if we don't, how to mock?

import 'package:dart_openai/dart_openai.dart';
import 'package:dchat/chatgpt/chatgpt_config.dart';
import 'package:dchat/prompt/prompt.dart';

Future<List<String>> requestModels(final ChatGPTConfig config) async {
  OpenAI.apiKey = config.apiKey;
  OpenAI.baseUrl = config.apiRoot;
  OpenAI.showLogs = true; // TODO should be configurable
  OpenAI.organization = null; // TODO should be configurable

  List<OpenAIModelModel> models = await OpenAI.instance.model.list();

  for (final model in models) {
    print('DEBUG: model id=${model.id}');
    OpenAIModelModel modelModel =
        await OpenAI.instance.model.retrieve(model.id);
    print('DEBUG: model=$modelModel'); // TODO pretty printing
  }

  return models.map((e) => e.id).toList();
}

Future<String> completeChat(
    List<ChatMessage> messages, ChatGPTConfig config) async {
  // TODO putting these everytime is not good, but how to do it better?
  OpenAI.apiKey = config.apiKey;
  OpenAI.baseUrl = config.apiRoot;
  OpenAI.showLogs = true; // TODO should be configurable
  OpenAI.organization = null; // TODO should be configurable

  // TODO handle different errors, like 500, or connection, or bad request
  final chatCompletion =
      await OpenAI.instance.chat.create(model: config.model, messages: [
    ...messages.map((e) => OpenAIChatCompletionChoiceMessageModel(
        role: e.isUserMessage
            ? OpenAIChatMessageRole.user
            : OpenAIChatMessageRole.assistant,
        content: e.content))
  ]);

  // TODO finish reason could be import as state to indicate to use
  // TODO also amount of used tokens
  // TODO also time spent
  return chatCompletion.choices.first.message.content;
}
