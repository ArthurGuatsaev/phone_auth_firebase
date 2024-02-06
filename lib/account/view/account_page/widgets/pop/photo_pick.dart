import 'package:firebase_regist/account/domain/bloc/user_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

@pragma('vm:entry-point')
Route<void> showModalPick(BuildContext context, Object? arguments) {
  return CupertinoModalPopupRoute<void>(
    builder: (context) {
      return CupertinoActionSheet(
        title: const Text('Выберите фото'),
        actions: <CupertinoActionSheetAction>[
          CupertinoActionSheetAction(
            child: Text(
              'Камера',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).primaryColor),
            ),
            onPressed: () {
              context
                  .read<UserBloc>()
                  .add(PickPhotoEvent(source: ImageSource.camera));
              Navigator.pop(context);
            },
          ),
          CupertinoActionSheetAction(
            child: Text('Галерея Фото',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).primaryColor)),
            onPressed: () {
              context
                  .read<UserBloc>()
                  .add(PickPhotoEvent(source: ImageSource.gallery));
              Navigator.pop(context);
            },
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          child: Text('Закрыть',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).primaryColor)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      );
    },
  );
}
