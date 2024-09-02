part of '../bloc/dashboard_bloc.dart';

class TemplatesView extends StatelessWidget {
  const TemplatesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tamplete'),
        leading: InkWell(
            onTap: () {
              scaffoldKey.currentState?.openDrawer();
            },
            child: const Icon(Icons.menu_outlined)),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'Tamplete is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
