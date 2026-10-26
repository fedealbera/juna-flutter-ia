import '../dto/runner_dto.dart';

class MockRunnersDataSource {
  static List<RunnerDto> getMockRunners() {
    return const [
      // ==================== CIRCUITO: 5K ====================
      // MUJERES 5K
      RunnerDto(
        id: '5k_mujeres_1',
        nombre: 'NANCY',
        apellido: 'JUSTINIANO',
        dorsal: '',
        circuito: '5K',
        categoria: 'MUJERES 5K',
        provincia: 'TUCUMÁN',
        sexo: 'F',
      ),
      RunnerDto(
        id: '5k_mujeres_2',
        nombre: 'ROCIO GABRIELA',
        apellido: 'LOPEZ',
        dorsal: '',
        circuito: '5K',
        categoria: 'MUJERES 5K',
        provincia: 'TUCUMÁN',
        sexo: 'F',
      ),
      RunnerDto(
        id: '5k_mujeres_3',
        nombre: 'APRIL',
        apellido: 'LUNA',
        dorsal: '',
        circuito: '5K',
        categoria: 'MUJERES 5K',
        provincia: 'TUCUMÁN',
        sexo: 'F',
      ),
      RunnerDto(
        id: '5k_mujeres_4',
        nombre: 'ELVIRA',
        apellido: 'MALCUN CASTRO',
        dorsal: '',
        circuito: '5K',
        categoria: 'MUJERES 5K',
        provincia: 'TUCUMÁN',
        sexo: 'F',
      ),

      // HOMBRES 5K
      RunnerDto(
        id: '5k_hombres_1',
        nombre: 'ARVID',
        apellido: 'LINDBLAD',
        dorsal: '',
        circuito: '5K',
        categoria: 'HOMBRES 5K',
        provincia: 'SALTA',
        sexo: 'M',
      ),
      RunnerDto(
        id: '5k_hombres_2',
        nombre: 'JOSé IVáN',
        apellido: 'MAMUF',
        dorsal: '',
        circuito: '5K',
        categoria: 'HOMBRES 5K',
        provincia: 'TUCUMÁN',
        sexo: 'M',
      ),
      RunnerDto(
        id: '5k_hombres_3',
        nombre: 'MATIAS',
        apellido: 'ZUVIRIA',
        dorsal: '',
        circuito: '5K',
        categoria: 'HOMBRES 5K',
        provincia: 'MENDOZA',
        sexo: 'M',
      ),

      // ==================== CIRCUITO: 10K ====================
      // MUJERES 20-24
      RunnerDto(
        id: '10k_mujeres_20_24_1',
        nombre: 'MARIANA',
        apellido: 'FERNáNDEZ',
        dorsal: '',
        circuito: '10K',
        categoria: 'MUJERES 20-24',
        provincia: 'TUCUMÁN',
        sexo: 'F',
      ),

      // MUJERES 30-34
      RunnerDto(
        id: '10k_mujeres_30_34_1',
        nombre: 'LEONELLA',
        apellido: 'MARTINEZ',
        dorsal: '',
        circuito: '10K',
        categoria: 'MUJERES 30-34',
        provincia: 'TUCUMÁN',
        sexo: 'F',
      ),

      // MUJERES 40-44
      RunnerDto(
        id: '10k_mujeres_40_44_1',
        nombre: 'ANA CAROLINA',
        apellido: 'MARTINEZ',
        dorsal: '',
        circuito: '10K',
        categoria: 'MUJERES 40-44',
        provincia: 'TUCUMÁN',
        sexo: 'F',
      ),

      // MUJERES 45-49
      RunnerDto(
        id: '10k_mujeres_45_49_1',
        nombre: 'MARTITA GUADALUPE',
        apellido: 'MARTINES',
        dorsal: '',
        circuito: '10K',
        categoria: 'MUJERES 45-49',
        provincia: 'TUCUMÁN',
        sexo: 'F',
      ),

      // MUJERES 50-54
      RunnerDto(
        id: '10k_mujeres_50_54_1',
        nombre: 'PATRICIA LILIANA',
        apellido: 'GOMEZ',
        dorsal: '',
        circuito: '10K',
        categoria: 'MUJERES 50-54',
        provincia: 'TUCUMÁN',
        sexo: 'F',
      ),
      RunnerDto(
        id: '10k_mujeres_50_54_2',
        nombre: 'KARINA GUADALUPE',
        apellido: 'LEMOS',
        dorsal: '',
        circuito: '10K',
        categoria: 'MUJERES 50-54',
        provincia: 'TUCUMÁN',
        sexo: 'F',
      ),

      // HOMBRES 20-24
      RunnerDto(
        id: '10k_hombres_20_24_1',
        nombre: 'KIMI',
        apellido: 'ANTONELLI',
        dorsal: '',
        circuito: '10K',
        categoria: 'HOMBRES 20-24',
        provincia: 'CHUBUT',
        sexo: 'M',
      ),
      RunnerDto(
        id: '10k_hombres_20_24_2',
        nombre: 'ISACK',
        apellido: 'HADJAR',
        dorsal: '',
        circuito: '10K',
        categoria: 'HOMBRES 20-24',
        provincia: 'NEUQUÉN',
        sexo: 'M',
      ),
      RunnerDto(
        id: '10k_hombres_20_24_3',
        nombre: 'MATIAS',
        apellido: 'MANSERVIGI',
        dorsal: '',
        circuito: '10K',
        categoria: 'HOMBRES 20-24',
        provincia: 'TUCUMÁN',
        sexo: 'M',
      ),

      // HOMBRES 25-29
      RunnerDto(
        id: '10k_hombres_25_29_1',
        nombre: 'FRANCISCO LO',
        apellido: 'MANSERVIGI LO',
        dorsal: '',
        circuito: '10K',
        categoria: 'HOMBRES 25-29',
        provincia: 'TUCUMÁN',
        sexo: 'M',
      ),
      RunnerDto(
        id: '10k_hombres_25_29_2',
        nombre: 'LANDO',
        apellido: 'NORRIS',
        dorsal: '',
        circuito: '10K',
        categoria: 'HOMBRES 25-29',
        provincia: 'SALTA',
        sexo: 'M',
      ),

      // HOMBRES 35-39
      RunnerDto(
        id: '10k_hombres_35_39_1',
        nombre: 'JUAN PABLO',
        apellido: 'ABDELNUR',
        dorsal: '',
        circuito: '10K',
        categoria: 'HOMBRES 35-39',
        provincia: 'TUCUMÁN',
        sexo: 'M',
      ),
      RunnerDto(
        id: '10k_hombres_35_39_2',
        nombre: 'NIGEL',
        apellido: 'MANSEL',
        dorsal: '',
        circuito: '10K',
        categoria: 'HOMBRES 35-39',
        provincia: 'CABA',
        sexo: 'M',
      ),

      // HOMBRES 45-49
      RunnerDto(
        id: '10k_hombres_45_49_1',
        nombre: 'PAULO',
        apellido: 'GARBICH PEREZ',
        dorsal: '',
        circuito: '10K',
        categoria: 'HOMBRES 45-49',
        provincia: 'TUCUMÁN',
        sexo: 'M',
      ),
      RunnerDto(
        id: '10k_hombres_45_49_2',
        nombre: 'DIEGO ROBERTO',
        apellido: 'MARTIN',
        dorsal: '',
        circuito: '10K',
        categoria: 'HOMBRES 45-49',
        provincia: 'TUCUMÁN',
        sexo: 'M',
      ),

      // ==================== CIRCUITO: 21K ====================
      // MUJERES 30-34
      RunnerDto(
        id: '21k_mujeres_30_34_1',
        nombre: 'VALENTINA MARIA',
        apellido: 'MALINAR',
        dorsal: '',
        circuito: '21K',
        categoria: 'MUJERES 30-34',
        provincia: 'TUCUMÁN',
        sexo: 'F',
      ),

      // MUJERES 35-39
      RunnerDto(
        id: '21k_mujeres_35_39_1',
        nombre: 'MARíA SUSANA',
        apellido: 'GONZáLEZ CHAN',
        dorsal: '',
        circuito: '21K',
        categoria: 'MUJERES 35-39',
        provincia: 'TUCUMÁN',
        sexo: 'F',
      ),

      // HOMBRES 25-29
      RunnerDto(
        id: '21k_hombres_25_29_1',
        nombre: 'MIGUEL',
        apellido: 'MAIOLANI',
        dorsal: '',
        circuito: '21K',
        categoria: 'HOMBRES 25-29',
        provincia: 'TUCUMÁN',
        sexo: 'M',
      ),

      // HOMBRES 35-39
      RunnerDto(
        id: '21k_hombres_35_39_1',
        nombre: 'SEBASTIáN JOSé',
        apellido: 'BACH',
        dorsal: '',
        circuito: '21K',
        categoria: 'HOMBRES 35-39',
        provincia: 'TUCUMÁN',
        sexo: 'M',
      ),
    ];
  }
}
