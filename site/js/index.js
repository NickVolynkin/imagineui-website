var lang = (navigator.language || navigator.systemLanguage || navigator.userLanguage).substr(0, 2).toLowerCase();
if (lang === 'ru') {
    location.href="ru/";
} else {
    location.href="en/";
}
