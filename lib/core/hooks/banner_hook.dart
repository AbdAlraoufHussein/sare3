import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:wael/core/services/banner_service.dart';
import 'package:wael/data/model/api/banner.dart';

(bool, List<Banner>) useBannerHook() {
  return use(_BannersHook());
}

class _BannersHook extends Hook<(bool, List<Banner>)> {
  const _BannersHook();
  @override
  _BannerHookState createState() => _BannerHookState();
}

class _BannerHookState extends HookState<(bool, List<Banner>), _BannersHook> {
  bool loading = true;

  List<Banner> banners = [];

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
  (bool, List<Banner>) build(BuildContext context) => (loading, banners);
}
