
import 'package:direct_drive/src/feature/appbar_bottom_bar/cubit/user_cubit.dart';
import 'package:direct_drive/src/feature/appbar_bottom_bar/cubit/user_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class UserAppBar extends StatelessWidget implements PreferredSizeWidget {
  const UserAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(80); // custom height

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
       
        if (state is UserLoaded) {
          return AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            elevation: 1,
            flexibleSpace: Padding(
              padding: const EdgeInsets.only(top: 40.0, left: 18, right: 18),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(state.user.photoUrl ?? ''),
                    radius: 22,
                  ),
                  const SizedBox(width: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Hello',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        state.user.firstName ?? 'User',
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
              Container(
  padding: EdgeInsets.all(8), 
  decoration: BoxDecoration(
    shape: BoxShape.circle,
    color: Colors.grey[200], 
  ),
  child: SvgPicture.asset(
    "assets/menu_svg/notifications.svg",
    height: 24,
    width: 24,
  
  ),
),

                ],
              ),
            ),
          );
        } else {
          return  AppBar(title: const Text("Loading..."));
        }
      },
    );
  }
}
