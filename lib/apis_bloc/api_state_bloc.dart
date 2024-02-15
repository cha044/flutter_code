import 'package:equatable/equatable.dart';
import 'package:fluttertest/models/email_model.dart';

import 'api_event_bloc.dart';

class EmailState extends Equatable {
  const EmailState();

  @override
  List<Object> get props => [];
}

class EmailIsNotSearched extends EmailState {}

class EmailIsLoading extends EmailState {}

class EmailIsLoaded extends EmailState {
  final dynamic id;
  final dynamic title;
  final dynamic description;
  final dynamic img_link;
  final dynamic email;

  const EmailIsLoaded(
      this.id, this.title, this.description, this.img_link, this.email);

  EmailModel get getEmail => email;

  @override
  List<Object> get props => [id, title, description, img_link, email];
}

class GetEmailsFailure extends EmailState {}

class GetEmailsListSuccess extends EmailState {
  final List<String> emails;

  GetEmailsListSuccess({required this.emails});
}

class EmailIsDeleting extends EmailState {}

class EmailDeleteSuccess extends EmailState {
  final String message;

  EmailDeleteSuccess({required this.message});
}

class EmailDeleteFailure extends EmailState {
  final String error;
  EmailDeleteFailure({required this.error});
}

class EmailIsEditing extends EmailState {}

class EmailEditSuccess extends EmailState {
  final String message;

  EmailEditSuccess({required this.message});
}

class EmailEditFailure extends EmailState {
  final String error;

  EmailEditFailure({required this.error});
}

class EmailIsCreating extends EmailState {}

class EmailCreateSuccess extends EmailState {
  final String message;

  EmailCreateSuccess({required this.message});
}

class EmailCreateFailure extends EmailState {
  final String error;

  EmailCreateFailure({required this.error});
}
