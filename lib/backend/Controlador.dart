//importar paquete gsheets para poder usar la api de google sheets
import 'package:app_la_buena/backend/Herramienta.dart';
import 'package:gsheets/gsheets.dart';

//crear una variable de credential para extraer los permisos desde GoogleCloud
const credential = {
  "type": "service_account",
  "project_id": "internalinformatica",
  "private_key_id": "a317534b5de7e771b9e2294203f599a44bfa72ed",
  "private_key":
      "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCda6SFzji65Wwv\n0jJ3vPFG+/MggRtr5b60ZXshgFQM6W7WV2ftvNW4xmHchPVcExrmXuy/vnthFLfd\nzC2FTelKurXPZYOLNHOKI2ErAFoMm5xiRngbOoT95tVTefqKhiCsEcI2C3AyuL4L\ntdSWvIfAI1xXqkF2gSmJYTWDzp4oFUTOaXdnvh8ZiUgZ1lZ7hfl0RNM04i2EwX/+\nYRbBVf93V5njU9HUDSaXutmzGxFH+ye4IjBD0WUUF46D7I8oBL4SRiXvFMUt/92n\nHqSJIIWrp71Q56/cHRfHnIcJfrXpwmm9qJmSUfKYVrHmC0oFM9ZjFdixiHWxRx4i\nyrXSO7IjAgMBAAECggEAKOxLx9EVZFix6DifkAsZOhfTW3bUtxbxnZnoCYx/zR9+\nBdCRHveBI9jGpfoWgsogqxSwPSR6lIE7Tzh9+PKJHDkvfGvqZ2zKQHX0E6aywiZN\n4CprnMB4xDyW5m2GWS6HHdQ8Baqxjy4Bka/CRTFbpPJMVinXfMQVFTalH8+9w7Nj\nWKt1aE3Z3KBY9zjOnR9LAeKUWahlyAYDAJxFUBluM4Ib98OExbD18+qWayF8fuqq\nFCSsQw+a9XZ2wAWxiR3tgXGx8sWcSbgIAXjsbTsPAtNVX+JCe4f5OIxhdu7OU+Xh\ntJHZcxc5/eNGcvQGqA8+4t0d9ZKtLLVf2b+yJIpyMQKBgQDNyisq7ojMnpTdXRrK\nr81CYhUM8U0igvKqFKCiuV2aj+UvM+u+eFdJ1XU1fm5iKSknV3wsK6oLb7Cgr/+n\n/njaztAH0XxMLIEuTvv6n2YrM2r4s0rf4cmBh7kVA+io8dRvBAB0iYq8AK0ZoSCR\nm+rzyq1cHe8NIdze2fZTjBpk2wKBgQDD1Ehs1+JM5f9oO/4CUqhR1l+0Sgg93Tjz\nHVE7JtZ5xrr8WazbbYkPTv+hNGuoGN4Y+modpIt0MTxL9YwU0IJ8sIxKUMBKfruX\nBkJXHeQutyGsRSTts+CQ0TohgdVC+g9nSDs4VCdwdNAaCAYebBxwThbDIPxIuqbm\nNTKCVgyGWQKBgAGFELSMdm4sbaUE3wHIMpfe6ZDi51Lt7KTc6iLJg6t0jJjApWkO\nsnZVITx35pDLBQbJWp1o5SSYepF1O0oeUv4qsNad8XEOkxWod6vuKW8APjX//PmS\nTU6rle5VzQ4SWyNGwEocCe5BgwXBbuAkaqPKR2V6wx0xttPegDc1vawpAoGAFvUV\nBIWOhxtThOG7loQgLW/nSlh/fNkpav7d3gRgkmgk1Z6hsBu4PK4zM6/UiyFXMDBz\nLkRzAM0g13rS0EHdekasO64ZzOHslfjq4BGmBX/8l5iHisJSqkeM/A6fdLmiAqaq\nIqFi+kEHgHW+WeSstNHCw19jlBclp8lGwZba4wkCgYEAvPDWMKPOEWbH81YOz2h4\nZBFSbPYTUzwGeTC5CYCWlaMnh1Xc7sUtOSv+XunEwXOq81mEpXkYgxAvfxFX6Nd5\njk7Q3G97/ul5KJM+vZp4u8W/aY8JOhUwo2Vjr+StboPkL+vb1yKdbeOFxSmd8Bfs\nhCq+al9vdlp9k8ThNqnabG8=\n-----END PRIVATE KEY-----\n",
  "client_email":
      "voltecappinventario@internalinformatica.iam.gserviceaccount.com",
  "client_id": "103947791305876007678",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url":
      "https://www.googleapis.com/robot/v1/metadata/x509/voltecappinventario%40internalinformatica.iam.gserviceaccount.com"
};

