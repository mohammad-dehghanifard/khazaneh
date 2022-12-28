import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:khazaneh/controller/user/user_controller.dart';

Future<dynamic> changeUsernameBottomSheet(BuildContext context, UserController userController) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24)
        )
    ),
    builder: (context) {
      return Padding(
        padding:  EdgeInsets.only(bottom:  MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children:  [
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text('ویرایش نام کاربری'),
            ),
            const SizedBox(height: 100),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: userController.changeUserNameController,
                decoration: const InputDecoration(
                    hintText: 'نام کاربری جدید را وارد کنید'
                ),
              ),
            ),
            const SizedBox(height: 190),
            Padding(
              padding: const EdgeInsets.all(16),
              child: ElevatedButton(
                  onPressed: () => userController.updateUserName(),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('ذخیره تغیرات',style: Theme.of(context).textTheme.bodyText2!.apply(fontSizeFactor: 1.5,color: Colors.white),),
                  )
              ),
            ),
          ],
        ),
      );
    },);
}