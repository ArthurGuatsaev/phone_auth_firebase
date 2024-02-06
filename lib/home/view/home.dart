import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../import.dart';
import 'widget/bottom.dart';

class HomePage extends StatefulWidget {
  final Widget firstFlow;
  const HomePage({super.key, required this.firstFlow});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeBloc, HomeState>(
        buildWhen: (previous, current) =>
            previous.homeIndex != current.homeIndex,
        builder: (context, state) {
          return IndexedStack(index: state.homeIndex, children: [
            const Scaffold(),
            widget.firstFlow,
          ]);
        },
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
