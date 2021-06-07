class Message {
  final String text;
  final String senderID;
  final String receiverID;

  Message(this.text, this.senderID, this.receiverID);
}

class User {
  String name;
  String chatID;

  User(this.name, this.chatID);
}
