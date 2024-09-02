part of '../bloc/dashboard_bloc.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        leading: InkWell(
            onTap: () {
              scaffoldKey.currentState?.openDrawer();
            },
            child: const Icon(Icons.menu_outlined)),
      ),
      body: const Center(
        child: Text(
          'Profile is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
