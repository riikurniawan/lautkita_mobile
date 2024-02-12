part of 'campaign_detail_bloc.dart';

@freezed
class CampaignDetailState with _$CampaignDetailState {
  const factory CampaignDetailState.initial() = _Initial;
  const factory CampaignDetailState.loading() = _Loading;
  const factory CampaignDetailState.loaded(List<CampaignDetailModel> data) =
      _Loaded;
  const factory CampaignDetailState.error(String message) = _Error;
}
