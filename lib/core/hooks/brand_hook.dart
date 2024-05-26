import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:wael/core/services/brand_service.dart';
import 'package:wael/data/model/api/models/brand_model.dart';

(bool, List<BrandModel>) useBrandHook() {
  return use(const _BrandsHook());
}

class _BrandsHook extends Hook<(bool, List<BrandModel>)> {
  const _BrandsHook();
  @override
  _BrandHookState createState() => _BrandHookState();
}

class _BrandHookState extends HookState<(bool, List<BrandModel>), _BrandsHook> {
  bool loading = true;

  List<BrandModel> brands = [];

  final BrandService brandService = BrandService();

  @override
  void initHook() async {
    super.initHook();

    // api request
    brands = await brandService.getAllBrands();
    loading = false;
    setState(() {});
  }

  @override
  (bool, List<BrandModel>) build(BuildContext context) => (loading, brands);
}
