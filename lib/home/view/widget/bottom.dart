import 'package:firebase_regist/const/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../import.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: BlocBuilder<HomeBloc, HomeState>(
        buildWhen: (previous, current) =>
            previous.homeIndex != current.homeIndex,
        builder: (context, state) {
          return BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            onTap: (value) => context
                .read<HomeBloc>()
                .add(ChangeHomeIndexEvent(homeIndex: value)),
            currentIndex: state.homeIndex,
            backgroundColor: Colors.transparent,
            elevation: 0,
            selectedItemColor: Theme.of(context).primaryColor,
            unselectedItemColor: context.color.disableMenu,
            selectedLabelStyle: context.text.rgLable
                .copyWith(color: Theme.of(context).primaryColor),
            unselectedLabelStyle:
                context.text.rgLable.copyWith(color: context.color.disableMenu),
            items: [
              BottomNavigationBarItem(
                icon: SizedBox(
                    width: 40,
                    height: 40,
                    child: Image.asset('assets/images/home.png',
                        color: context.color.disableMenu)),
                label: 'Mои проекты',
                activeIcon: SizedBox(
                    width: 40,
                    height: 40,
                    child: Image.asset(
                      'assets/images/home.png',
                      color: Theme.of(context).primaryColor,
                    )),
              ),
              BottomNavigationBarItem(
                icon: SizedBox(
                    width: 40,
                    height: 40,
                    child: Image.asset('assets/images/account.png',
                        color: context.color.disableMenu)),
                label: 'Мой аккаунт',
                activeIcon: SizedBox(
                    width: 40,
                    height: 40,
                    child: Image.asset(
                      'assets/images/account.png',
                      color: Theme.of(context).primaryColor,
                    )),
              ),
            ],
          );
        },
      ),
    );
  }
}
