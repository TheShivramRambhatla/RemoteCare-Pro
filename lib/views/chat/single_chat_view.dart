import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../resources/components/custom_back_button_widget.dart';

class SingleChatView extends StatefulWidget {
  const SingleChatView({Key? key}) : super(key: key);

  @override
  _SingleChatViewState createState() => _SingleChatViewState();
}

class _SingleChatViewState extends State<SingleChatView> {
  late TextEditingController _textEditingController;
  List<Map<String, String>> messages = [];

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    // Adding sample messages from the doctor
    messages.add(
        {'sender': 'Doctor', 'message': "You've been diagnosed with Fever"});
    messages.add({
      'sender': 'Doctor',
      'message': 'Prescription:\nParacetamol - 3 per Day\nAjax - 2 per day'
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        leading: const CustomBackButtonWidget(),
        title: ListTile(
          leading: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColorLight,
              shape: BoxShape.circle,
              border: Border.all(
                color: Theme.of(context).disabledColor.withOpacity(0.5),
              ),
              image: const DecorationImage(
                image: AssetImage("assets/images/doctor1.png"),
              ),
            ),
          ),
          title: Text(
            "Vinita Dhiwer",
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).primaryColorLight,
                ),
          ),
          subtitle: Text(
            "Online",
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Theme.of(context).primaryColorLight,
                ),
          ),
          trailing: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColorLight,
              shape: BoxShape.circle,
              border: Border.all(
                color: Theme.of(context).disabledColor.withOpacity(0.5),
              ),
            ),
            child: const Icon(
              CupertinoIcons.ellipsis_vertical,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColorLight,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: messages.length,
                itemBuilder: (_, index) {
                  final data = messages[index];
                  final bool isDoctor = data['sender'] == 'Doctor';
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: isDoctor
                        ? CrossAxisAlignment.start
                        : CrossAxisAlignment.end,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(20),
                        margin: EdgeInsets.only(
                          left: isDoctor ? 0 : 40,
                          right: isDoctor ? 40 : 0,
                          bottom: 6,
                        ),
                        decoration: BoxDecoration(
                          color: isDoctor
                              ? Theme.of(context).primaryColorLight
                              : Theme.of(context).primaryColor,
                          border: isDoctor
                              ? Border.all(
                                  width: 0.5,
                                  color: Theme.of(context).disabledColor)
                              : null,
                          borderRadius: BorderRadius.only(
                            topLeft: const Radius.circular(12),
                            topRight: const Radius.circular(12),
                            bottomLeft: isDoctor
                                ? const Radius.circular(0)
                                : const Radius.circular(12),
                            bottomRight: isDoctor
                                ? const Radius.circular(12)
                                : const Radius.circular(0),
                          ),
                        ),
                        child: Text(
                          data['message']!,
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: isDoctor
                                        ? Theme.of(context).primaryColorDark
                                        : Theme.of(context).primaryColorLight,
                                  ),
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  );
                },
              ),
            ),
          ),
          Container(
            color: Theme.of(context).primaryColorLight,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Theme.of(context).disabledColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextField(
                      controller: _textEditingController,
                      keyboardType: TextInputType.text,
                      onSubmitted: _sendMessage,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Type a message here...',
                        hintStyle: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: Theme.of(context).disabledColor),
                      ),
                      maxLines: null,
                      minLines: 1,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(CupertinoIcons.arrow_right_circle_fill),
                  onPressed: () {
                    _sendMessage(_textEditingController.text);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _sendMessage(String text) {
    if (text.trim().isNotEmpty) {
      setState(() {
        messages.add({'sender': 'Me', 'message': text});
        _textEditingController.clear();
      });
    }
  }
}
