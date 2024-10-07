part of 'profile_bloc.dart';

@immutable
class ProfileState {
  ProfileState({
    this.profileState = const PageState.init(),
    this.updateProfileStatus = const BlocStatus.initial(),
    this.phone,
    Country? selectedCountry,
    this.selectedFile,
  }) : selectedCountry = selectedCountry ?? AuthBloc.initCountry;

  final PageState<CustomerInfo> profileState;
  final BlocStatus updateProfileStatus;
  final File? selectedFile;
  final String? phone;

  Country selectedCountry;

  @override
  List<Object?> get props =>
      [profileState, updateProfileStatus, selectedFile, selectedCountry, phone];
  ProfileState copyWith({
    PageState<CustomerInfo>? profileState,
    BlocStatus? updateProfileStatus,
    Nullable<File?>? selectedFile,
    final String? phone,
    Nullable<Country?>? selectedCountry,
  }) =>
      ProfileState(
        profileState: profileState ?? this.profileState,
        updateProfileStatus: updateProfileStatus ?? this.updateProfileStatus,
        selectedFile:
            selectedFile != null ? selectedFile.value : this.selectedFile,
        phone: phone ?? this.phone,
        selectedCountry: selectedCountry != null
            ? selectedCountry.value
            : this.selectedCountry,
      );
}
