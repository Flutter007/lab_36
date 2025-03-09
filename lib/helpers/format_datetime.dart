import 'package:flutter/material.dart';

String zeroPad(int dateTimeValue) {
  if (dateTimeValue < 10) {
    return '0$dateTimeValue';
  }
  return dateTimeValue.toString();
}

String formatDate(DateTime dateTime) {
  final day = zeroPad(dateTime.day);
  final month = zeroPad(dateTime.month);
  final year = zeroPad(dateTime.year);
  return '$day.$month.$year';
}

String formatTime(TimeOfDay time) {
  final hour = zeroPad(time.hour);
  final minutes = zeroPad(time.minute);
  return '$hour:$minutes';
}

String formatDateTime(DateTime dateTime) {
  final date = formatDate(dateTime);
  final time = formatTime(TimeOfDay.fromDateTime(dateTime));
  return '$date $time';
}
