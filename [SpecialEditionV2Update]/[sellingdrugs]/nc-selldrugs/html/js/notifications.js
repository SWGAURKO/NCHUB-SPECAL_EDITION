function Notify(text, type, duration) {
    $.post('https://nc-selldrugs/notification', JSON.stringify({ text: text, type: type, duration: duration }));
}