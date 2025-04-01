part of 'doa_bloc.dart';

enum DoaStatus { initial, loading, success, error }

class DoaState extends Equatable {
  final DoaStatus status;
  const DoaState({this.status = DoaStatus.initial});

  DoaState copyWith({DoaStatus? status}) {
    return DoaState(status: status ?? this.status);
  }

  @override
  List<Object?> get props => [status];
}
