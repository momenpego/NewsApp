import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final SharedPreferences sharedPreferences;
  SettingsBloc({required this.sharedPreferences}) : super(SettingsInitial()) {
    on<SettingsEvent>((event, emit) async{
      if(event is ChangeLangEvent){
        if(sharedPreferences.getInt('1')==null){
          await sharedPreferences.setInt('1', 1);
          emit(ChangeLangStates());
        }else{
          await sharedPreferences.remove('1');
          emit(ChangeLangStates());
        }
      }
    });
  }
}
