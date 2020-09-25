import 'package:flutter/cupertino.dart';

class OurPatients {
  String patientId;
  String patientEmail;
  String patientFullName;
  String patientTel;
  String patientDrugallergy;
  String patientBirthDate;
  List patientCase;
  Image patientImage;
  String patientSuggestion;

  OurPatients(
      {this.patientId,
      this.patientEmail,
      this.patientFullName,
      this.patientTel,
      this.patientDrugallergy,
      this.patientBirthDate,
      this.patientCase,
      this.patientImage,
      this.patientSuggestion});
}

class OurDentists {
  String dentistID;
  String dentistFullname;
  String dentistEmail;
  String dentistCitizenID;
  String dentistTel;
  String dentistPermission;
  String dentistBirthDate;
  List dentistWorkingTime;
  Image dentistImage;

  OurDentists(
      {this.dentistID,
      this.dentistFullname,
      this.dentistEmail,
      this.dentistCitizenID,
      this.dentistTel,
      this.dentistPermission,
      this.dentistBirthDate,
      this.dentistWorkingTime,
      this.dentistImage});
}
