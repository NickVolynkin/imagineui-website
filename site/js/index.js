var lang = (navigator.language || navigator.systemLanguage || navigator.userLanguage).substr(0, 2).toLowerCase();
if (lang === 'ru') {
    location.href = "ru/";
} else if (lang === 'es') {
    location.href = "es/";
} else {
    location.href = "en/";
}
