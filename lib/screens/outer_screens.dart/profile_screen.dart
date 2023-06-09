// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../../providers/user_provider.dart';

// class ProfileScreen extends StatefulWidget {
//   static const routeName = '/profile';
//   const ProfileScreen({super.key});

//   @override
//   State<ProfileScreen> createState() => _ProfileScreenState();
// }

// class _ProfileScreenState extends State<ProfileScreen> {
//   bool isDarkMode = false;

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     final isIos = theme.platform == TargetPlatform.iOS;
//     // final user = Provider.of<User>(context);

//     return Padding(
//       padding: const EdgeInsets.fromLTRB(42, 0, 42, 20),
//       child: ListView(
//         physics: isIos
//             ? const BouncingScrollPhysics()
//             : const AlwaysScrollableScrollPhysics(),
//         children: [
//           const SizedBox(
//             height: 38,
//           ),
//           const CircleAvatar(
//             radius: 60,
//             backgroundColor: Color(0xffFEF7EB),
//           ),
//           const SizedBox(
//             height: 21,
//           ),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Text(
//                 user.user.name ?? 'Samuel',
//                 style: theme.textTheme.displayLarge,
//               ),
//               const SizedBox(
//                 height: 8,
//               ),
//               Text(
//                 user.user.name == ''
//                     ? 'Samuel@gmail.com'
//                     : user.user.name ?? 'Samuel@gmail.com',
//                 style: theme.textTheme.bodyLarge?.copyWith(fontSize: 18),
//               ),
//               TextButton(
//                 onPressed: () {},
//                 child: Text(
//                   'Edit Profile',
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontFamily: 'Gilroy',
//                     fontWeight: FontWeight.w500,
//                     color: theme.primaryColor,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(
//             height: 66,
//           ),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Contacts',
//                 style: theme.textTheme.bodyLarge,
//               ),
//               Material(
//                 child: ListTile(
//                   onTap: () {},
//                   horizontalTitleGap: 0,
//                   contentPadding: EdgeInsets.zero,
//                   leading: Image.asset('assets/images/call.png'),
//                   title: Text(
//                     'Call Us',
//                     style: theme.textTheme.displayMedium?.copyWith(
//                       fontSize: 18,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                   trailing: Icon(
//                     CupertinoIcons.chevron_forward,
//                     size: 15,
//                     color: theme.primaryColor,
//                   ),
//                 ),
//               ),
//               Material(
//                 child: ListTile(
//                   onTap: () {},
//                   horizontalTitleGap: 0,
//                   contentPadding: EdgeInsets.zero,
//                   leading: Image.asset('assets/images/web.png'),
//                   title: Text(
//                     'Our Website',
//                     style: theme.textTheme.displayMedium?.copyWith(
//                       fontSize: 18,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                   trailing: Icon(
//                     CupertinoIcons.chevron_forward,
//                     size: 15,
//                     color: theme.primaryColor,
//                   ),
//                 ),
//               ),
//               Material(
//                 child: ListTile(
//                   onTap: () {},
//                   horizontalTitleGap: 0,
//                   contentPadding: EdgeInsets.zero,
//                   leading: Image.asset('assets/images/share.png'),
//                   title: Text(
//                     'Share the app',
//                     style: theme.textTheme.displayMedium?.copyWith(
//                       fontSize: 18,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                   trailing: Icon(
//                     CupertinoIcons.chevron_forward,
//                     size: 15,
//                     color: theme.primaryColor,
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 50,
//               ),
//               TextButton(
//                 style: TextButton.styleFrom(
//                   padding: EdgeInsets.zero,
//                   minimumSize: const Size(50, 30),
//                   alignment: Alignment.centerLeft,
//                 ),
//                 onPressed: () {
//                   FirebaseAuth.instance.signOut();
//                 },
//                 child: Text(
//                   'Logout',
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontFamily: 'Gilroy',
//                     fontWeight: FontWeight.w500,
//                     color: theme.primaryColor,
//                   ),
//                 ),
//               ),
//               Text(
//                 'Version 1.0',
//                 style: theme.textTheme.bodyLarge?.copyWith(fontSize: 18),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
