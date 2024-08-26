const screen = document.getElementById('screen');
const header = document.getElementById('header');

addEventListener("message", function(e) {
    var data = e.data;
    if(data.action == "start") {
        header.innerHTML = data.header;
        screen.style.visibility = "visible";
        screen.style.left = `0%`;
    } else if(data.action == "close") {
        screen.style.left = `-15%`;
        setTimeout(() => {
            screen.style.visibility = "hidden";
        }, 1);
    }
})