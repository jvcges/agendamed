// import 'package:agendamed/models/post.dart';
// import 'package:agendamed/widgets/future_builder.dart';
// import 'package:flutter/material.dart';
// import 'package:dio/dio.dart';


// class NewUserList extends StatefulWidget {
//   const NewUserList({Key? key}) : super(key: key);

//   @override
//   _NewUserListState createState() => _NewUserListState();
// }

// class _NewUserListState extends State<NewUserList{

//   Future<Post> _getPost() async {
//     final dio = Dio();
//     var response =
//         await dio.get('https://jsonplaceholder.typicode.com/users');
//     return Post.fromJson(response.data);
//   }

//   late Future<Post> _loadPost;

//   @override
//   void initState() {
//     _loadPost = _getPost();
//     initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
//         child: MyFutureBuilder<Post>(
//           future: _loadPost,

//           onEmpty: (context) {
//             return Center(child: Text('Não há dados disponiveis'));
//           },

//           onComplete: (context, post) {
//             return ListView(
//               children: [
//                 ListTile(
//                   contentPadding: EdgeInsets.zero,
//                   trailing: Icon(Icons.chevron_right),
//                   title: Text(post.name),
//                   subtitle: Text(post.email),
//                 ),
//               ],
//             );
//           },

//           onError: (context, error) {
//             return Center(child: Text(error.message));
//           },
          
//           onLoading: (context) =>
//               Center(child: CircularProgressIndicator()),
//         ),
//       ),
//     );
//   }
// }
