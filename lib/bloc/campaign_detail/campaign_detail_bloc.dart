import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lautkita_mobile/data/datasources/campaign_remote_datasources.dart';
import 'package:lautkita_mobile/data/models/campaign_detail_model.dart';

part 'campaign_detail_event.dart';
part 'campaign_detail_state.dart';
part 'campaign_detail_bloc.freezed.dart';

class CampaignDetailBloc
    extends Bloc<CampaignDetailEvent, CampaignDetailState> {
  CampaignDetailBloc() : super(_Initial()) {
    on<_Get>((event, emit) async {
      emit(const _Loading());
      print("loading emit");
      final result = await CampaignRemoteDatasource().get(event.model);
      result.fold(
        (l) => emit(_Error(l)),
        (r) {
          emit(_Loaded(r));
        },
      );
    });
  }
}
