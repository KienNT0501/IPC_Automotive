#include "translator.h"


QString us_qm_path = ":/App/Media/translator/ts/translate_us.qm";
QString vn_qm_path = ":/App/Media/translator/ts/translate_vn.qm";


Translator::Translator(QObject *parent) : QObject(parent){

        m_translator.load(us_qm_path);
        m_app->installTranslator(&m_translator);

}
void Translator::setLanguage(int val){
    if(val == 0){
        m_translator.load(us_qm_path);
    }
    if(val == 1){
        m_translator.load(vn_qm_path);
    }
    m_app->installTranslator(&m_translator);
    emit languageChanged();
}
