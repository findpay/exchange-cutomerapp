import 'package:dartz/dartz.dart';
import 'package:exchange/data/model/acoount_model.dart';
import '../providers/datasources/remote_data_source.dart';
import '../providers/error/exception.dart';
import '../providers/error/failure.dart';
import '../remote_urls.dart';

abstract class AccountRepository {
  Future<Either<Failure, List<AccountsModel>>> getAccounts();
}

class AccountRepositoryImp extends AccountRepository {
  final RemoteDataSource remoteDataSource;
  AccountRepositoryImp({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<AccountsModel>>> getAccounts() async {
    try {
      final resp = await remoteDataSource.httpGet(url: RemoteUrls.getAccounts);
      final mapList = resp['data'] as List;
       final result =
          List<AccountsModel>.from(mapList.map((e) => AccountsModel.fromMap(e)));
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }
}
