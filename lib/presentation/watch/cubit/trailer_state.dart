// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'trailer_cubit.dart';

abstract class TrailerState {}

class TrailerLoading extends TrailerState {}

class TrailerLoaded extends TrailerState {
  final YoutubePlayerController youtubePlayerController;
  TrailerLoaded({
    required this.youtubePlayerController,
  });
}

class FailuerLoadTrailer extends TrailerState {
  final String errorMessage;
  FailuerLoadTrailer({required this.errorMessage});
}
