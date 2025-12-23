import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../bloc/login_bloc.dart';
import '../bloc/login_event.dart';
import '../bloc/login_state.dart';
import '../../../../config/theme/app_theme.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
 
    final _emailCtrl = TextEditingController();
    final _passwordCtrl = TextEditingController();


    @override
  void dispose() {
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    super.dispose();
  }

   @override
  Widget build(BuildContext context) {
     return Scaffold(
      
      backgroundColor: AppTheme.lightBg,
      body: BlocConsumer<LoginBloc,LoginState>(
        
        listener: (context, state)=>{
          if(state is LoginFailure){
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message),
              backgroundColor: Colors.red.shade600,
              )
            )
          },
          if (state is LoginSuccess){
            context.go('/home') // Using GoRouter
          }
        },

        builder: (context, state){
          return SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
              ),
            )
            );
        },
        ),
     
     );
  }


    }
