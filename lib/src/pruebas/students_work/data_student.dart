import 'dart:convert';
import 'package:appdelivery/src/pruebas/students_work/domain/enums/inscr_status.dart';

class ResponseParent {
    ResponseParent({
        required this.statusCode,
        required this.mensaje,
        required this.error,
        required this.total,
        required this.resultParent,
    });

    String statusCode;
    String mensaje;
    String error;
    int total;
    List<ResultParent> resultParent;

    factory ResponseParent.fromJson(String str) => ResponseParent.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ResponseParent.fromMap(Map<String, dynamic> json) => ResponseParent(
        statusCode: json["statusCode"],
        mensaje: json["mensaje"],
        error: json["error"],
        total: json["total"],
        resultParent: List<ResultParent>.from(json["result"].map((x) => ResultParent.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "statusCode": statusCode,
        "mensaje": mensaje,
        "error": error,
        "total": total,
        "result": List<dynamic>.from(resultParent.map((x) => x.toMap())),
    };
}

class ResultParent {
    ResultParent({
        required this.id,
        required this.soporteWeconnet,
        required this.presentacionRegisterPassangerToList,
        required this.cedulaRepresentante,
        required this.nombreRepresentante,
        required this.apellidoRepresentante,
        required this.correoRepresentante,
        required this.telefonoRepresentante,
        required this.celularRepresentante,
        required this.direccionRepresentante,
        required this.passwordRepresentante,
        required this.estadoCalificado,
    });

    int id;
    String soporteWeconnet;
    List<PresentacionRegisterPassangerToList> presentacionRegisterPassangerToList;
    String cedulaRepresentante;
    String nombreRepresentante;
    String apellidoRepresentante;
    String correoRepresentante;
    String telefonoRepresentante;
    String celularRepresentante;
    String direccionRepresentante;
    String passwordRepresentante;
    String estadoCalificado;

    factory ResultParent.fromJson(String str) => ResultParent.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ResultParent.fromMap(Map<String, dynamic> json) => ResultParent(
        id: json["id"],
        soporteWeconnet: json["soporteWeconnet"],
        presentacionRegisterPassangerToList: List<PresentacionRegisterPassangerToList>.from(json["presentacionRegisterPassangerTOList"].map((x) => PresentacionRegisterPassangerToList.fromMap(x))),
        cedulaRepresentante: json["cedulaRepresentante"],
        nombreRepresentante: json["nombreRepresentante"],
        apellidoRepresentante: json["apellidoRepresentante"],
        correoRepresentante: json["correoRepresentante"],
        telefonoRepresentante: json["telefonoRepresentante"],
        celularRepresentante: json["celularRepresentante"],
        direccionRepresentante: json["direccionRepresentante"],
        passwordRepresentante: json["passwordRepresentante"],
        estadoCalificado: json["estadoCalificado"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "soporteWeconnet": soporteWeconnet,
        "presentacionRegisterPassangerTOList": List<dynamic>.from(presentacionRegisterPassangerToList.map((x) => x.toMap())),
        "cedulaRepresentante": cedulaRepresentante,
        "nombreRepresentante": nombreRepresentante,
        "apellidoRepresentante": apellidoRepresentante,
        "correoRepresentante": correoRepresentante,
        "telefonoRepresentante": telefonoRepresentante,
        "celularRepresentante": celularRepresentante,
        "direccionRepresentante": direccionRepresentante,
        "passwordRepresentante": passwordRepresentante,
        "estadoCalificado": estadoCalificado,
    };
}

class PresentacionRegisterPassangerToList {
    PresentacionRegisterPassangerToList({
        this.idNivel,
        this.producto,
        this.typeproduct,
        this.facturaElectronica,
        this.actividadExtracurricular,
        this.color,
        required this.inscrStatus,
        required this.mobilCompanyStatus,
        required this.presentacionRegisterCompanyDto,
        required this.idEstudiante,
        required this.cedulaEstudiante,
        required this.nombreEstudiante,
        required this.apellidoEstudiante,
        required this.direccionEstudiante,
    });

    dynamic idNivel;
    dynamic producto;
    dynamic typeproduct;
    dynamic facturaElectronica;
    dynamic actividadExtracurricular;
    dynamic color;
    InscrStatus inscrStatus;
    MobilCompanyStatus mobilCompanyStatus;
    PresentacionRegisterCompanyDto presentacionRegisterCompanyDto;
    int idEstudiante;
    String cedulaEstudiante;
    String nombreEstudiante;
    String apellidoEstudiante;
    List<dynamic> direccionEstudiante;

    factory PresentacionRegisterPassangerToList.fromJson(String str) => PresentacionRegisterPassangerToList.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory PresentacionRegisterPassangerToList.fromMap(Map<String, dynamic> json) => PresentacionRegisterPassangerToList(
        idNivel: json["idNivel"],
        producto: json["producto"],
        typeproduct: json["typeproduct"],
        facturaElectronica: json["facturaElectronica"],
        actividadExtracurricular: json["actividadExtracurricular"],
        color: json["color"],
        inscrStatus: inscrStatusValues.map[json["inscrStatus"]] ?? InscrStatus.DISABLED,
        mobilCompanyStatus: MobilCompanyStatus.fromMap(json["mobilCompanyStatus"]),
        presentacionRegisterCompanyDto: PresentacionRegisterCompanyDto.fromMap(json["presentacionRegisterCompanyDTO"]),
        idEstudiante: json["idEstudiante"],
        cedulaEstudiante: json["cedulaEstudiante"],
        nombreEstudiante: json["nombreEstudiante"],
        apellidoEstudiante: json["apellidoEstudiante"],
        direccionEstudiante: List<dynamic>.from(json["direccionEstudiante"].map((x) => x)),
    );

    Map<String, dynamic> toMap() => {
        "idNivel": idNivel,
        "producto": producto,
        "typeproduct": typeproduct,
        "facturaElectronica": facturaElectronica,
        "actividadExtracurricular": actividadExtracurricular,
        "color": color,
        "inscrStatus": inscrStatusValues.reverse[inscrStatus],
        "mobilCompanyStatus": mobilCompanyStatus.toMap(),
        "presentacionRegisterCompanyDTO": presentacionRegisterCompanyDto.toMap(),
        "idEstudiante": idEstudiante,
        "cedulaEstudiante": cedulaEstudiante,
        "nombreEstudiante": nombreEstudiante,
        "apellidoEstudiante": apellidoEstudiante,
        "direccionEstudiante": List<dynamic>.from(direccionEstudiante.map((x) => x)),
    };
}


class MobilCompanyStatus {
    MobilCompanyStatus({
        required this.companyId,
        required this.companyName,
        required this.companyStatus,
        required this.academicPeriodCurrent,
        required this.academicPeriodStatus,
    });

    int companyId;
    String companyName;
    bool companyStatus;
    String academicPeriodCurrent;
    bool academicPeriodStatus;

    factory MobilCompanyStatus.fromJson(String str) => MobilCompanyStatus.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory MobilCompanyStatus.fromMap(Map<String, dynamic> json) => MobilCompanyStatus(
        companyId: json["companyId"],
        companyName: json["companyName"],
        companyStatus: json["companyStatus"],
        academicPeriodCurrent: json["academicPeriodCurrent"],
        academicPeriodStatus: json["academicPeriodStatus"],
    );

    Map<String, dynamic> toMap() => {
        "companyId": companyId,
        "companyName": companyName,
        "companyStatus": companyStatus,
        "academicPeriodCurrent": academicPeriodCurrent,
        "academicPeriodStatus": academicPeriodStatus,
    };
}

class PresentacionRegisterCompanyDto {
    PresentacionRegisterCompanyDto({
        required this.idCompany,
        required this.soporteColegio,
        required this.nombreColegio,
        required this.ciudad,
    });

    int idCompany;
    String soporteColegio;
    String nombreColegio;
    String ciudad;

    factory PresentacionRegisterCompanyDto.fromJson(String str) => PresentacionRegisterCompanyDto.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory PresentacionRegisterCompanyDto.fromMap(Map<String, dynamic> json) => PresentacionRegisterCompanyDto(
        idCompany: json["idCompany"],
        soporteColegio: json["soporteColegio"],
        nombreColegio: json["nombreColegio"],
        ciudad: json["ciudad"],
    );

    Map<String, dynamic> toMap() => {
        "idCompany": idCompany,
        "soporteColegio": soporteColegio,
        "nombreColegio": nombreColegio,
        "ciudad": ciudad,
    };
}




