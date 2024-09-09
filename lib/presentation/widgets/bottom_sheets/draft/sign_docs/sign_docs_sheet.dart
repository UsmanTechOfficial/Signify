// import 'package:dyno_sign/infrastructure/navigation/app_routes/navigation.dart';
// import 'package:flutter/cupertino.dart';
//
// import '../add_sign_sheets/sign_request_sheet.dart';
// import '../base_bottom_sheet.dart';
// import '../req_sign/add_doc_sheet.dart';
//
// class SignDocsSheet extends StatelessWidget with BaseBottomSheet {
//   const SignDocsSheet({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(children: [
//       SignRequestSheetBuilder(
//         title: "Only for me",
//         subtitle: "Sign documents only for yourself",
//         onTap: () {
//           Go.back();
//           baseBottomSheet(
//             context,
//             title: 'Add a document',
//             content: const AddDocumentSheet(),
//           );
//         },
//       ),
//       SignRequestSheetBuilder(
//         title: "Send By Others",
//         subtitle: "Make templates and use them again and again. ",
//         onTap: () {},
//       )
//     ]);
//   }
// }
