import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_application_1/scr/router/routing_const.dart';
import 'package:meta/meta.dart';

part 'regis_event.dart';
part 'regis_state.dart';

class RegisBloc extends Bloc<RegisEvent, RegisState> {
  RegisBloc() : super(RegisInitial());

  final Dio dio = Dio();

   @override
  Stream<RegisState> mapEventToState(
    RegisEvent event,
  ) async* {
    if (event is RegisPressed) {

      try {
          Response response = await dio.post(
           'http://api.codeunion.kz/api/v1/auth/registration/customer/new',
            data: {
            'email': event.email,
            'nickname': event.nickname,
            'phone': event.phone,
            'password': event.password,
            }
          );

          print(response.data);
          /*Navigator.pushReplacementNamed(context, AuthRoute);*/
            
          yield RegisLoading();
      }
          on DioError catch (e) {
            yield RegisFailed(message: 'Проверьте введенные данные');
            throw e;
          } catch (e) {
            yield RegisFailed(message: 'Произошла ошибка');
            throw e;
          }
    }
  }
}
