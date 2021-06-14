import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:test_application_bloc/repo/image_repo.dart';
import '../../repo/repositories.dart';

part 'bottom_event.dart';
part 'bottom_state.dart';

class BottomNavBloc extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  BottomNavBloc({this.homePageRepo, this.messageRepo})
      : assert(homePageRepo != null),
        assert(messageRepo != null),
        super(ScreenLoading());

  final ImagesRepo homePageRepo;
  final MessageRepo messageRepo;
  int currentIndex = 0;

  @override
  Stream<BottomNavigationState> mapEventToState(
      BottomNavigationEvent event) async* {
    if (event is AppStarted) {
      this.add(PageTapped(index: this.currentIndex));
    }
    if (event is PageTapped) {
      this.currentIndex = event.index;
      yield BottomIndexChanged(currentIndex: this.currentIndex);
      yield ScreenLoading();

      if (this.currentIndex == 0) {
        List data = await _loadHomeImageData();
        List grid = await _loadHomeGridImageData();
        yield HomePageLoaded(images: data,gridImages: grid);
      }
      if (this.currentIndex == 1) {
        String data = await _loadMessagePageData();
        yield MessagePageLoaded(text: data);
      }
    }
  }

  Future<List> _loadHomeImageData() async {
    List data = await homePageRepo.getImagesList();
    return data;
  }
 Future<List> _loadHomeGridImageData() async {
    List data = await homePageRepo.getImagesGridList();
    return data;
  }

  Future<String> _loadMessagePageData() async {
    String data = messageRepo.data;
    if (data == null) {
      await messageRepo.fetchData();
      data = messageRepo.data;
    }
    return data;
  }
}
