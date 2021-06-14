part of 'bottom_bloc.dart';

abstract class BottomNavigationState extends Equatable{
  const BottomNavigationState();

  @override
  List<Object> get props => [];

}

class BottomIndexChanged extends BottomNavigationState{
  final int currentIndex ;

  BottomIndexChanged({@required this.currentIndex});

  @override
  String toString() => 'BottomIndexChanged to $currentIndex';

}

class ScreenLoading extends BottomNavigationState{
  @override
  String toString() => 'ScreenLoading';
}

class HomePageLoaded extends BottomNavigationState {
  final List images;
  final List gridImages;
  HomePageLoaded({this.images, this.gridImages});

  @override
  String toString() => 'HomeScreenLoaded with Images:';
}

class MessagePageLoaded extends BottomNavigationState {
  final String text;

  MessagePageLoaded({@required this.text});

  @override
  String toString() => 'MessageScreenLoaded with : $text';
}