//crear una variable con el id de la hoja de calculo
const spreadSheetId = "10wOouRAEntUEtDSH63o-vLMPKyQmOf4bkEVbIfgBi2I";

//crear la clase controlador para agregar las diferentes hojas de calculo que conforman el spreadsheet e interactuar con ellas
class Controlador {
  final GSheets gSheets = GSheets(credential);
  late Spreadsheet spreadsheet;
  late Worksheet worksheetHerramientas;
  late Worksheet worksheetRefacciones;
  late Worksheet worksheetMecanica;
  late Worksheet worksheetViajes;
  late Worksheet worksheetBotiquin;
  late Worksheet worksheetEventos;
  late Worksheet worksheetLego;

//crear el metodo init para inicializar las hojas de calculo
  Future<void> init() async {
    spreadsheet = await gSheets.spreadsheet(spreadSheetId);
    worksheetHerramientas = (spreadsheet.worksheetByTitle('Herramientas'))!;
    worksheetRefacciones = (spreadsheet.worksheetByTitle('Refacciones'))!;
    worksheetMecanica = (spreadsheet.worksheetByTitle('Mecanica'))!;
    worksheetViajes = (spreadsheet.worksheetByTitle('Viajes'))!;
    worksheetBotiquin = (spreadsheet.worksheetByTitle('Botiquin'))!;
    worksheetEventos = (spreadsheet.worksheetByTitle('Eventos'))!;
    worksheetLego = (spreadsheet.worksheetByTitle('Lego'))!;
  }

  //metodo getAll para obtener todos los registros de la hoja de calculo
  Future<List<Herramienta>?> getAll(String worksheet) async {
    //usar la variable workseet para seleccionar la hoja de calculo que se desea consultar

    await init();
    Worksheet sheet;

    print(worksheet + "HIAAA");
    switch (worksheet) {
      case "Herramientas":
        sheet = worksheetHerramientas;
        break;
      case "Refacciones":
        sheet = worksheetRefacciones;
        break;
      case "Mecanica":
        sheet = worksheetMecanica;
        break;
      case "Viajes":
        sheet = worksheetViajes;
        break;
      case "Botiquin":
        sheet = worksheetBotiquin;
        break;
      case "Eventos":
        sheet = worksheetEventos;
        break;
      case "Lego":
        sheet = worksheetLego;
        break;
      default:
        sheet = worksheetHerramientas;
    }
    final herramienta = (await sheet.values.map.allRows());
    return herramienta!.map((json) => Herramienta.fromGsheets(json)).toList();
  }

  //metodo getById para obtener un registro de la hoja de calculo por su id
  Future<Herramienta?> getById(int id, String worksheet) async {
    Worksheet sheet;
    //usar la variable workseet para seleccionar la hoja de calculo que se desea consultar
    switch (worksheet) {
      case 'Herramientas':
        sheet = worksheetHerramientas;
        break;
      case 'Refacciones':
        sheet = worksheetRefacciones;
        break;
      case 'Mecanica':
        sheet = worksheetMecanica;
        break;
      case 'Viajes':
        sheet = worksheetViajes;
        break;
      case 'Botiquin':
        sheet = worksheetBotiquin;
        break;
      case 'Eventos':
        sheet = worksheetEventos;
        break;
      case 'Lego':
        sheet = worksheetLego;
        break;
      default:
        sheet = worksheetHerramientas;
    }
    //recorrer la hoja de calculo con su id correspondiente empezando desde la columna 1
    await init();
    final map = await sheet.values.map.rowByKey(
      id,
      fromColumn: 1,
    );
    return map == null ? null : Herramienta.fromGsheets(map);
  }
}
