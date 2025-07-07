import 'package:bloc/bloc.dart';

part 'home_states.dart';

// PARTE LÓGICA DO BLOC
class HomeCubit extends Cubit<HomeStates> {
  // TRATA APENAS OS ESTADOS DA HOME STATES POR ISSO PASSA 
  HomeCubit() : super(HomeInitial());
}