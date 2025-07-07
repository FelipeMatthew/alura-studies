import 'package:bilheteria_panucci/models/movie.dart';
import 'package:bilheteria_panucci/services/movies_api.dart';
import 'package:bloc/bloc.dart';

part 'home_states.dart';

// PARTE LÓGICA DO BLOC
class HomeCubit extends Cubit<HomeStates> {
  // TRATA APENAS OS ESTADOS DA HOME STATES POR ISSO PASSA 

  // PASSANDO HOME INITIAL COMO ESTADO INICIAL DA APLICAÇÃO ANTES DE INICIAR A API
  // SUPER SEMPRE VAI SER O ESTADO INICIAL E PRECISA SER PASSADO ESSE TIPO
  HomeCubit() : super(HomeInitial());

  // TODAS AS FUNÇOES QUE MEXEM COM ESTADO DEVE RETORNAR UM VOID
  // STATE QUE O PROPIO CUBIT CRIA AUTOMATICAMENTE PEGANDO O ESTADO QUE FOI DITO INICIALMENTE - QUE NO CASO É O HOME INITIAL

  // O EMIT QUE SEMPRE VAI PEGAR E FAZER A ALTERAÇÃO DESSE ESTADO PEGANDO ALI O HOME STATE
  // emit(state);
  
  // FAZER A INSTANCIA DO SERVICO QUE BUSCA OS LIVROS
  final HomeService homeService = HomeService();

  Future<void> getMovies() async {
    // VAI COMEÇAR A PROCURAR OS FILMES, LOGO O ESTADO VAI MUDAR PARA HOME LOADING
    emit(HomeLoading());
    try {
      final movies = await homeService.fetchMovies();
      // SE RETORNAR OS FILMES CORRETAMENTE RETORNA O HOME SUCCESS
      emit(HomeSuccess(movies));
    } catch (e) {
      // SE CASO DE ALGUM ERRO, PASSAR PARA ERRO
      emit(HomeError("Não foi possível carregar a lista de filmes"));
    }
  }
}

// CUBIT PRECISA SABER O TIPO DE DADO QUE ELE VAI UTILIZAR