import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_application_bloc/bloc/bottom_navigation/bottom_bloc.dart';
import 'package:test_application_bloc/network/api_service.dart';
import 'package:test_application_bloc/parent_screen.dart';
import 'package:test_application_bloc/repo/message_repo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider<BottomNavBloc>(
        create: (context) => BottomNavBloc(
          homePageRepo: ImagesService(),
          messageRepo: MessageRepo(),
        )..add(AppStarted()),
        child: ParentScreen(),
      ),
    );
  }
}
