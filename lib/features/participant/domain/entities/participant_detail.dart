import 'package:equatable/equatable.dart';

class ParticipantDetail extends Equatable {
  final Map<String, dynamic> rawJson;

  const ParticipantDetail(this.rawJson);

  Map<String, dynamic> get _data => rawJson['corredor'] is Map 
      ? (rawJson['corredor'] as Map).cast<String, dynamic>() 
      : rawJson;

  String get id => _data['id']?.toString() ?? '';
  String get name => _data['nombre']?.toString() ?? '';
  String get dni => _data['dni']?.toString() ?? _data['documento']?.toString() ?? '';
  String get status => _data['estado']?.toString() ?? _data['status']?.toString() ?? '';
  bool get isAcreditado => status.trim().toUpperCase() == 'AC';
  static String resolveUrl(String link) {
    final trimmed = link.trim();
    if (trimmed.isEmpty) return '';
    if (trimmed.startsWith('http://') || trimmed.startsWith('https://')) return trimmed;
    const prefix = '/website/juna.net.ar/site/public_html';
    if (trimmed.startsWith(prefix)) {
      return 'https://juna.net.ar${trimmed.substring(prefix.length)}';
    }
    if (trimmed.startsWith('/')) {
      return 'https://juna.net.ar$trimmed';
    }
    return 'https://juna.net.ar/$trimmed';
  }

  String get nroPlaca => _data['nroPlaca']?.toString() ?? '';
  String get linkPago => resolveUrl(_data['linkPago']?.toString() ?? '');
  String get linkEncuesta =>
      _data['linkEncuesta']?.toString() ??
      _data['link_encuesta']?.toString() ??
      rawJson['linkEncuesta']?.toString() ??
      rawJson['link_encuesta']?.toString() ??
      '';
  String get linkEncuestaUrl => resolveUrl(linkEncuesta);
  bool get encuestaRespondida {
    final val = _data['encuestaRespondida'] ??
        _data['encuesta_respondida'] ??
        rawJson['encuestaRespondida'] ??
        rawJson['encuesta_respondida'];
    if (val == null) return false;
    if (val is bool) return val;
    final str = val.toString().trim().toLowerCase();
    return str == 'true' || str == '1';
  }
  String get lastName => _data['apellido']?.toString() ?? '';
  String get fullName => '$name $lastName'.trim();
  String get circuito => _data['idCircuitoNombre']?.toString() ?? '';
  String get categoria => _data['categoriaNombre']?.toString() ?? '';
  String get agrupamiento => _data['agrupamiento']?.toString() ?? '';
  String get largada => _data['largada']?.toString() ?? '';
  List<String> get articulos => (_data['articulos'] as List?)?.map((e) => e.toString()).toList() ?? [];

  String get contCelular => _data['contCelular']?.toString() ?? '';
  String get contEmail => _data['contEmail']?.toString() ?? '';
  String get contInstagram => _data['contInstagram']?.toString() ?? '';
  String get contNombre => _data['contNombre']?.toString() ?? '';
  String get contTel => _data['contTel']?.toString() ?? '';
  String get domCiudad => _data['domCiudad']?.toString() ?? '';
  String get domCiudadNombre => _data['domCiudadNombre']?.toString() ?? '';
  String get domProvincia => _data['domProvincia']?.toString() ?? '';
  String get domPais => _data['domPais']?.toString() ?? '';
  String get insCodDesc => _data['insCodDesc']?.toString() ?? '';

  String get ins => _data['ins']?.toString() ?? rawJson['ins']?.toString() ?? '';
  String get insId => _data['ins']?.toString() ?? rawJson['ins']?.toString() ?? _data['insId']?.toString() ?? _data['id']?.toString() ?? '';
  String get idCircuito => _data['idCircuito']?.toString() ?? '';
  String get idCategoria => _data['idCategoria']?.toString() ?? '';
  String get partTalleId => _data['partTalleId']?.toString() ?? '';

  String get grupoEntrenamiento => _data['grupoEntrenamiento']?.toString() ?? _data['grupo_entrenamiento']?.toString() ?? '';
  String get centroAcreditacion => _data['centroAcreditacion']?.toString() ?? _data['centro_acreditacion']?.toString() ?? '';
  String get cacreId => _data['cacreId']?.toString() ?? _data['cacre_id']?.toString() ?? '';
  String get marcaZapatillas => _data['marcaZapatillas']?.toString() ?? _data['marca_zapatillas']?.toString() ?? _data['zapatillas']?.toString() ?? '';
  String get marcbId => _data['marcbId']?.toString() ?? _data['marcb_id']?.toString() ?? '';
  String get marcbLabel => _data['marcb_label']?.toString() ?? _data['marcbLabel']?.toString() ?? '';

  String get partiFacimo => _data['partiFacimo']?.toString() ?? _data['parti_facimo']?.toString() ?? '';
  String get tipoCarrera => _data['tipoCarrera']?.toString() ?? _data['tipo_carrera']?.toString() ?? '';
  String get tipoEvento => _data['tipoEvento']?.toString() ?? _data['tipo_evento']?.toString() ?? '';
  String get autorizadoDni =>
      _data['autorizadoDni']?.toString() ??
      _data['autorizado_dni']?.toString() ??
      rawJson['autorizadoDni']?.toString() ??
      rawJson['autorizado_dni']?.toString() ??
      '';
  String get autorizadoNombre =>
      _data['autorizadoNombre']?.toString() ??
      _data['autorizado_nombre']?.toString() ??
      rawJson['autorizadoNombre']?.toString() ??
      rawJson['autorizado_nombre']?.toString() ??
      '';

  @override
  List<Object?> get props => [rawJson];
}
