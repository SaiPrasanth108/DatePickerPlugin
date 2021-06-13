var exec = require('cordova/exec');

exports.coolMethod = function (arg0, success, error) {
  exec(success, error, 'DatePickerPlugin', 'coolMethod', [arg0]);
};

exports.createDatePicker = function (
  labelName,
  topConstraint,
  topActive,
  bottomConstraint,
  bottomActive,
  leftConstraint,
  leftActive,
  rightConstraint,
  rightActive,
  centerX,
  centerY,
  success,
  error
) {
  exec(success, error, 'DatePickerPlugin', 'createDatePicker', [
    labelName,
    topConstraint,
    topActive,
    bottomConstraint,
    bottomActive,
    leftConstraint,
    leftActive,
    rightConstraint,
    rightActive,
    centerX,
    centerY,
  ]);
};
