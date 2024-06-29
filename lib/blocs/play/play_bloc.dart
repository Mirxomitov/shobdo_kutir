import 'package:audioplayers/audioplayers.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'play_event.dart';
part 'play_state.dart';

class PlayBloc extends Bloc<PlayEvent, PlayState> {
  PlayBloc() : super(PlayState.initial()) {
    on<PlayFirstTime>((event, emit) async {
      print('play first time');
      await state.audioPlayer.setSourceUrl(event.url);
      await state.audioPlayer.resume();
      emit(state.copyWith(isPlaying: true, isFirstTime: false));
    });

    on<PlayAudioEvent>((event, emit) async {
      // Todo if error occurs
      await state.audioPlayer.resume();
      emit(state.copyWith(isPlaying: true));
    });

    on<PauseAudioEvent>((event, emit) async {
      await state.audioPlayer.pause();
      emit(state.copyWith(isPlaying: false));
    });

    on<OpenPdfEvent>((event, emit) {
      emit(state.copyWith(isPlaying: false, toPdfScreen: true));
    });

    on<ForwardTenSecondsEvent>((event, emit) {
      var seconds = state.position.inSeconds;
      final duration = state.duration.inSeconds;

      state.audioPlayer.seek(Duration(seconds: seconds + 10 > duration ? seconds : seconds + 10));
      emit(state);
    });

    on<BackwardTenSecondsEvent>((event, emit) {
      var seconds = state.position.inSeconds - 10;
      state.audioPlayer.seek(Duration(seconds: seconds < 0 ? 0 : seconds));
      emit(state);
    });

    on<OnPositionChangedEvent>((event, emit) {
      emit(state.copyWith(position: event.position));
    });

    on<OnDurationChangedEvent>((event, emit) {
      emit(state.copyWith(duration: event.position));
    });

    on<OnUserChangePositionEvent>((event, emit) {
      state.audioPlayer.seek(event.position);
      state.audioPlayer.resume();
      emit(state.copyWith(position: state.position));
    });

    on<ToPdfScreenEvent>((event, emit) {
      emit(state.copyWith(
        audioPlayer: state.audioPlayer..pause(),
        toPdfScreen: false,
      ));
      add(PauseAudioEvent());
    });

    on<DisposeAudioEvent>((event, emit) async {
      await state.audioPlayer.dispose();
      state.audioPlayer.stop();
      emit(state.copyWith(audioPlayer: AudioPlayer()));
    });
  }
}
