import 'package:dio/dio.dart';
import 'package:flutter_spacex/API/Lanuches/model/ModelLanuches.dart';

 class  APIRequests {

   Dio dio;
   BaseOptions options =
       BaseOptions(baseUrl: "https://api.spacexdata.com/v4/");

   APIRequests() {
     dio = Dio(options);
   }

   Future <List<ModelLanuches>> lanuchesAPI() async {
     Response response = await dio.get("launches");
     List<ModelLanuches> launches =[];

     for (var item in response.data){
       launches.add(ModelLanuches.fromAPI(item));
     }
     return launches;
   }
 }
