import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:wael/core/services/brand_service.dart';
import 'package:wael/data/model/api/brand.dart';

(bool, List<Brand>) useBrandHook() {
  return use(_BrandsHook());
}

class _BrandsHook extends Hook<(bool, List<Brand>)> {
  const _BrandsHook();
  @override
  _BrandHookState createState() => _BrandHookState();
}

class _BrandHookState extends HookState<(bool, List<Brand>), _BrandsHook> {
  bool loading = true;

  List<Brand> brands = [];

  final BrandService brandService = BrandService();

  @override
  void initHook() async {
    super.initHook();

    // api request
    brands = await brandService.getAll();
    loading = false;
    setState(() {});
  }

  @override
  (bool, List<Brand>) build(BuildContext context) => (loading, brands);
}
