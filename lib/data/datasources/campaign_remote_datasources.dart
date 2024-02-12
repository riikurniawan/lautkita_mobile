import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:lautkita_mobile/common/global_variables.dart';
import 'package:lautkita_mobile/data/models/campaign_detail_model.dart';

class CampaignRemoteDatasource {
  Future<Either<String, List<CampaignDetailModel>>> get(
      CampaignDetailModel model) async {
    // final headers = {
    //   'Accept': 'application/json',
    //   'Content-Type': 'application/json'
    // };
    final response = await http.get(
      Uri.parse('${GlobalVariables.baseUrl}/api/community/mycampaign'),
      // headers: headers,
    );

    if (response.statusCode == 200) {
      print("bisa");
      return Right(campaignDetailModelFromJson(response.body));
      // return Right(CampaignDetailModel.fromJson(json.decode(response.body)));
    } else {
      return const Left('Server error');
    }
  }
}
