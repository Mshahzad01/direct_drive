
import 'package:direct_drive/config/route_name.dart';
import 'package:direct_drive/src/feature/auth/cubit/auth_cubit.dart';
import 'package:direct_drive/src/feature/auth/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit,AuthState>(
      listener: (context, state) {
        if(state is AuthInitial){
         
          Navigator.pushReplacementNamed(context, RouteName.splash);
        }
      },
       child:Scaffold(
        appBar: AppBar(
      
          actions: [
            IconButton(onPressed: (){
                
      
              context.read<AuthCubit>().signOut();
            }, icon: Icon(Icons.logout)),




             IconButton(onPressed: (){
                
      
           // Navigator.pu
            }, icon: Icon(Icons.logout))
          ],
          title: Text("Helo shahzad"),
        ),

       
      
     )
      
    );

  }
}