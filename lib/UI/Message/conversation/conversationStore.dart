import 'package:flutter/widgets.dart';
import 'package:privacee/UI/Message/contact.dart';
import 'package:privacee/UI/Message/sms.dart';

class ConversationStore extends InheritedWidget {
  const ConversationStore(this.userProfile, this.thread, {Widget child})
      : super(child: child);

  final UserProfile userProfile;
  final SmsThread thread;

  static ConversationStore of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(ConversationStore)
        as ConversationStore;
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }
}
