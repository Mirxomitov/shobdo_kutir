part of 'play_bloc.dart';

class PlayEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class PauseAudioEvent extends PlayEvent {

}

class PlayAudioEvent extends PlayEvent {
  final String url;

  PlayAudioEvent({required this.url});

  @override
  String toString() => 'PlayAudioEvent(url: $url)';

  @override
  List<Object?> get props => [url];
}

class ForwardTenSecondsEvent extends PlayEvent {}

class BackwardTenSecondsEvent extends PlayEvent {}

class OpenPdfEvent extends PlayEvent {}

class OnPositionChangedEvent extends PlayEvent {
  final Duration position;

  OnPositionChangedEvent({required this.position});

  @override
  List<Object?> get props => [position];
}

class OnDurationChangedEvent extends PlayEvent {
  final Duration position;

  OnDurationChangedEvent({required this.position});

  @override
  List<Object?> get props => [position];
}

class PlayFirstTime extends PlayEvent {
  final String url;

  PlayFirstTime({required this.url});

  @override
  String toString() => 'PlayFirstTime(url: $url)';

  @override
  List<Object?> get props => [url];
}

class OnUserChangePositionEvent extends PlayEvent {
  final Duration position;

  OnUserChangePositionEvent({required this.position});

  @override
  List<Object?> get props => [position];
}

class ToPdfScreenEvent extends PlayEvent {}

class DisposeAudioEvent extends PlayEvent {}
