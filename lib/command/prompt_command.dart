import 'package:dchat/chatgpt/chatgpt_request.dart';
import 'package:dchat/command/command_base.dart';
import 'package:dchat/configuration/configuration.dart';
import 'package:dchat/configuration/configuration_file.dart';
import 'package:dchat/prompt/prompt.dart';
import 'package:dchat/prompt/prompt_loop.dart';
import 'package:maybe_just_nothing/maybe_just_nothing.dart';

// TODO is there a way to have this as default command
class PromptCommand extends CommandBase {
  @override
  final name = "prompt";
  @override
  final description = "Start a prompt with AI";

  PromptCommand() {
    argParser.addFlag('continue', abbr: 'c', negatable: false);
  }

  @override
  void verifyInputs() {
    // if (!isConfigurationValid()) {
    //   throw InvalidInputError("Option 'xxx' is mandatory");
    // }
  }

  @override
  Future<int> runCommand() async {
    final reader = ConfigurationFileReader();
    final config = await reader.read();
    print("DEBUG: Configuration file read");

    // TODO could use may or option
    final promptConfig = PromptConfig();
    final messages = PromptLoop().init(promptConfig);

    // TODO first MVP just one question
    do {
      final maybeMessage = PromptLoop().next(promptConfig);

      bool exit = false;
      switch (maybeMessage) {
        case Just<ChatMessage>(:var value):
          print('ME: ${value.content}');
          messages.add(value);
          break;
        case Nothing<ChatMessage> _:
          print("Exiting");
          exit = true;
          break;
      }

      if (exit) {
        break;
      }

      final responseStr = await completeChat(messages, config);
      print('AI: $responseStr');
    } while (promptConfig.continueChat);

    print("Exiting");

    return 0;
  }
}
