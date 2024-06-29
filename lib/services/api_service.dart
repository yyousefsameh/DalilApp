import 'package:dalil_app/errors/failures.dart';
import 'package:dalil_app/models/history_model/history_model_list_data.dart';
import 'package:dalil_app/models/machine_model.dart';
import 'package:dalil_app/models/medicine_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;
  ApiService(this.dio);
  final String baseUrl = 'https://dalil-phi.vercel.app/';

  Future<Either<Failure, MedicineModel>> getMedicineByFullNameService({
    required String medicineName,
    required String endPoint,
  }) async {
    try {
      final params = {
        'name': medicineName,
      };

      Response response = await dio.get(
        "$baseUrl$endPoint",
        data: params,
      );

      MedicineModel medicineModel = MedicineModel.fromJson(response.data);
      return right(medicineModel);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioException(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, MedicineFromMachineModel>>
      getCharactersOfMedicineNameFromMachineWebSite({
    required dynamic prescriptionImage,
    required String endPoint,
  }) async {
    try {
      final formData = FormData.fromMap({
        'image': await MultipartFile.fromFile(
          prescriptionImage!.path,
          filename: 'upload.jpg',
        ),
      });
      Response response = await dio.post(
        "$baseUrl$endPoint",
        data: formData,
      );
      MedicineFromMachineModel medicineFromMachineModel =
          MedicineFromMachineModel.fromJson(response.data);
      print("the response is $response");
      // calling the nlp model function

      return right(medicineFromMachineModel);
    } on DioException catch (e) {
      print("the error is $e");
      return left(ServerFailure.fromDioException(e));
    } catch (e) {
      print("the error is $e");
      return left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, List<MedicineModel>>> getMedicinesByCategoryService({
    required String medicinesCategory,
    required String endPoint,
  }) async {
    try {
      final params = {
        'category': medicinesCategory,
      };

      Response response = await dio.get(
        "$baseUrl$endPoint",
        data: params,
      );
      List<MedicineModel> medicinesByCategoryList = [];

      Map<String, dynamic> medicincesByCategoryMapData = response.data;

      for (int i = 0; i < medicincesByCategoryMapData["medicine"].length; i++) {
        medicinesByCategoryList.add(
          MedicineModel.fromJsonForList(
              medicincesByCategoryMapData["medicine"][i]),
        );
      }

      return right(medicinesByCategoryList);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioException(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, List<MedicineModel>>>
      getMedicinesByAnyCharacterService({
    required String medicinesCharacter,
    required String endPoint,
  }) async {
    try {
      final params = {
        "prefix": medicinesCharacter,
      };

      Response response = await dio.get(
        "$baseUrl$endPoint",
        data: params,
      );
      List<MedicineModel> medicinesByCharacterList = [];

      Map<String, dynamic> medicincesByCharacterMapData = response.data;

      for (int i = 0; i < medicincesByCharacterMapData["data"].length; i++) {
        medicinesByCharacterList.add(
          MedicineModel.fromJsonForList(
              medicincesByCharacterMapData["data"][i]),
        );
      }

      return right(medicinesByCharacterList);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioException(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, MedicineModel>>
      getMedicineInfoAfterGettingMedicineNameFromMahcineModel({
    required dynamic prescriptionImage,
  }) async {
    try {
      Either<Failure, MedicineFromMachineModel>
          resultOfGettingCharactersOfMedicineNameFromMachineWebSite =
          await getCharactersOfMedicineNameFromMachineWebSite(
        endPoint: "medicines/getFromImage",
        prescriptionImage: prescriptionImage,
      );

      MedicineFromMachineModel medicineFromMachineModel =
          resultOfGettingCharactersOfMedicineNameFromMachineWebSite.fold(
        (failure) {
          throw Exception('Failed to get medicine from machine: $failure');
        },
        (medicineFromMachineModel) {
          return medicineFromMachineModel;
        },
      );

      Either<Failure, MedicineModel> resultOfGettingMedicinesByFullName =
          await getMedicineByFullNameService(
        endPoint: "medicines/getMedicine",
        medicineName: medicineFromMachineModel.medicineMachineName,
      );

      MedicineModel medicineModel = resultOfGettingMedicinesByFullName.fold(
        (failure) {
          throw Exception('Failed to get medicine from machine: $failure');
        },
        (medicineModel) {
          return medicineModel;
        },
      );
      return right(medicineModel);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioException(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

// add medicines to history
  void addMedicinesToHistory({
    required String userEmail,
    required String medicineName,
    required String endPoint,
  }) async {
    try {
      final params = {
        'email': userEmail,
        'medicine': medicineName,
      };

      Response response = await dio.post(
        "$baseUrl$endPoint",
        data: params,
      );
    } on DioException catch (e) {
      throw Exception(e);
    } catch (e) {
      throw Exception(e);
    }
  }

// get history medicines
  Future<Either<Failure, List<HistoryModelListData>>> getHistoryMedicines({
    required String userEmail,
    required String endPoint,
  }) async {
    try {
      final params = {
        'email': userEmail,
      };

      Response response = await dio.get(
        "$baseUrl$endPoint",
        data: params,
      );
      List<HistoryModelListData> medicinesHistoryList = [];

      Map<String, dynamic> medicincesHistoryMapData = response.data;
      print(response);
      for (int i = 0; i < medicincesHistoryMapData["data"].length; i++) {
        medicinesHistoryList.add(
          HistoryModelListData.fromJson(
            medicincesHistoryMapData["data"][i],
          ),
        );
      }
      print("the list is: $medicinesHistoryList");
      return right(medicinesHistoryList);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioException(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

// for user login register and reset

  Future<Response> postUserData({
    required String endPoint,
    String? userName,
    required String userEmail,
    required String userPassword,
  }) async {
    try {
      Response response = await dio.post(
        '$baseUrl$endPoint',
        data: {
          'name': userName,
          'email': userEmail,
          'password': userPassword,
        },
      );
      return response;
    } on DioException catch (e) {
      throw Exception(e.toString());
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Response> putUserResetData({
    required String endPoint,
    required String userEmail,
    required String userOldPassword,
    required String userNewPassword,
  }) async {
    try {
      Response response = await dio.put(
        '$baseUrl$endPoint',
        data: {
          'email': userEmail,
          'oldPassword': userOldPassword,
          'newPassword': userNewPassword,
        },
      );
      return response;
    } on DioException catch (e) {
      throw Exception(e.toString());
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }
}
