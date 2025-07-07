part of "home_cubit.dart";

abstract class HomeStates {}

// ESTADO INICIAL ANTES DE CHAMAR A API E MOSTRAR OS ITENS
class HomeInitial extends HomeStates {}

// ESTADO DE CARREGAMENTO
class HomeLoading extends HomeStates {}

// ESTADO DE SUCESSO
class HomeSuccess extends HomeStates {}

// ESTADO DE ERRO
class HomeError extends HomeStates {}
