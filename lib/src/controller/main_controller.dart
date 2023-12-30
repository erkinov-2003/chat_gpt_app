import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:flutter/material.dart';

import '../data/model/open_ai_model.dart';

class MainController extends ChangeNotifier {
  List<ChatGPTModel> chatList = [];

  Future sendMessage(OpenAI openAI, TextEditingController controller) async {
    final response = await openAI.onCompletion(
      request: CompleteText(
        prompt: controller.text,
        model: TextBabbage001Model(),
      ),
    );
    chatList.add(
      ChatGPTModel(
        message: controller.text,
        alignmentMessage: true,
      ),
    );
    notifyListeners();

    if (controller.text.trim().isNotEmpty) {
      return;
    }

    if (response != null && response.choices.isNotEmpty) {
      chatList.add(
        ChatGPTModel(
          message: response.choices.last.text,
          alignmentMessage: false,
        ),
      );
      notifyListeners();
    }
    controller.clear();
    notifyListeners();
  }
}