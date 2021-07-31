import 'package:dio/dio.dart';
import 'package:flutter_spacex/API/Ship/model/ModelShips.dart';

 class  APIRequests {

   Dio dio;
   BaseOptions options =
       BaseOptions(baseUrl: "https://api.spacexdata.com/v4/");

   APIRequests() {
     dio = Dio(options);
   }

   Future <List<ModelLanuches>> dragonAPI() async {
     Response response = await dio.get("ships");
     List<ModelLanuches> ships =[];

     for (var item in response.data){
       ships.add(ModelLanuches.fromAPI(item));
     }
     return ships;
   }
 }
