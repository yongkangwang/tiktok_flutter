
import '../../model/video/short_video_model.dart';

class AKShortVideoRequest {

  AKShortVideoRequest._internal();

  static final AKShortVideoRequest _instance = AKShortVideoRequest._internal();

  factory AKShortVideoRequest() => _instance;


  final videoList = [
    'test-video-10.MP4',
    'test-video-6.mp4',
    'test-video-9.MP4',
    'test-video-8.MP4',
    'test-video-7.MP4',
    'test-video-1.mp4',
    'test-video-2.mp4',
    'test-video-3.mp4',
    'test-video-4.mp4',
  ];


  Future<List> fetchVideo() async {

    List<AKShortVideoModel> list = [];
    list = await videoList.map((e) => AKShortVideoModel(
        url: 'https://static.ybhospital.net/$e',
        image: 'https://i0.hdslb.com/bfs/bangumi/image/afd39028077f4fa0a5f701eedf2866a230da5f09.png',
        desc: '$e')).toList();
    return list;


    // final String param = AkParamsSign.paramsSerialization(params);
    // final  url = "/liuyi/rest77/authforapp/push_reg_code_phone_v2?${param}";

    // final result = await HttpBaseRequest().request(
    //   AkConstant.baseURL,
    //   url,
    // );
    //
    // return result.toString();
  }




}