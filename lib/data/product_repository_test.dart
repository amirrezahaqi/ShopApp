import 'package:shopnew/data/conf/remote_conf.dart';
import 'package:shopnew/data/constants.dart';
import 'package:shopnew/data/repo/product_repo.dart';
import 'package:shopnew/data/src/product_data_src.dart';

class ProductRepoTest {
  final _productRepo = ProductRepository(ProductRemoteDataSrc(DioManager.dio));

  getProducts() async =>
      await _productRepo.getStored(ProductSortRoutes.newestProducts);
}
