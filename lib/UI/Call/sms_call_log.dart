// import 'package:flutter/material.dart';
// import 'dart:async';

// import 'package:flutter/services.dart';
// import 'package:pit_sms_call_log/pit_sms_call_log.dart';

// class Smscallog extends StatefulWidget {
//   @override
//    _SmscallogState createState() => _SmscallogState();
// }

// class  _SmscallogState extends State<Smscallog> {
//   List<SmsLog> smsList = [];
//   List<CallLog> callLogs = [];

//   @override
//   void initState() {
//     super.initState();
//     initPlatformState();
//   }

//   Future<void> initPlatformState() async {
//     List<SmsLog> smsList = [];
//     List<CallLog> callLogs = [];
//     try {
//       smsList = await PitSmsCallLog.getSmsLog(daysBefore: 3);
//       callLogs = await PitSmsCallLog.getCallLog(daysBefore: 20);
//     } on PlatformException {
//       print('error');
//     }

//     if (!mounted) return;
//     setState(() {
//       this.smsList = smsList;
//       this.callLogs = callLogs;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//         // appBar: AppBar(
//         //   title: const Text('Plugin example app'),
//         // ),
//         body: SingleChildScrollView(
// //          child: Text('Call Logs :\n $callLogs'),
//             child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             // Text('SMS List :\n'),
//             // _buildItemSmsLog(),
//             // Text('Call Log :\n'),
//             detail()
//           ],
//         )),
//       );
//   }

//   // _buildItemSmsLog() {
//   //   List<Widget> item = [];
//   //   smsList.forEach((sms) {
//   //     item.add(Container(
//   //       child: Text(
//   //           "Address : ${sms.address}, Body : ${sms.body}, Date : ${sms.date}"),
//   //       margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
//   //     ));
//   //   });
//   //   return Column(
//   //     children: item,
//   //   );
//   // }

//   // _buildItemCallLog() {
//   //   List<Widget> item = [];
//   //   callLogs.forEach((call) {
//   //     item.add(Container(
//   //       child: Text(
//   //           "Call Type : ${call.callType}, Call Number : ${call.callNumber}, Call Date : ${call.callDate}, " +
//   //               "Call Duration : ${call.callDuration} second"),
//   //       margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
//   //     ));
//   //   });
//   //   return Column(
//   //     children: item,
//   //   );
//   // }
//   Widget detail() {
//     List<Widget> item = [];
//     callLogs.forEach((call) {
//       item.add(Column(
//         children: <Widget>[
//           Padding(
//               padding: const EdgeInsets.all(2.0),
//               child: Row(
//                 children: <Widget>[
//                   Icon(
//                     Icons.account_circle,
//                     size: 45.0,
//                     color: Colors.grey[600],
//                   ),
//                   Expanded(
//                     child: Padding(
//                       padding: const EdgeInsets.all(0.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: <Widget>[
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: <Widget>[
//                               Text(
//                                 "Amanda",
//                                 // chatItem.name,
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.w500,
//                                     fontSize: 18.0,
//                                     color: Colors.white),
//                               ),
//                               Text(
//                                 "${call.callDate}",
//                                 // chatItem.messageDate,
//                                 style: TextStyle(color: Colors.black),
//                               ),
//                             ],
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: <Widget>[
//                               Text(
//                                 "${call.callNumber}",
//                                 // chatItem.name,
//                                 style: TextStyle(
//                                     color: Colors.black, fontSize: 16.0),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(right: 7),
//                                 child: call.callType == 'MISSED'
//                                     ? Icon(
//                                   Icons.phone_missed,
//                                   color: Colors.red,
//                                   size: 20,
//                                 )
//                                     : call.callType == 'INCOMING'
//                                     ? Icon(
//                                   Icons.phone,
//                                   color: Colors.green,
//                                   size: 20,
//                                 ): call.callType == 'OUTGOING'
//                                     ? Icon(
//                                   Icons.phone,
//                                   color: Colors.blue,
//                                   size: 20,
//                                 ): Text('',),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   )
//                 ],
//               )),
//           Divider(
//             color: Colors.black54,
//           ),
//         ],
//       ));
//     });
//     return Column(
//       children: item,
//     );
//   }

// }
