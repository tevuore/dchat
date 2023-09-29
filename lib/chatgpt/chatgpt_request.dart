// TODO do we need a class, but if we don't, how to mock?

import 'package:dart_openai/dart_openai.dart';
import 'package:dchat/chatgpt/chatgpt_config.dart';

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
