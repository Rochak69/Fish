// import 'package:flutter/material.dart';

// class ChangePassword extends StatelessWidget {
//   const ChangePassword({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: ListView(
//         children: [
//           const SizedBox(
//             height: 20,
//           ),
//           const Center(
//               child: Text(
//             'Change Password',
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.w700,
//             ),
//           )),
//           const SizedBox(
//             height: 32,
//           ),
//           const Text(
//             'Your password should meet the required credentials',
//             style: TextStyle(
//               fontSize: 18,
//             ),
//           ),
//           const SizedBox(
//             height: 32,
//           ),
//           const Text(
//             "Current Password",
//             style: TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.w400,
//             ),
//           ),
//           TextFormField(
//             autovalidateMode: AutovalidateMode.onUserInteraction,
//             keyboardType: TextInputType.emailAddress,
//             decoration: const InputDecoration(
//                 labelStyle: TextStyle(
//                   fontSize: 14.0,
//                 ),
//                 hintStyle: TextStyle(
//                   color: Color.fromARGB(255, 187, 183, 183),
//                   fontSize: 10.0,
//                 )),
//             style: const TextStyle(fontSize: 14),
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//           const Text(
//             "New Password",
//             style: TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.w400,
//             ),
//           ),
//           TextFormField(
//             autovalidateMode: AutovalidateMode.onUserInteraction,
//             keyboardType: TextInputType.emailAddress,
//             decoration: const InputDecoration(
//                 labelStyle: TextStyle(
//                   fontSize: 14.0,
//                 ),
//                 hintStyle: TextStyle(
//                   color: Color.fromARGB(255, 187, 183, 183),
//                   fontSize: 10.0,
//                 )),
//             style: const TextStyle(fontSize: 14),
//           ),
//           const SizedBox(
//             height: 3,
//           ),
//           const Text('*Minimum of 8 characters and a mixture of (a-A, 0-9)'),
//           const Text("Re enter New Password"),
//           const SizedBox(
//             height: 24,
//           ),
//           const Text(
//             'Re Enter New Password',
//             style: TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.w400,
//             ),
//           ),
//           TextFormField(
//             autovalidateMode: AutovalidateMode.onUserInteraction,
//             keyboardType: TextInputType.emailAddress,
//             decoration: const InputDecoration(
//                 labelStyle: TextStyle(
//                   fontSize: 14.0,
//                 ),
//                 hintStyle: TextStyle(
//                   color: Color.fromARGB(255, 187, 183, 183),
//                   fontSize: 10.0,
//                 )),
//             style: const TextStyle(fontSize: 14),
//           ),
//           const SizedBox(
//             height: 100,
//           ),
//           SizedBox(
//             width: 260,
//             height: 40,
//             child: ElevatedButton(
//               onPressed: () {},

//               //  signIn,
//               child: const Text('Save',
//                   style: TextStyle(fontSize: 20, color: Colors.white)),
//             ),
//           ),
//           const SizedBox(
//             height: 12,
//           ),
//           Container(
//             width: 260,
//             color: Colors.white,
//             height: 40,
//             child: ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 elevation: 0,
//                 side: const BorderSide(
//                   width: 0.5,
//                   color: Colors.blue,
//                 ),
//                 shape: const RoundedRectangleBorder(),
//                 backgroundColor: Colors.white,
//               ),

//               onPressed: () {},

//               //  signIn,

//               child: const Text('Cancel',
//                   style: TextStyle(fontSize: 20, color: Colors.black)),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
