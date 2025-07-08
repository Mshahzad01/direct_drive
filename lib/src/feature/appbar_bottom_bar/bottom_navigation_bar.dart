

import 'package:direct_drive/src/feature/appbar_bottom_bar/widget/appbar_widget.dart';
import 'package:flutter/material.dart';

class AppbarBottombar extends StatelessWidget {
  const AppbarBottombar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:  Colors.grey,
      appBar: UserAppBar(),
        
      
    );
  }
}