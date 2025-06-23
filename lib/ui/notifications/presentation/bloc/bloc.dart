import 'package:bloc/bloc.dart';
 import 'package:manafea/ui/notifications/presentation/bloc/events.dart';
import 'package:manafea/ui/notifications/presentation/bloc/states.dart';

import '../../domain/use_cases/useCase.dart';

class NotificationBloc extends Bloc<NotificationsEvents, NotificationsStates> {
  final FetchNotificationsUseCase fetchNotificationsUseCase;

  NotificationBloc(this.fetchNotificationsUseCase)
      : super(NotificationsInitial()) {
    on<NotificationsTabTapped>((event, state) async {
      emit(NotificationsLoading());
      final result = await fetchNotificationsUseCase();

      if(result.isSuccess){
        final uiModels =result.data;
        emit(NotificationsSuccess(uiModels!));
      }else{

        emit(NotificationsError(result.error.toString()));

      }
    });
    on<NotificationViewDetailsPressed>((event, emit) {
      emit(NotificationDetailsOpened(event.notificationModel));
    });
  }

}
