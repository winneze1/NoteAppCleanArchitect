import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mynoteapp/app_const.dart';
import 'package:mynoteapp/feature/domain/entities/note_entity.dart';
import 'package:mynoteapp/feature/presentation/pages/add_new_note_page.dart';
import 'package:mynoteapp/feature/presentation/pages/sign_in_page.dart';
import 'package:mynoteapp/feature/presentation/pages/sign_up_page.dart';

import 'feature/presentation/pages/update_note_page.dart';

class OnGenerateRoute {
  static Route<dynamic> route(RouteSettings settings) {
    final args = settings.arguments;
    switch(settings.name) {
      case PageConst.signInPage: {
        return materialPageRoute(widget: SignInPage());
      }
      case PageConst.signUpPage: {
        return materialPageRoute(widget: SignUpPage());
      }
      case PageConst.addNotePage: {
        if(args is String) {
          return materialPageRoute(widget: AddNewNotePage(uid: args));
        }
        else {
          return materialPageRoute(widget: ErrorPage());
        }
      }
      case PageConst.updateNotePage: {
        if(args is NoteEntity) {
          return materialPageRoute(widget: UpdateNotePage(noteEntity: args));
        } else {
          return materialPageRoute(widget: ErrorPage());
        }
      }

      default:
        return materialPageRoute(widget: ErrorPage());
    }
  }
}

class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('error'),
      ),
      body: Center(
        child: Text('error'),
      ),
    );

  }
}

MaterialPageRoute materialPageRoute({required Widget widget}) {
  return MaterialPageRoute(builder: (_) => widget,);
}