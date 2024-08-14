part of 'modal_sheet_cubit.dart';

@immutable
sealed class ModalSheetState {}

final class ModalSheetInitial extends ModalSheetState {}
final class ModalSheetchangeState extends ModalSheetState {}
final class ModalSheetSuccess extends ModalSheetState {}
final class ModalSheetLoading extends ModalSheetState {}
final class ModalSheetFailuer extends ModalSheetState {
  final String e;

  ModalSheetFailuer({required this.e});
}