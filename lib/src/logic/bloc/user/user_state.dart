part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserFailure extends UserState {}

class UserSuccess extends UserState {
  final List<User> users;
  final bool hasReachedMax;

  const UserSuccess({
    this.users,
    this.hasReachedMax,
  });

  UserSuccess copyWith({
    List<User> users,
    bool hasReachedMax,
  }) {
    return UserSuccess(
      users: users ?? this.users,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object> get props => [users, hasReachedMax];

  @override
  String toString() =>
      'UserSuccess { Users: ${users.length}, hasReachedMax: $hasReachedMax }';
}
