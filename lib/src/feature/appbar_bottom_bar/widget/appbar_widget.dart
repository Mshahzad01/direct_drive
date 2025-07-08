

import 'package:direct_drive/src/feature/appbar_bottom_bar/cubit/user_cubit.dart';
import 'package:direct_drive/src/feature/appbar_bottom_bar/cubit/user_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class UserAppBar extends StatelessWidget implements PreferredSizeWidget {
  const UserAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        if (state is UserLoading) {
          return AppBar(
            title: const Text("Loading..."),
          );
        } else if (state is UserLoaded) {
               

          return AppBar(
             automaticallyImplyLeading: false, 
          backgroundColor: Colors.white,
            title: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(state.user.photoUrl ?? ''),
                    radius: 22,
                    backgroundColor: Colors.white,
                  ),
                  const SizedBox(width: 10),
              
                  Column(
                    children: [
                    
                     Text(
                    'Hey',
                    
                      style: const TextStyle(fontSize: 18,color: Colors.black),
                      overflow: TextOverflow.ellipsis,
                      
                    ),
                  
                   
                     Text(
                    state.user.firstName ??'User',
                    style: const TextStyle(fontSize: 18,color: Colors.black),
                      overflow: TextOverflow.ellipsis,
                    ),
                  
              
                    ],
                  ),
                Spacer(),
                  IconButton(
                    onPressed: () {
                
                    },
                    icon: const Icon(Icons.notifications_none,color: Colors.black,),
                  )
                ],
              ),
            ),
          );
        } else {
          return AppBar(
            title: const Text("Error"),
          );
        }
      },
    );
  }
}
