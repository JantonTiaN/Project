import 'package:cloud_firestore/cloud_firestore.dart';

class OurPatients {
  String patientId;
  String patientEmail;
  String patientFullName;
  String patientTel;
  String patientDrugallergy;
  String patientBirthDate;

  OurPatients({
    this.patientId,
    this.patientEmail,
    this.patientFullName,
    this.patientTel,
    this.patientDrugallergy,
    this.patientBirthDate,
  });
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

  OurDentists({
    this.dentistID,
    this.dentistFullname,
    this.dentistEmail,
    this.dentistCitizenID,
    this.dentistTel,
    this.dentistPermission,
    this.dentistBirthDate,
    this.dentistWorkingTime
  });
}