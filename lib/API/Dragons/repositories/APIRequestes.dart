import 'package:dio/dio.dart';
import 'package:flutter_spacex/API/Dragons/models/ModelDragon.dart';

 class  APIRequests {

   Dio dio;
   BaseOptions options =
       BaseOptions(baseUrl: "https://api.spacexdata.com/v4/");

   APIRequests() {
     dio = Dio(options);
   }

   Future <List<ModelShips>> dragonAPI() async {
     Response response = await dio.get("dragons");
     List<ModelShips> dragons =[];

     for (var item in response.data){
       dragons.add(ModelShips.fromAPI(item));
     }
     return dragons;
   }
 }
