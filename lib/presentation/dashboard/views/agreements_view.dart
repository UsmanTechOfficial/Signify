part of '../bloc/dashboard_bloc.dart';

class AgreementsView extends StatelessWidget {
  const AgreementsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agreement'),
        centerTitle: true,
        leading: InkWell(
            onTap: () {
              scaffoldKey.currentState?.openDrawer();
            },
            child: const Icon(Icons.menu_outlined)),
      ),
      body: const Center(
        child: Text(
          'Agreement is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
