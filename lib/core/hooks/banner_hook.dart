import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:wael/core/services/banner_service.dart';
import 'package:wael/data/model/api/models/banner_model.dart';

(bool, List<BannerModel>) useBannerHook() {
  return use(_BannersHook());
}

class _BannersHook extends Hook<(bool, List<BannerModel>)> {
  const _BannersHook();
  @override
  _BannerHookState createState() => _BannerHookState();
}

class _BannerHookState
    extends HookState<(bool, List<BannerModel>), _BannersHook> {
  bool loading = true;

  List<BannerModel> banners = [];

  final BannerService bannerService = BannerService();

  @override
  void initHook() async {
    super.initHook();

    // api request
    banners = await bannerService.getAll();
    loading = false;
    setState(() {});
  }

  @override
  (bool, List<BannerModel>) build(BuildContext context) => (loading, banners);
}
