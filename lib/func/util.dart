import 'package:intl/intl.dart';

class Util {

  static String translit(String s) {
    if (s == 'Rotor Volgograd') return 'Ротор';
    if (s == 'Torpedo Moskva') return 'Торпедо Москва';
    if (s == 'Khimki') return 'Химки';
    if (s == 'Chertanovo Moscow') return 'Чертаново';
    if (s == 'FK Neftekhimik') return 'Нефтехимик';
    if (s == 'Shinnik Yaroslavl') return 'Шинник';
    if (s == 'Baltika') return 'Балтика';
    if (s == 'Ska-khabarovsk') return 'СКА Хабаровск';
    if (s == 'Chayka') return 'Чайка';
    if (s == 'TOM Tomsk') return 'Томь Томск';
    if (s == 'Nizhny Novgorod') return 'Нижний Новгород';
    if (s == 'Krasnodar 2') return 'Краснодар 2';
    if (s == 'FC Armavir') return 'Армавир';
    if (s == 'Avangard Kursk') return 'Авангард Курск';
    if (s == 'Luch-Energiya') return 'Луч Энергия';
    if (s == 'Spartak Moscow 2') return 'Спартак 2';
    if (s == 'Enisey') return 'Енисей';
    if (s == 'Mordovia Saransk') return 'Мордовия';
    if (s == 'Tekstilshchik') return 'Текстильщик';
    if (s == 'Fakel Voronezh') return 'Факел';
    if (s == 'Volgar Astrakhan') return 'Волгарь';
    if (s == 'Krylya Sovetov') return 'Крылья Советов';
    if (s == 'Alaniya II') return 'Алания';
    if (s == 'Dinamo Bryansk') return 'Динамо-Брянск';
    if (s == 'Irtysh Pavlodar') return 'Иртыш';
    else
      return s;
  }

  static String timeFromSeconds (int time) {
    if (time == null ) {
      return "Не назначенно";
    }
    DateTime date =  DateTime.fromMillisecondsSinceEpoch((time - 3*60*60) *1000);
    return DateFormat('dd.MM.yyyy HH:mm', 'Europe/Moscow').format(date);
  }
}
