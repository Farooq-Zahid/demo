enum Country {
  unitedarabemirates,
argentina,
austria,
australia,
belgium,
bulgaria,
brazil,
canada,
switzerland,
china,
colombia,
cuba,
czechrepublic,
germany,
egypt,
france,
unitedkingdom,
greece,
hongkong,
honduras,
hungary,
indonesia,
ireland,
israel,
india,
italy,
japan,
southkorea,
lithuania,
latvia,
morocco,
mexico,
malaysia,
nigeria,
netherlands,
norway,
newzealand,
philippines,
poland,
portugal,
romania,
serbia,
russia,
saudiarabia,
sweden,
singapore,
slovakia,
thailand,
turkey,
taiwan,
ukraine,
unitedstates,
venezuela,
southafrica;
  String get code{
    switch (this) {
    case Country.unitedarabemirates:
        return 'ud';
    case Country.argentina:
        return 'ar';
    case Country.austria:
        return 'at';
    case Country.australia:
        return 'au';
    case Country.belgium:
        return 'be';
    case Country.bulgaria:
        return 'bg';
    case Country.brazil:
        return 'br';
    case Country.canada:
        return 'ca';
    case Country.switzerland:
        return 'ch';
    case Country.china:
        return 'cn';
    case Country.colombia:
        return 'co';
    case Country.cuba:
        return 'cu';
    case Country.czechrepublic:
        return 'cz';
    case Country.germany:
        return 'de';
    case Country.egypt:
        return 'eg';
    case Country.france:
        return 'fr';
    case Country.unitedkingdom:
        return 'gb';
    case Country.greece:
        return 'gr';
    case Country.hongkong:
        return 'hk';
    case Country.honduras:
        return 'hn';
    case Country.hungary:
        return 'hu';
    case Country.indonesia:
        return 'id';
    case Country.ireland:
        return 'ie';
    case Country.israel:
        return 'il';
    case Country.india:
        return 'in';
    case Country.italy:
        return 'it';
    case Country.japan:
        return 'jp';
    case Country.southkorea:
        return 'kr';
    case Country.lithuania:
        return 'lt';
    case Country.latvia:
        return 'lv';
    case Country.morocco:
        return 'ma';
    case Country.mexico:
        return 'mx';
    case Country.malaysia:
        return 'my';
    case Country.nigeria:
        return 'ng';
    case Country.netherlands:
        return 'nl';
    case Country.norway:
        return 'nn';
    case Country.newzealand:
        return 'nz';
    case Country.philippines:
        return 'ph';
    case Country.poland:
        return 'pl';
    case Country.portugal:
        return 'pt';
    case Country.romania:
        return 'ro';
    case Country.serbia:
        return 'rs';
    case Country.russia:
        return 'ru';
    case Country.saudiarabia:
        return 'sa';
    case Country.sweden:
        return 'se';
    case Country.singapore:
        return 'sg';
    case Country.slovakia:
        return 'sk';
    case Country.thailand:
        return 'th';
    case Country.turkey:
        return 'tr';
    case Country.taiwan:
        return 'tw';
    case Country.ukraine:
        return 'ua';
    case Country.unitedstates:
        return 'us';
    case Country.venezuela:
        return 've';
    case Country.southafrica:
        return 'za';
    default:
        return 'unknown';
}
  }
}
