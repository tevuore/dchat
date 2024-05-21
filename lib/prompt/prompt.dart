class ChatMessage {
  final String content;
  final bool isUserMessage;

  const ChatMessage({
    required this.content,
    required this.isUserMessage,
  });
}

// class ChatConversation {
//   // initial message
//   final _messages = <ChatMessage>[];
//
//   void addUserRequest(String msg) {
//     _messages.add(ChatMessage(content: msg, isUserMessage: true));
//     notifyListeners();
//   }
//
//   void addAIResponse(String msg) {
//     _messages.add(ChatMessage(content: msg, isUserMessage: false));
//     notifyListeners();
//   }
//
//   void addErrorMessage(String msg) {
//     // TODO perhaps third type
//     _messages.add(ChatMessage(content: msg, isUserMessage: false));
//     notifyListeners();
//   }
//
//   List<ChatMessage> get messages {
//     return List.unmodifiable(_messages);
//   }
// }
