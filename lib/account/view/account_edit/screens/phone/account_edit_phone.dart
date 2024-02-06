import 'package:firebase_regist/account/domain/bloc/user_bloc.dart';
import 'package:firebase_regist/account/view/account_edit/account_edit.dart';
import 'package:firebase_regist/const/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountEditPhone extends StatefulWidget {
  const AccountEditPhone({super.key});

  @override
  State<AccountEditPhone> createState() => _AccountEditPhoneState();
}

class _AccountEditPhoneState extends State<AccountEditPhone> {
  late String data;
  @override
  void initState() {
    data = context.findAncestorWidgetOfExactType<AccountEdit>()!.data as String;
    super.initState();
  }

  String get hint => data == 'Имя' ? 'Ваше Имя' : 'Ваша Фамилия';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.color.bg,
      appBar: AppBar(
        title: Text(hint, style: context.text.appbarTitle),
        centerTitle: true,
        leadingWidth: 120,
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Row(children: [
            SizedBox(
              width: 30,
              child: BackButton(
                onPressed: () => Navigator.of(context).pop(),
                color: Theme.of(context).primaryColor,
              ),
            ),
            Text(
              'Аккаунт',
              style: context.text.rgBody
                  .copyWith(color: Theme.of(context).primaryColor),
            )
          ]),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(children: [
          Container(
              height: 45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13), color: Colors.white),
              child: BlocBuilder<UserBloc, UserState>(
                builder: (context, state) {
                  return TextField(
                    onChanged: (value) {
                      if (state.user == null) return;
                      if (data == 'Имя') {
                        final user = state.user!.copyWith(name: value);
                        context.read<UserBloc>().add(SaveUserEvent(user: user));
                      } else {
                        final user = state.user!.copyWith(lastName: value);
                        context.read<UserBloc>().add(SaveUserEvent(user: user));
                      }
                    },
                    style: context.text.rgText,
                    decoration: InputDecoration(
                        hintText: hint,
                        hintStyle: context.text.profileHint,
                        border: InputBorder.none,
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 12)),
                  );
                },
              ))
        ]),
      ),
    );
  }
}
