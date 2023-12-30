class ChatGPTModel {
  final String message;
  final bool alignmentMessage;
  ChatGPTModel({
    required this.message,
    required this.alignmentMessage,
  });

  Map<String, dynamic> toMap() {
    return {
      'message': message,
      'alignmentMessage': alignmentMessage,
    };
  }

  factory ChatGPTModel.fromMap(Map<String, dynamic> map) {
    return ChatGPTModel(
      message: map['message'] as String,
      alignmentMessage: map['alignmentMessage'] as bool,
    );
  }
}