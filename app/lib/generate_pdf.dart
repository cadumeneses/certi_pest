import 'dart:typed_data';
import 'package:app/cliente_model.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

Future<Uint8List> generateCertificate(
    PdfPageFormat pageFormat, ClienteModel cliente) async {
  final pdf = pw.Document();

  final libreBaskerville = await PdfGoogleFonts.libreBaskervilleRegular();
  final libreBaskervilleItalic = await PdfGoogleFonts.libreBaskervilleItalic();
  final libreBaskervilleBold = await PdfGoogleFonts.libreBaskervilleBold();
  final robotoLight = await PdfGoogleFonts.robotoLight();

  final text1 = pw.TextStyle(
    font: robotoLight,
    fontSize: 12,
    letterSpacing: 2,
    wordSpacing: 2,
  );

  final text2 = pw.TextStyle(
    fontWeight: pw.FontWeight.bold,
    fontSize: 12,
  );

  const text3 = pw.TextStyle(
    fontSize: 6,
  );

  pdf.addPage(
    pw.Page(
      build: (context) => pw.Column(
        children: [
          pw.Spacer(),
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
              fontWeight: pw.FontWeight.bold,
              fontSize: 18,
            ),
          ),
          pw.SizedBox(height: 10),
          pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text(
                  'Rua Guilhardo Gomes de Araújo, 300, Cocobó, Iguatu - CE'),
              pw.Text('CNPJ: 27.575.700/000160  Tel. (88)9 9988-0918'),
              pw.Text('Email: theo.igor.menezes@hotmail.com'),
              pw.Text(
                  'Insc. Estadual N°: 06.647.032-3  Álvara Sanitário N°: 166/2021'),
            ],
          ),
          pw.Spacer(),
          pw.Wrap(
            crossAxisAlignment: pw.WrapCrossAlignment.start,
            alignment: pw.WrapAlignment.start,
            children: [
              pw.RichText(
                text: pw.TextSpan(
                  text: 'Certificamos que a empresa ',
                  style: text1,
                  children: [
                    pw.TextSpan(
                      text: '${cliente.nome!},',
                      style: text2,
                    ),
                  ],
                ),
              ),
              pw.RichText(
                text: pw.TextSpan(
                  text: 'com o número de CNPJ, ',
                  style: text1,
                  children: [
                    pw.TextSpan(
                      text: cliente.cnpj!,
                      style: text2,
                    ),
                  ],
                ),
              ),
              pw.RichText(
                text: pw.TextSpan(
                  text: 'estabelecida em ',
                  style: text1,
                  children: [
                    pw.TextSpan(
                      text: '${cliente.rua!},',
                      style: text2,
                    ),
                    pw.TextSpan(
                      text: ' ${cliente.numero!},',
                      style: text2,
                    ),
                    pw.TextSpan(
                      text: ' ${cliente.bairro!},',
                      style: text2,
                    ),
                    pw.TextSpan(
                      text: ' ${cliente.cidade!},',
                      style: text2,
                    ),
                    pw.TextSpan(
                      text: ' ${cliente.estado!},',
                      style: text2,
                    ),
                  ],
                ),
              ),
              pw.RichText(
                text: pw.TextSpan(
                  text: 'foi dedetizada no dia ',
                  style: text1,
                  children: [
                    pw.TextSpan(
                      text: '20/06/2023,',
                      style: text2,
                    ),
                  ],
                ),
              ),
              pw.RichText(
                text: pw.TextSpan(
                  text: 'com Validade de ',
                  style: text1,
                  children: [
                    pw.TextSpan(
                      text: '90 dias,',
                      style: text2,
                    ),
                  ],
                ),
              ),
              pw.RichText(
                text: pw.TextSpan(
                  text: 'contra as seguintes pragas: ',
                  style: text1,
                  children: [
                    pw.TextSpan(
                      text: 'barata, cupim, formiga e rato.',
                      style: text2,
                    ),
                  ],
                ),
              ),
            ],
          ),
          pw.Spacer(),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
            children: [
              pw.Column(
                children: [
                  pw.Container(height: 2, width: 250, color: PdfColors.black),
                  pw.Text('Responsável Técnico:'.toUpperCase()),
                  pw.Text('Theo Igor Menezes do Amaral'.toUpperCase()),
                  pw.Text('CPF: 630.403.363-04'),
                ],
              ),
              pw.Column(
                children: [
                  pw.Text('Engenheiro Agronômo:'.toUpperCase()),
                  pw.Text('EUGELIO LOPES BEZZERA'),
                  pw.Text('RP: 0607421274'),
                ],
              ),
            ],
          ),
          pw.Spacer(),
          pw.Row(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Container(
                width: 250,
                child: pw.Column(
                  children: [
                    pw.Text(
                      'Produtos utilizados:\n-Cyperess 250 ce, grupo quimíco: piretroide, principais ativos: Cipermetrina e Classel, aplicação: 50ml p/5L de água 100m², tratamento: Anti-histaminico\n-DDPV 1000, grupo químico: Organofosforado, principais ativos: Diciorvós classe II, aplicação: 50ml p/5L de água 100m², tratamento: Antronipa e oximas\n-Ratolbiocbrodif, grupo químico: hidroxicumarina, principais ativos: brodifacoum, aplicação: 1 sache, tratamento: vitamnina k1.',
                      style: text3,
                    ),
                  ],
                ),
              ),
              pw.Container(
                width: 250,
                child: pw.Column(
                  children: [
                    pw.Text(
                      'Orientações pertinentes à dedetização de ambiente:\n- O ambiente deve permanecer ventilado por um período mínimo de 60 minutos.\n- Produto de limpeza após 72 horas. Após 4 horas, é permitido passar um pano úmido.\n- Pessoas alérgicas, crianças, idosos, gestantes, animais domésticos e plantas sensíveis devem permanecer fora do ambiente por um período mínimo de 24 horas. As demais pessoas por um período mínimo de 4 horas.',
                      style: text3,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      pageTheme: pw.PageTheme(
        pageFormat: pageFormat,
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
