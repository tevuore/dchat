import 'package:dchat/chatgpt/chatgpt_config.dart';
import 'package:dchat/configuration/configuration.dart';
import 'package:toml/toml.dart';

class ConfigurationFileReader implements IConfigurationReader {
  // TODO should return generic config
  Future<ChatGPTConfig> read() async {
    var document =
        await TomlDocument.load('/home/tevuore/.rchat.toml'); // TODO change

    final map = document.toMap();

    return ChatGPTConfig(
      apiRoot: 'https://api.openai.com',
      model: map['chatgpt']['model'] as String,
      apiKey: map['chatgpt']['api_key'] as String,
    );
  }
}
