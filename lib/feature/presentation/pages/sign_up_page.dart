import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mynoteapp/feature/domain/entities/user_entity.dart';
import 'package:mynoteapp/feature/presentation/cubit/auth/auth_cubit.dart';
import 'package:mynoteapp/feature/presentation/cubit/auth/auth_state.dart';
import 'package:mynoteapp/feature/presentation/cubit/user/user_cubit.dart';
import 'package:mynoteapp/feature/presentation/cubit/user/user_state.dart';
import 'package:mynoteapp/feature/presentation/widgets/common.dart';

import '../../../app_const.dart';
import 'home_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  GlobalKey<ScaffoldState> _scaffoldGlobalKey = GlobalKey<ScaffoldState>();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldGlobalKey,
      body: BlocConsumer<UserCubit, UserState>(
        listener: (context, userState) {
          if(userState is UserSuccess) {
            BlocProvider.of<AuthCubit>(context).loggedIn();
          }
          if(userState is UserFailure) {
            snackBarError(msg: "Invalid email", scaffoldState: _scaffoldGlobalKey);
          }
        },
        builder: (context, userState) {
          if(userState is UserSuccess) {
            return BlocBuilder<AuthCubit, AuthState>(builder: (context, authState) {
              if(authState is Authenticated) {
                return HomePage(uid: authState.uid,);
              } else {
                return _bodyWidget();
              }
            });
          }

          return _bodyWidget();
        },
      ),
    );
  }

  _bodyWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () => Navigator.pushNamedAndRemoveUntil(context, PageConst.signInPage, (route) => false),
          icon: Icon(
            Icons.arrow_back_ios,
            size: 15,
            color: Colors.blue,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          height: 50,
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(.1),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: TextField(
            controller: _usernameController,
            decoration: InputDecoration(
              hintText: "Enter your username",
              border: InputBorder.none,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 50,
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(.1),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: TextField(
            controller: _emailController,
            decoration: InputDecoration(
                hintText: "Enter your email", border: InputBorder.none),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 50,
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(.1),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: TextField(
            controller: _passwordController,
            decoration: InputDecoration(
                hintText: "Enter your password", border: InputBorder.none),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        ElevatedButton(
            onPressed: () {
              submitSignIn();
            },
            child: Text(
              'Create New Account',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            )),
      ],
    );
  }

  void submitSignIn() {
    if (_usernameController.text.isNotEmpty &&  _emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      BlocProvider.of<UserCubit>(context).submitSignUp(
          user: UserEntity(
              email: _emailController.text,
              password: _passwordController.text, name: _usernameController.text));
    }
  }
}
