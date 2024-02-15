import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repository/apis_repo.dart';
import 'api_event_bloc.dart';
import 'api_state_bloc.dart';

class EmailBloc extends Bloc<EmailEvent, EmailState> {
  final EmailRepo emailRepo;
  EmailBloc({required this.emailRepo}) : super(EmailIsNotSearched()) {
    // on<FetchEmail>(_onFetchEmail);
  }

  @override
  Stream<EmailState> _mapFetchEmailsListToState(FetchEmailList event) async* {
    yield EmailIsLoading();
    try {
      final emails = await emailRepo.getEmail();
      yield GetEmailsListSuccess(emails: emails);
    } catch (_) {
      yield GetEmailsFailure();
    }
  }

  Stream<EmailState> _mapDeleteEmailToState(DeleteEmail event) async* {
    yield EmailIsDeleting();

    try {
      await emailRepo.deleteEmail(
          id: event.id,
          email: event.email,
          description: event.description,
          title: event.title,
          imgLink: event.imgLink);
      yield EmailDeleteSuccess(message: 'Email deleted successfully');
    } catch (e) {
      yield EmailDeleteFailure(error: 'Failed to delete email: $e');
    }
  }

  Stream<EmailState> _mapEditEmailToState(EditEmail event) async* {
    yield EmailIsEditing();

    try {
      await emailRepo.editEmail(
        email: event.email,
        id: event.id,
        description: event.description,
        title: event.title,
        imgLink: event.imgLink,
      );
      yield EmailEditSuccess(message: 'Email edited successfully');
    } catch (e) {
      yield EmailEditFailure(error: 'Failed to edit email: $e');
    }
  }

  Stream<EmailState> _mapCreateEmailToState(CreateEmail event) async* {
    yield EmailIsCreating();

    try {
      await emailRepo.createEmail(
        email: event.email,
        description: event.description,
        title: event.title,
        imgLink: event.imgLink,
      );
      yield EmailCreateSuccess(message: 'Email created successfully');
    } catch (e) {
      yield EmailCreateFailure(error: 'Failed to create email: $e');
    }
  }
}
