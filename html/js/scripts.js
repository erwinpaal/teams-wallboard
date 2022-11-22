$(document).ready(function() {
    getStats();
    setInterval(getStats, 2000);
})

function getStats(){
    jQuery.get("files/stats.txt", function(stats) {
        var values = stats.split(/\n/);
        var agentsOptIn = values[0];
        var agentsInTotal = values[1];
        var waitingInQueue = values[2];

        $("#agentsOptIn").html(agentsOptIn);
        $("#agentsInTotal").html(agentsInTotal);
        $("#waitingInQueue").html(waitingInQueue);
    })
}

$(document).ready(function() {
    clockUpdate();
    setInterval(clockUpdate, 1000);
})

function clockUpdate() {
    var date = new Date();
    function addZero(x) {
        if (x < 10) {
            return x = '0' + x;
        } else {
            return x;
        }
    }

    var h = addZero(date.getHours());
    var m = addZero(date.getMinutes());
    var s = addZero(date.getSeconds());

    $("#clock").html(h + ":" + m + ":" + s);
}