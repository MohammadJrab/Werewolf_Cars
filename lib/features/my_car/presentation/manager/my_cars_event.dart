part of 'my_cars_bloc.dart';

abstract class MyCarsEvent {}

class NextPageEvent extends MyCarsEvent {}

class PreviousPageEvent extends MyCarsEvent {}

class BackPageEvent extends MyCarsEvent {}

class AddOptionalImageEvent extends MyCarsEvent {}

class ResetSellMyCarEvent extends MyCarsEvent {}
