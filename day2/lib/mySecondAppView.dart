import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ChatListView extends StatefulWidget {
  const ChatListView({Key? key}) : super(key: key);

  @override
  State<ChatListView> createState() => _ChatListViewState();
}

class _ChatListViewState extends State<ChatListView> {

  late ChatService _chatServie;
  late List<int> _idList;

  @override
  void initState() {
    _chatServie = ChatService();
    _chatServie.addChatRoom();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Widget displayChatRoom({required int id}){
    return ListTile(
      leading: Text(_chatServie.getChatName(id: id)),
      title: const Text('chat room is here'),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('chat list'),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return displayChatRoom(id: _idList[index]);
        }, 
        separatorBuilder: (_, i) => const Divider(), 
        itemCount: _chatServie.getNumberOfChatRooms(),
      )
    );
  }
}

class ChatMessage{
  final ChatUser whoSent;
  final String message;
  final String whenSent;

  ChatMessage(this.whoSent, this.message, this.whenSent);
}
class ChatUser{
  final String name;

  ChatUser(this.name);
}
class ChatRoom{
  final int id;
  final List<ChatMessage>? chatMessages;
  final List<ChatUser>? chatUsers;
  final String? _chatRoomName;
  final int? _userCount;

  String get chatRoomName => _chatRoomName ?? 'not named yet';
  int get userCount => _userCount ?? 0;
  int get roomId => id;

  ChatRoom(this.chatMessages, this.chatUsers, this._chatRoomName, this._userCount, {required this.id});
}

class ChatService{
  List<ChatRoom> _chatRooms = [];

  static final ChatService _shared = ChatService._sharedInstance();
  ChatService._sharedInstance();
  factory ChatService() => _shared;

  int getNumberOfChatRooms() => _chatRooms.length;

  ChatRoom findChatRoom({required int id}) => _chatRooms.where((chatRoom) => id == chatRoom.roomId) as ChatRoom;

  String getChatName({required int id}) {
    ChatRoom chatRoom = findChatRoom(id: id);
    return chatRoom.chatRoomName;
  }

  void addChatRoom(){
    ChatRoom newChatRoom = ChatRoom(id: 0, null, null, null, null);
    _chatRooms.add(newChatRoom);
  }
}