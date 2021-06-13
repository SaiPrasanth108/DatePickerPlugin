var exec = require('cordova/exec');

exports.coolMethod = function (arg0, success, error) {
  exec(success, error, 'DatePickerPlugin', 'coolMethod', [arg0]);
};

exports.createDatePicker = function (arg0, success, error) {
  exec(success, error, 'DatePickerPlugin', 'createDatePicker', [arg0]);
};
