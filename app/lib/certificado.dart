import 'package:app/cliente_model.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import 'data_model.dart';

Future<Uint8List> cerfiticado(
    PdfPageFormat pageFormat, ClienteModel cliente, CustomData data) async {
  final pdf = pw.Document();

  final libreBaskerville = await PdfGoogleFonts.libreBaskervilleRegular();
  final libreBaskervilleItalic = await PdfGoogleFonts.libreBaskervilleItalic();
  final libreBaskervilleBold = await PdfGoogleFonts.libreBaskervilleBold();
  final robotoLight = await PdfGoogleFonts.robotoLight();
  final robotoBold = await PdfGoogleFonts.robotoBold();

  final text1 = pw.TextStyle(
    font: robotoLight,
    fontSize: 11,
  );

  final text2 = pw.TextStyle(
    font: robotoBold,
    fontWeight: pw.FontWeight.bold,
    fontSize: 11,
  );

  final ByteData logo = await rootBundle.load('assets/logo.png');
  final ByteData agua = await rootBundle.load('assets/agua.png');
  final ByteData aranha = await rootBundle.load('assets/aranha.png');
  final ByteData barata = await rootBundle.load('assets/barata.png');
  final ByteData carrapato = await rootBundle.load('assets/carrapato.png');
  final ByteData covid = await rootBundle.load('assets/covid.png');
  final ByteData cupim = await rootBundle.load('assets/cupim.png');
  final ByteData dengue = await rootBundle.load('assets/dengue.png');
  final ByteData escorpiao = await rootBundle.load('assets/escorpiao.png');
  final ByteData formiga = await rootBundle.load('assets/formiga.png');
  final ByteData morcego = await rootBundle.load('assets/morcego.png');
  final ByteData pulga = await rootBundle.load('assets/pulga.png');
  final ByteData rato = await rootBundle.load('assets/rato.png');
  final ByteData traca = await rootBundle.load('assets/traca.png');
  final ByteData assinatura = await rootBundle.load('assets/assinatura.png');
  final ByteData pombo = await rootBundle.load('assets/pombo.jpeg');

  pw.Widget buildItemColumn(String text, Uint8List imageData) {
    return pw.Container(
      width: 45,
      height: 50,
      child: pw.Column(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text(
            text,
            style: pw.TextStyle(
              font: robotoLight,
              fontSize: 6,
            ),
          ),
          pw.Image(
            height: 25,
            width: 25,
            pw.MemoryImage(imageData),
          ),
          pw.Container(
            height: 15,
            width: 25,
            decoration: pw.BoxDecoration(
              border: pw.Border.all(color: const PdfColor.fromInt(0x0000ff)),
              borderRadius: pw.BorderRadius.circular(10),
            ),
            child: pw.Center(
                child: pw.Text(data.selectedPests.contains(text) ? 'X' : '')),
          ),
        ],
      ),
    );
  }

  pdf.addPage(
    pw.Page(
      build: (context) => pw.Column(
        children: [
          pw.Image(
            height: 50,
            width: 50,
            pw.MemoryImage(
              logo.buffer.asUint8List(),
            ),
          ),
          pw.RichText(
            text: pw.TextSpan(
                style: pw.TextStyle(
                  fontWeight: pw.FontWeight.bold,
                  fontSize: 25,
                ),
                children: [
                  const pw.TextSpan(text: 'Certificado '),
                  pw.TextSpan(
                    text: 'de',
                    style: pw.TextStyle(
                      fontStyle: pw.FontStyle.italic,
                      fontWeight: pw.FontWeight.normal,
                    ),
                  ),
                  const pw.TextSpan(text: ' GARANTIA'),
                ]),
          ),
          pw.Text(
            'DEDETIZADORA IGUATU',
            style: pw.TextStyle(
              font: robotoBold,
              fontSize: 20,
              fontWeight: pw.FontWeight.bold,
              color: const PdfColor.fromInt(0x0000ff),
            ),
          ),
          pw.Spacer(),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text('Rua Guilhardo Gomes de Araújo N° 300', style: text1),
                  pw.Text('BAIRRO: Cocobó  Iguatu - CE', style: text1),
                  pw.Text('EMAIL: theo.igor.menezes@hotmail.com', style: text1),
                  pw.Text('TELENONE: (88)9 9988-0918', style: text1),
                ],
              ),
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text('CNPJ: 27.575.700/000160', style: text1),
                  pw.Text('INSC. ESTADUAL N°: 06.647.032-3', style: text1),
                  pw.Text('ÁLVARA SANITÁRIO N°: 166/2021', style: text1),
                ],
              ),
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text('Responsável Técnico:'.toUpperCase(), style: text1),
                  pw.Text('Theo Igor Menezes do Amaral'.toUpperCase(),
                      style: text1),
                  pw.Text('CPF: 630.403.363-04', style: text1),
                ],
              ),
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text('Engenheiro Agronômo:'.toUpperCase(), style: text1),
                  pw.Text('EUGELIO LOPES BEZZERA', style: text1),
                  pw.Text('RP: 0607421274', style: text1),
                ],
              ),
            ],
          ),
          pw.Spacer(),
          pw.Container(
            decoration: pw.BoxDecoration(
              border: pw.Border.all(
                color: PdfColors.black,
              ),
            ),
            padding: const pw.EdgeInsets.all(10),
            child: pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.RichText(
                      text: pw.TextSpan(
                        children: [
                          pw.TextSpan(
                            text: 'Cliente: '.toUpperCase(),
                            style: text1,
                          ),
                          pw.TextSpan(
                            text: cliente.nome.toUpperCase(),
                            style: text2,
                          ),
                        ],
                      ),
                    ),
                    pw.RichText(
                      text: pw.TextSpan(
                        style: text1,
                        children: [
                          pw.TextSpan(text: 'Endereço:'.toUpperCase()),
                          pw.TextSpan(
                            text:
                                ' ${cliente.rua}, ${cliente.numero}, ${cliente.bairro}, ${cliente.cidade}, ${cliente.estado}'
                                    .toUpperCase(),
                            style: text2,
                          ),
                        ],
                      ),
                    ),
                    pw.RichText(
                      text: pw.TextSpan(
                        style: text1,
                        children: [
                          pw.TextSpan(
                              text: 'Ambiente dedetizado:'.toUpperCase()),
                          pw.TextSpan(
                            text: cliente.ambiente.toUpperCase(),
                            style: text2,
                          ),
                        ],
                      ),
                    ),
                    pw.RichText(
                      text: pw.TextSpan(
                        style: text1,
                        children: [
                          pw.TextSpan(text: 'Data da Execução:'.toUpperCase()),
                          pw.TextSpan(
                            text: DateFormat('dd/MM/yyyy')
                                .format(data.executionDate!),
                            style: text2,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.RichText(
                      text: pw.TextSpan(
                        style: text1,
                        children: [
                          const pw.TextSpan(text: 'CNPJ: '),
                          pw.TextSpan(
                            text: cliente.cnpj.toUpperCase(),
                            style: text2,
                          ),
                        ],
                      ),
                    ),
                    pw.RichText(
                      text: pw.TextSpan(
                        style: text1,
                        children: [
                          pw.TextSpan(text: 'Vencimento:'.toUpperCase()),
                          pw.TextSpan(
                            text: DateFormat('dd/MM/yyyy').format(
                              data.executionDate!.add(
                                Duration(days: data.validityInDays!),
                              ),
                            ),
                            style: text2,
                          ),
                        ],
                      ),
                    ),
                    pw.RichText(
                      text: pw.TextSpan(
                        style: text1,
                        children: [
                          pw.TextSpan(text: 'Validade:'.toUpperCase()),
                          pw.TextSpan(
                            text: '${data.validityInDays} dias',
                            style: text2,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          pw.Spacer(),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
            children: [
              buildItemColumn('COVID', covid.buffer.asUint8List()),
              buildItemColumn('TRAÇA', traca.buffer.asUint8List()),
              buildItemColumn('RATO', rato.buffer.asUint8List()),
              buildItemColumn('PULGA', pulga.buffer.asUint8List()),
              buildItemColumn('MORCEGO', morcego.buffer.asUint8List()),
              buildItemColumn('FORMIGA', formiga.buffer.asUint8List()),
              buildItemColumn('ESCORPIÃO', escorpiao.buffer.asUint8List()),
              buildItemColumn(
                  'MOSQUITO DA DENGUE', dengue.buffer.asUint8List()),
              buildItemColumn('CUPIM', cupim.buffer.asUint8List()),
              buildItemColumn('CARRAPATO', carrapato.buffer.asUint8List()),
              buildItemColumn('BARATA', barata.buffer.asUint8List()),
              buildItemColumn('ARANHA', aranha.buffer.asUint8List()),
              buildItemColumn(
                  'LIMPEZA DE CAIXA D\'ÁGUA', agua.buffer.asUint8List()),
              buildItemColumn('POMBO', pombo.buffer.asUint8List()),
            ],
          ),
          pw.Spacer(),
          pw.Row(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Table.fromTextArray(
                border: pw.TableBorder.all(),
                tableWidth: pw.TableWidth.min,
                headerDecoration:
                    const pw.BoxDecoration(color: PdfColors.grey300),
                headerHeight: 15,
                cellHeight: 15,
                headerStyle: pw.TextStyle(
                  fontWeight: pw.FontWeight.bold,
                  fontSize: 7,
                ),
                cellStyle: const pw.TextStyle(
                  fontSize: 7,
                ),
                cellAlignment: pw.Alignment.centerLeft,
                data: <List<String>>[
                  <String>[
                    'INGREDIENTE',
                    'GRUPO QUÍMICO',
                    'PRINCIPAIS ATIVOS',
                    'APLICAÇÃO',
                    'TRATAMENTO',
                  ],
                  <String>[
                    'Cyperex 250 ce',
                    'Piretroide',
                    'Cipermetrina e Classel',
                    '50ml p/5L de água 100m²',
                    'Anti-histaminico',
                    (data.selectedProducts.contains('Cyperex') ? 'X' : ' ')
                  ],
                  <String>[
                    'DDPV 1000',
                    'Organofosforado',
                    'Diciorvós classe II',
                    '50ml p/5L de água 100m²',
                    'Antronipa e oximas',
                    (data.selectedProducts.contains('DDPV') ? 'X' : ' ')
                  ],
                  <String>[
                    'Ratolbioc brodif',
                    'Hidroxicumarina',
                    'Brodifacoum',
                    '1 sache',
                    'Vitamnina k1',
                    (data.selectedProducts.contains('Ratolbioc') ? 'X' : ' ')
                  ],
                  <String>[
                    'Cipermitrina 250ce',
                    'Piretroide',
                    'Cipermitrina',
                    'N/A',
                    'Anti-histaminico',
                    (data.selectedProducts.contains('Cipermetrina') ? 'X' : ' ')
                  ],
                  <String>[
                    'Demand 2,5ce',
                    'Inseticida\npiretroide\nmicroencapsulado',
                    'lam bdacialotrina',
                    '30m l p/5L de água 100m²',
                    'Acetato de tocoferol',
                    (data.selectedProducts.contains('Demand') ? 'X' : ' ')
                  ],
                  <String>[
                    'Lankon 2,5ce',
                    'Piretroide',
                    'Lam bda-ialotrin-a2,5%',
                    '30m l p/5L de água 100m²',
                    'Vitamina K',
                    (data.selectedProducts.contains('Lankon') ? 'X' : ' ')
                  ],
                  <String>[
                    'Fipronol 2,5ce',
                    'Fenil pirazol',
                    'Fipronil',
                    '0,5g p/m²',
                    'Anti-histaminico',
                    (data.selectedProducts.contains('Fipronol') ? 'X' : ' ')
                  ],
                  <String>[
                    'Ri do rato pó 100gr',
                    'Cumarinico',
                    'Warfarim',
                    '100g p/Recipiente',
                    'Vitamina K1',
                    (data.selectedProducts.contains('Ri do rato pó')
                        ? 'X'
                        : ' ')
                  ],
                ],
              ),
              pw.Column(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                mainAxisSize: pw.MainAxisSize.max,
                children: [
                  pw.Container(
                    width: 250,
                    height: 100,
                    padding: const pw.EdgeInsets.all(10),
                    decoration: pw.BoxDecoration(
                      border: pw.Border.all(
                        color: PdfColors.black,
                      ),
                    ),
                    child: pw.Text(
                      'Orientações pertinentes à dedetização de ambiente:\n- O ambiente deve permanecer ventilado por um período mínimo de 60 minutos.\n- Produto de limpeza após 72 horas. Após 4 horas, é permitido passar um pano úmido.\n- Pessoas alérgicas, crianças, idosos, gestantes, animais domésticos e plantas sensíveis devem permanecer fora do ambiente por um período mínimo de 24 horas. As demais pessoas por um período mínimo de 4 horas.',
                      style: const pw.TextStyle(
                        fontSize: 7,
                      ),
                    ),
                  ),
                  pw.SizedBox(height: 20),
                  pw.Container(
                    height: 20,
                    width: 200,
                    decoration: const pw.BoxDecoration(
                      border: pw.Border(
                        bottom: pw.BorderSide(
                          width: 2,
                          color: PdfColors.black,
                        ),
                      ),
                    ),
                    child: pw.Image(
                      height: 20,
                      width: 200,
                      pw.MemoryImage(assinatura.buffer.asUint8List()),
                    ),
                  ),
                  pw.Text('RESPONSÁVEL TÉCNICO', style: text2),
                ],
              ),
            ],
          ),
        ],
      ),
      pageTheme: pw.PageTheme(
        pageFormat: pageFormat,
        orientation: pw.PageOrientation.landscape,
        theme: pw.ThemeData.withFont(
          base: libreBaskerville,
          italic: libreBaskervilleItalic,
          bold: libreBaskervilleBold,
        ),
        buildBackground: (context) => pw.FullPage(
          ignoreMargins: true,
          child: pw.Container(
            margin: const pw.EdgeInsets.all(10),
            decoration: pw.BoxDecoration(
              border: pw.Border.all(
                  color: const PdfColor.fromInt(0x0000ff), width: 1),
            ),
          ),
        ),
      ),
    ),
  );

  return pdf.save();
}
