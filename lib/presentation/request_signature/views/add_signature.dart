
// class AddSignature extends GetView<RequestSignaturesController> {
//   const AddSignature({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     Get.put(RequestSignaturesController());
//     return DefaultTabController(
//       length: 3,
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text('Add Signature'),
//           centerTitle: true,
//           bottom: const TabBar(
//             tabs: <Widget>[
//               Tab(
//                 text: "Choose",
//               ),
//               Tab(
//                 text: "Draw",
//               ),
//               Tab(
//                 text: "Upload",
//               ),
//             ],
//           ),
//         ),
//         body: Padding(
//           padding: EdgeInsets.symmetric(horizontal: mWidth(context) * .05),
//           child: TabBarView(
//             physics: const ClampingScrollPhysics(),
//             children: <Widget>[
//               ChooseTab(controller: controller),
//               const DrawTab(),
//               const UploadTab()
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class ChooseTab extends AddSignature {
//   const ChooseTab({super.key, required this.controller});
//
//   final RequestSignaturesController controller;
//
//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//       itemCount: 10,
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//         mainAxisSpacing: 10,
//         crossAxisSpacing: 10,
//       ),
//       itemBuilder: (context, index) {
//         return Obx(
//           () => SignatureCard(
//             isSelected: controller.selectedSign.value == index,
//             child: Center(
//                 child: Assets.images.splashImg.image(fit: BoxFit.scaleDown)),
//             onTap: () {
//               controller.onSelectSign(index);
//             },
//           ),
//         );
//       },
//     );
//   }
// }
//
// class DrawTab extends StatefulWidget {
//   const DrawTab({super.key});
//
//   @override
//   State<DrawTab> createState() => _DrawTabState();
// }
//
// class _DrawTabState extends State<DrawTab> {
//   final GlobalKey<SfSignaturePadState> signatureGlobalKey = GlobalKey();
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   void _handleClearButtonPressed() {
//     signatureGlobalKey.currentState!.clear();
//   }
//
//   void _handleSaveButtonPressed() async {
//     final data =
//         await signatureGlobalKey.currentState!.toImage(pixelRatio: 3.0);
//     final bytes = await data.toByteData(format: ui.ImageByteFormat.png);
//     await Navigator.of(context).push(
//       MaterialPageRoute(
//         builder: (BuildContext context) {
//           return Scaffold(
//             appBar: AppBar(),
//             body: Center(
//               child: Container(
//                 color: Colors.grey[300],
//                 child: Image.memory(bytes!.buffer.asUint8List()),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//           Padding(
//               padding: const EdgeInsets.all(10),
//               child: Container(
//                   height: 400,
//                   decoration: BoxDecoration(
//                       border: Border.all(color: colorScheme(context).outline),
//                       borderRadius:
//                           BorderRadius.circular(AppConst.borderRadius)),
//                   child: SfSignaturePad(
//                       key: signatureGlobalKey,
//                       strokeColor: Colors.black,
//                       minimumStrokeWidth: 1.0,
//                       maximumStrokeWidth: 4.0))),
//           const SizedBox(height: 10),
//           Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: <Widget>[
//                 TextButton(
//                   onPressed: _handleSaveButtonPressed,
//                   child: const Text('save'),
//                 ),
//                 TextButton(
//                   onPressed: _handleClearButtonPressed,
//                   child: const Text('Clear'),
//                 )
//               ])
//         ]));
//   }
// }
//
// class UploadTab extends StatelessWidget {
//   const UploadTab({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }
//
// class SignatureCard extends StatelessWidget {
//   final bool isSelected;
//   final Widget? child;
//   final VoidCallback onTap;
//
//   const SignatureCard({
//     super.key,
//     this.isSelected = false,
//     this.child,
//     required this.onTap,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final colorScheme = Theme.of(context).colorScheme;
//
//     return Card(
//       shadowColor:
//           isSelected ? colorScheme.primary : colorScheme.outlineVariant,
//       elevation: 4,
//       color: colorScheme.surface,
//       child: InkWell(
//         borderRadius: BorderRadius.circular(AppConst.borderRadius),
//         onTap: onTap,
//         child: Stack(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(15.0),
//               child: child ?? Container(),
//             ),
//             if (isSelected)
//               Positioned(
//                 bottom: 0,
//                 left: 0,
//                 right: 0,
//                 child: Container(
//                     height: 40,
//                     decoration: BoxDecoration(
//                       border: !isSelected
//                           ? Border(
//                               top: BorderSide(
//                                   color: colorScheme.outlineVariant,
//                                   width: 1.5))
//                           : null,
//                       color: isSelected
//                           ? colorScheme.primary
//                           : colorScheme.surface,
//                       borderRadius: const BorderRadius.only(
//                         bottomRight: Radius.circular(AppConst.borderRadius),
//                         bottomLeft: Radius.circular(AppConst.borderRadius),
//                       ),
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 12.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: [
//                           IconButton(
//                             icon: Icon(Icons.edit, color: colorScheme.surface),
//                             onPressed: () {},
//                           ),
//                           IconButton(
//                             icon:
//                                 Icon(Icons.delete, color: colorScheme.surface),
//                             onPressed: () {},
//                           ),
//                         ],
//                       ),
//                     )),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }
