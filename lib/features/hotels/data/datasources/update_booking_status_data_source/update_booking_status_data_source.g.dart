// // GENERATED CODE - DO NOT MODIFY BY HAND
//
// part of 'update_booking_status_data_source.dart';
//
// // **************************************************************************
// // RetrofitGenerator
// // **************************************************************************
//
// // ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers
//
// class _UpdateBookingDataSource implements UpdateBookingDataSource {
//   _UpdateBookingDataSource(
//     this._dio, {
//     this.baseUrl,
//   }) {
//     baseUrl ??= 'http://api.mahmoudtaha.com/api';
//   }
//
//   final Dio _dio;
//
//   String? baseUrl;
//
//   @override
//   Future<UpdateBookingStatus> updateBooking({
//     bookingId,
//     type,
//   }) async {
//     const _extra = <String, dynamic>{};
//     final queryParameters = <String, dynamic>{};
//     queryParameters.removeWhere((k, v) => v == null);
//     final _headers = <String, dynamic>{};
//     final _data = FormData();
//     if (bookingId != null) {
//       _data.fields.add(MapEntry(
//         'booking_id',
//         bookingId.toString(),
//       ));
//     }
//     if (type != null) {
//       _data.fields.add(MapEntry(
//         'type',
//         type,
//       ));
//     }
//     final _result = await _dio.fetch<Map<String, dynamic>>(
//         _setStreamType<UpdateBookingStatus>(Options(
//       method: 'POST',
//       headers: _headers,
//       extra: _extra,
//       contentType: 'multipart/form-data',
//     )
//             .compose(
//               _dio.options,
//               'update-booking-status',
//               queryParameters: queryParameters,
//               data: _data,
//             )
//             .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
//     final value = UpdateBookingStatus.fromJson(_result.data!);
//     return value;
//   }
//
//   RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
//     if (T != dynamic &&
//         !(requestOptions.responseType == ResponseType.bytes ||
//             requestOptions.responseType == ResponseType.stream)) {
//       if (T == String) {
//         requestOptions.responseType = ResponseType.plain;
//       } else {
//         requestOptions.responseType = ResponseType.json;
//       }
//     }
//     return requestOptions;
//   }
// }
