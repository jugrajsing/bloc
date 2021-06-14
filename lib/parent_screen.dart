import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_application_bloc/bloc/bottom_navigation/bottom_bloc.dart';
import 'package:test_application_bloc/screens/home_page.dart';
import 'package:test_application_bloc/screens/message_page.dart';

class ParentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Test Bloc'),
        ),
        body: BlocBuilder<BottomNavBloc, BottomNavigationState>(
          builder: (BuildContext context, BottomNavigationState state) {
            if (state is ScreenLoading) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is HomePageLoaded) {
              return HomePage(
                list: state.images,
                grid: state.gridImages,
              );
            }
            if (state is MessagePageLoaded) {
              return MessagePage(text: state.text);
            }
            return Container();
          },
        ),
        bottomNavigationBar: BlocBuilder<BottomNavBloc, BottomNavigationState>(
            builder: (BuildContext context, BottomNavigationState state) {
          return BottomNavigationBar(
            currentIndex:
                context.select((BottomNavBloc bloc) => bloc.currentIndex),
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home, color: Colors.black),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.message_rounded, color: Colors.black),
                label: 'Message',
              ),
            ],
            onTap: (index) =>
                context.read<BottomNavBloc>().add(PageTapped(index: index)),
          );
        }));
  }
}
