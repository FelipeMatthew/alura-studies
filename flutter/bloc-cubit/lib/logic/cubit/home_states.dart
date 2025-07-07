part of "home_cubit.dart";

abstract class HomeStates {}

// ESTADO INICIAL ANTES DE CHAMAR A API E MOSTRAR OS ITENS
class HomeInitial extends HomeStates {}

// ESTADO DE CARREGAMENTO
class HomeLoading extends HomeStates {}

// ESTADO DE SUCESSO
class HomeSuccess extends HomeStates {
  // TODOS OS STATES PODEM RECEBER INFORMAÇÕES DE ERROS AO QUAL PEGARIA E PASSARIA PARA A TELA

  // PASSANDO QUE SE CASO O FETCH DE FILMES DE CERTO, VAI PEGAR ELE E PASSAR AQUI PARA O ESTADO
  HomeSuccess(this.movies);

  final List<Movie> movies;
}

// ESTADO DE ERRO
class HomeError extends HomeStates {
  HomeError(this.errorText);

  final String errorText;
}
