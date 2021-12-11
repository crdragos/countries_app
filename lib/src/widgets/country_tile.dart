import 'package:countries_app/src/models/country.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class CountryTile extends StatelessWidget {
  const CountryTile(this.country, {Key? key}) : super(key: key);

  final Country country;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFB764CE),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Image.network(
                country.flagImageUrl ?? '',
                // country.flagImageUrl,
                height: 50,
                width: 50,
              ),
              Text(
                country.name.length > 20 ? '${country.name.substring(0, 15)}...' : country.name,
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (country.coatOfArmsImageUrl != null)
                Image.network(
                  country.coatOfArmsImageUrl ?? '',
                  // country.badgeImageUrl,
                  height: 50,
                  width: 50,
                )
              else
                const FaIcon(
                  FontAwesomeIcons.timesCircle,
                  size: 35,
                  color: Colors.redAccent,
                ),
            ],
          ).paddingOnly(bottom: 20.0),
          Row(
            children: <Widget>[
              Container(
                height: 30,
                width: 30,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: FaIcon(
                    country.region.toLowerCase() == 'europe'
                        ? FontAwesomeIcons.globeEurope
                        : country.region.toLowerCase() == 'asia'
                            ? FontAwesomeIcons.globeAsia
                            : country.region.toLowerCase() == 'africa'
                                ? FontAwesomeIcons.globeAfrica
                                : country.region.toLowerCase() == 'americas'
                                    ? FontAwesomeIcons.globeAmericas
                                    : FontAwesomeIcons.globe,
                    color: Colors.white,
                  ),
                ),
              ),
              Text(
                country.region,
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ).paddingOnly(left: 8.0),
            ],
          ).paddingOnly(bottom: 10.0),
          Row(
            children: <Widget>[
              Container(
                height: 30.0,
                width: 30.0,
                child: const FittedBox(
                  fit: BoxFit.contain,
                  child: FaIcon(
                    FontAwesomeIcons.mapMarkerAlt,
                    color: Colors.deepOrangeAccent,
                  ),
                ),
              ),
              Text(
                'lat: ${country.latitude.toStringAsFixed(2)} \t long: ${country.longitude.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ).paddingOnly(left: 8.0),
            ],
          ).paddingOnly(bottom: 10.0),
          Row(
            children: <Widget>[
              Container(
                height: 30.0,
                width: 30.0,
                child: const FittedBox(
                  fit: BoxFit.contain,
                  child: FaIcon(
                    FontAwesomeIcons.solidMoneyBillAlt,
                    color: Colors.green,
                  ),
                ),
              ),
              Text(
                country.currencies.keys.first,
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ).paddingOnly(left: 8.0),
            ],
          ),
        ],
      ).paddingAll(16.0),
    );
  }
}
