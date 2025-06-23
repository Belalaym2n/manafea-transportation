// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
//
// import '../../../generated/locale_keys.g.dart';
//
// class DestinationDropdown extends StatefulWidget {
//   final Function(String selectedValue) onChanged;
//   final String selectedLocation;
//
//   const DestinationDropdown({
//     super.key,
//     required this.onChanged,
//     required this.selectedLocation,
//   });
//
//   @override
//   State<DestinationDropdown> createState() => _DestinationDropdownState();
// }
//
// class _DestinationDropdownState extends State<DestinationDropdown> {
//   final List<String> location = [
//     LocaleKeys.locations_riyadh,
//     LocaleKeys.locations_jeddah,
//     LocaleKeys.locations_makkah,
//     LocaleKeys.locations_madinah,
//     LocaleKeys.locations_dammam,
//     LocaleKeys.locations_khobar,
//     LocaleKeys.locations_taif,
//     LocaleKeys.locations_buraidah,
//     LocaleKeys.locations_abha,
//     LocaleKeys.locations_hail,
//     LocaleKeys.locations_tabuk,
//     LocaleKeys.locations_yanbu,
//     LocaleKeys.locations_qassim,
//     LocaleKeys.locations_jazan,
//     LocaleKeys.locations_najran,
//     LocaleKeys.locations_al_bahah,
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return DropdownButtonFormField<String>(
//       value: widget.selectedLocation,
//       decoration: InputDecoration(
//         labelText: "choose_destination".tr(),
//         border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
//       ),
//       items: location.map((locKey) {
//         return DropdownMenuItem<String>(
//           value: locKey,
//           child: Text(locKey.tr()),
//         );
//       }).toList(),
//       onChanged: (value) {
//         if (value != null) {
//           widget.onChanged(value);
//         }
//       },
//     );
//   }
//   }
