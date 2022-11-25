
import 'package:amap_flutter_map/amap_flutter_map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_optical_storage/models/api/power_station/power_station.dart';
import 'package:flutter_optical_storage/utils/const.dart';
// ignore: depend_on_referenced_packages
import 'package:amap_flutter_base/amap_flutter_base.dart';


class AmapMarketWidget extends StatefulWidget {
  final List<PowerStationModel> data;
  const AmapMarketWidget(this.data, {Key? key}) : super(key: key);

  @override
  State<AmapMarketWidget> createState() => _AmapMarketWidgetState();
}

class _AmapMarketWidgetState extends State<AmapMarketWidget> {

  final Map<String, Marker> _initMarkerMap = <String, Marker>{};


  late CameraPosition kInitialPosition;

  void onMapCreated(AMapController controller) {
    getApprovalNumber(controller);
  }

  /// 获取审图号
  void getApprovalNumber(mapController) async {
    //普通地图审图号
    String? mapContentApprovalNumber = await mapController?.getMapContentApprovalNumber();
    //卫星地图审图号
    String? satelliteImageApprovalNumber = await mapController?.getSatelliteImageApprovalNumber();
 
    print('地图审图号（普通地图）: $mapContentApprovalNumber');
    print('地图审图号（卫星地图): $satelliteImageApprovalNumber');
  }
  @override
  void initState() {
    for (var item in widget.data) {
      LatLng position = LatLng(
        double.parse(item.lat!),
        double.parse(item.lon!)
      );
      Marker marker = Marker(position: position, infoWindow: InfoWindow(title: item.name));
      _initMarkerMap[marker.id] = marker;
    }
    kInitialPosition = CameraPosition(
      target:  LatLng(
        double.parse(widget.data[0].lat!),
        double.parse(widget.data[0].lon!),
      ),
      zoom: 6.0,
    );

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    ///使用默认属性创建一个地图
    final AMapWidget map = AMapWidget(
      initialCameraPosition: kInitialPosition,
      buildingsEnabled: false,
      markers: Set<Marker>.of(_initMarkerMap.values),
      apiKey: Const.amapApiKeys,
      onMapCreated: onMapCreated,
      privacyStatement: const AMapPrivacyStatement(hasShow: true, hasAgree: true, hasContains: true),
    );
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 300,
      child: map,
    );
  }
}