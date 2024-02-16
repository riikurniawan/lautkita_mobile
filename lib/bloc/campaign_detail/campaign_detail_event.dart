part of 'campaign_detail_bloc.dart';

@freezed
class CampaignDetailEvent with _$CampaignDetailEvent {
  const factory CampaignDetailEvent.started() = _Started;
  const factory CampaignDetailEvent.get(CampaignDetailModel model) = _Get;
}
