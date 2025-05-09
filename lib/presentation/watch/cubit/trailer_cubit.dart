import 'package:bloc/bloc.dart';
import 'package:netflix/core/entity/trailer.dart';
import 'package:netflix/domain/movies/usecases/get_movie_trailer.dart';
import 'package:netflix/service_locator.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

part 'trailer_state.dart';

class TrailerCubit extends Cubit<TrailerState> {
  TrailerCubit() : super(TrailerLoading());

  void getMovieTrailer(int moveId) async {
    var returnedData = await sl<GetMovieTrailerUseCase>().call(params: moveId);
    returnedData.fold((error) {
      emit(FailuerLoadTrailer(errorMessage: error));
    }, (data) async {
      TrailerEntity trailerEntity = data;
      YoutubePlayerController controller = YoutubePlayerController(
        initialVideoId: trailerEntity.key!,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
        ),
      );

      emit(TrailerLoaded(youtubePlayerController: controller));
    });
  }
}
