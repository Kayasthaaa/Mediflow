RegExp phoneNumberRegexp =
    RegExp(r"^(984|985|986|974|975|980|981|982|961|988|972|963)\d{7}$");

RegExp decimalNumberRegexp =
    RegExp(r"(?!^0*$)(?!^0*\.0*$)^\d{1,5}(\.\d{1,5})?$");
