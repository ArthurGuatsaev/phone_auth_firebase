import 'package:firebase_regist/const/extension.dart';
import 'package:firebase_regist/navigation/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/bloc/user_bloc.dart';
import '../../widgets/pop/photo_pick.dart';

class AccountPhone extends StatelessWidget {
  const AccountPhone({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.color.bg,
      appBar: AppBar(
        backgroundColor: context.color.bg,
        title: Text(
          'Аккаунт',
          style: context.text.appbarTitle,
        ),
        centerTitle: true,
        elevation: 0,
        shape: Border(
          bottom: BorderSide(color: context.color.bottom),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            final user = state.user;
            return Column(children: [
              SizedBox(
                height: 10,
                width: MediaQuery.of(context).size.width,
              ),
              SizedBox(
                height: 100,
                width: 110,
                child: FutureBuilder(
                    future: user?.userImage,
                    builder: (context, snap) {
                      if (snap.hasData) {
                        return CircleAvatar(
                          minRadius: 50,
                          backgroundImage: Image.file(snap.data!.file).image,
                          child: Stack(
                            children: [
                              Positioned(
                                  right: 0,
                                  bottom: -10,
                                  child: GestureDetector(
                                    onTap: () =>
                                        MyNavigatorManager.instance.camara(),
                                    child: Container(
                                      padding: const EdgeInsets.all(2),
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white),
                                      child: const Icon(
                                        Icons.more_horiz,
                                        color: Colors.blue,
                                        size: 40,
                                      ),
                                    ),
                                  ))
                            ],
                          ),
                        );
                      }
                      return CircleAvatar(
                        backgroundColor: context.color.stepDis,
                        minRadius: 50,
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: Image.asset(
                                  'assets/images/account.png',
                                  fit: BoxFit.fill,
                                  height: 70,
                                ),
                              ),
                            ),
                            Positioned(
                                right: 0,
                                bottom: -10,
                                child: GestureDetector(
                                  onTap: () => Navigator.of(context)
                                      .restorablePush(showModalPick),
                                  child: Container(
                                    padding: const EdgeInsets.all(2),
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white),
                                    child: const Icon(
                                      Icons.more_horiz,
                                      color: Colors.blue,
                                      size: 40,
                                    ),
                                  ),
                                ))
                          ],
                        ),
                      );
                    }),
              ),
              const SizedBox(height: 10),
              Text('data', style: context.text.rgBody),
              const SizedBox(height: 10),
              if (user != null)
                Column(
                  children: List.generate(2, (index) {
                    final title = index == 0 ? 'Имя' : 'Фамилия';
                    final value = index == 0 ? user.name! : user.lastName!;
                    return GestureDetector(
                      onTap: () => MyNavigatorManager.instance.pushEdit(title),
                      child: Container(
                        padding: const EdgeInsets.only(left: 12, right: 16),
                        height: 48,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border(
                                bottom: BorderSide(
                                    color: context.color.profileHint)),
                            borderRadius: index == 0
                                ? const BorderRadius.only(
                                    topLeft: Radius.circular(13),
                                    topRight: Radius.circular(13))
                                : null),
                        child: Row(children: [
                          Text(title, style: context.text.rgText),
                          const Spacer(),
                          Text(value, style: context.text.profileHint),
                          const SizedBox(width: 10),
                          Icon(
                            Icons.navigate_next,
                            color: context.color.profileHint,
                          ),
                        ]),
                      ),
                    );
                  }),
                )
            ]);
          },
        ),
      ),
    );
  }
}
