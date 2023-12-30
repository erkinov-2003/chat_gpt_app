import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/main_controller.dart';
import '../../core/config/app_config.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_icons.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late TextEditingController controller;
  late OpenAI openAIChatSdk;

  @override
  void initState() {
    openAIChatSdk = OpenAI.instance.build(token: AppConfig.apiKey);
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MainController>(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Welcome to ChatGPT",
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontFamily: "Raleway",
              ),
        ),
        backgroundColor: AppColors.backgroundColor,
        actions: const [
          Padding(
            padding: EdgeInsets.all(16),
            child: Image(
              image: AssetImage(AppIcons.gptLogo),
              height: 24,
              fit: BoxFit.cover,
            ),
          ),
        ],
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 23,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Expanded(
                flex: 7,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(6),
                  itemCount: provider.chatList.length,
                  itemBuilder: (context, index) {
                    return Align(
                      alignment: provider.chatList[index].alignmentMessage
                          ? Alignment.centerLeft
                          : Alignment.centerRight,
                      child: Card(
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        )),
                        color: provider.chatList[index].alignmentMessage
                            ? Colors.blue
                            : Colors.green,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            provider.chatList[index].message,
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color: Colors.white,
                                  fontFamily: "Raleway",
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: size.height * 0.030),
              Expanded(
                child: TextField(
                  controller: controller,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "Savolingizni kiriting!",
                    hintStyle:
                        Theme.of(context).textTheme.titleMedium!.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(10),
                      child: GestureDetector(
                        onTap: () async {
                          if (controller.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Iltimos bosh qoldirmang"),
                              ),
                            );
                          }
                          await provider.sendMessage(openAIChatSdk, controller);
                          controller.clear();
                        },
                        child: SizedBox(
                          height: 40,
                          width: 40,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: AppColors.buttonColor,
                              border:
                                  Border.all(color: Colors.white, width: 0.4),
                            ),
                            child: const Center(
                              child: Image(
                                image: AssetImage(AppIcons.sendIcon),
                                height: 24,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 0.5),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 0.5),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
