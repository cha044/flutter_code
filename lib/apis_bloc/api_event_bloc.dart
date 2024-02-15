import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';

class EmailEvent extends Equatable {
  const EmailEvent();

  @override
  List<Object> get props => [];
}

class FetchEmail extends EmailEvent {
  final String email;
  const FetchEmail({required this.email});

  dynamic get getEmail => email;

  @override
  List<Object> get props => [email];
}

class FetchEmailList extends EmailEvent {}

class DeleteEmail extends EmailEvent {
  final int id;
  final String email;
  final String description;
  final String title;
  final String imgLink;

  DeleteEmail(
      {required this.id,
      required this.description,
      required this.email,
      required this.title,
      required this.imgLink});
}

class EditEmail extends EmailEvent {
  final String email;
  final int id;
  final String description;
  final String title;
  final String imgLink;

  EditEmail(
      {required this.email,
      required this.id,
      required this.description,
      required this.title,
      required this.imgLink});
}

class CreateEmail extends EmailEvent {
  final String email;
  final String description;
  final String title;
  final String imgLink;

  CreateEmail({
    required this.email,
    required this.description,
    required this.title,
    required this.imgLink,
  });
}
