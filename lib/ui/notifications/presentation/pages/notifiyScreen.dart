import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manafea/config/ApiManager/apiManager.dart';
import 'package:manafea/ui/notifications/data/data_sources/remote/remoteDS.dart';
import 'package:manafea/ui/notifications/data/repositories/notifciationRepoImp.dart';
import 'package:manafea/ui/notifications/domain/use_cases/useCase.dart';
import 'package:manafea/ui/notifications/presentation/bloc/bloc.dart';
import 'package:manafea/ui/notifications/presentation/bloc/states.dart';

import '../../data/data_sources/remote/remoteDSImplementation.dart';
import '../../domain/repositories/notificationRepo.dart';
import '../bloc/events.dart';

class Notifiyscreen extends StatefulWidget {
  const Notifiyscreen({super.key});

  @override
  State<Notifiyscreen> createState() => _NotifiyscreenState();
}

class _NotifiyscreenState extends State<Notifiyscreen> {
  @override
  Widget build(BuildContext context) {
    ApiManager apiManager =
    ApiManager();
    NotificationRemoteDS remoteDS =
    NotificationRemoteDSImp(apiManager);
    NotificationRepo repo =
    NotificationRepoImp(remoteDS);
    FetchNotificationsUseCase fetchNotificationsUseCase =
    FetchNotificationsUseCase(repo);
    return BlocProvider(

      create: (context) =>
      NotificationBloc(fetchNotificationsUseCase)
        ..add(NotificationsTabTapped()),

      child: BlocBuilder<NotificationBloc, NotificationsStates>(
        builder: (context, state) {
          if (state is NotificationsLoading) {
            return CircularProgressIndicator();
          } else if (state is NotificationsSuccess) {
            return ListView.builder(
              itemCount: state.notifications.length,
              itemBuilder: (_, index) {
                final notification = state.notifications[index];
                print("id ${notification.heading.toString()}");
                print("bsdfsd");
                return ListTile(
                  title: Text(notification.heading.toString(),style: const TextStyle(
                    color: Colors.black
                  ),),
                  subtitle: Text(notification.heading.toString()),
                );
              },
            );
          } else if (state is NotificationsError) {
            return Center(child: Text(state.message));
          }
          return Container();
        },

      ),
    );
  }
}
