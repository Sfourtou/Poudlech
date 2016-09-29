var users = [];
var schools = {}
var current = 0;
var len = -1;
var idx = 0;

schools['Gryffondor'] = 0;
schools['Serpentard'] = 0;
schools['Serdaigle'] = 0;
schools['Poufsouffle'] = 0;

var wavGryf = new Audio('/bundles/platform/wav/gryffindor.wav');
var wavSerp = new Audio('/bundles/platform/wav/slytherin.wav');
var wavSerd = new Audio('/bundles/platform/wav/ravenclaw.wav');
var wavPouf = new Audio('/bundles/platform/wav/hufflepuff.wav');

function getUsers() {
    function callBackFunction(data, result) {
        $.each(data, function (k, v) {
            result[result.length] = v;
        })
    }

    var json = $.ajax({
        type: "GET",
        url: 'http://localhost:8000/nameList',
        async: false,
        global: false,
        dataType: 'json',
        crossDomain: true,
        success: function (json) {
            return json;
        }
    }).responseJSON;
    users = [];
    callBackFunction(json, users);
}

getUsers();
while (users[++len])
    users[len].school = "nothing";

function checkExist() {
    var i = -1;
    var nb = 0;
    while (users[++i])
        if (users[i].name != "Fourtou" && users[i].name != "Ben" && users[i].name != "marchal" && users[i].name != "mortier" && users[i].name != "test" && users[i].school == "nothing")
            ++nb;
    return (nb);
}

function end() {
    $("#table").fadeTo(200,0, function() {
        $("#table").html("Thanks you !");
    }).fadeTo(200,1);
    current = 2;
}

function place() {
    console.log("Restant : ", checkExist());
    if (checkExist() == 0) {
        end();
        return ;
    }
    if (idx != 0)
        p = idx;
    else
        var p = 0;

    while (users[p]) {
        if (users[p].name != "Fourtou" && users[p].name != "Ben" && users[p].name != "marchal" && users[p].name != "mortier" && users[p].name != "test" && users[p].school == "nothing") {
            $("#table").fadeTo(200,0, function() {
                $("#table").html(users[p].firstName + " " + users[p].name);
            }).fadeTo(200,1);
            idx = p;
            return ;
        }
        else
            ++p;
    }
}
place();

function right() {
    var p = idx + 1;
    if (current > 0)
        return ;
    if (p >= Object.keys(users).length - 1)
        p = 0;
    while (users[p]) {
        if (users[p].name == "Fourtou" || users[p].name == "Ben" || users[p].name == "marchal" || users[p].name == "mortier" || users[p].name == "test" || users[p].school != "nothing")
            ++p;
        else {
            $("#table").fadeTo(200,0, function() {
                $("#table").html(users[p].firstName + " " + users[p].name);
            }).fadeTo(200,1);
            idx = p;
            return ;
        }
    }
}

function left() {
    var p = idx -1;

    if (current > 0)
        return ;
    while (users[p]) {
        if (users[p].name == "Fourtou" || users[p].name == "Ben" || users[p].name == "marchal" || users[p].name == "mortier" || users[p].name == "test" || users[p].school != "nothing")
            --p;
        else {
            $("#table").fadeTo(200,0, function() {
                $("#table").html(users[p].firstName + " " + users[p].name);
            }).fadeTo(200,1);
            idx = p;
            return ;
        }
        if (p == 0)
            p = Object.keys(users).length -1;
    }
}

$(document).ready(function spin() {
    $('#schools').click(function() {
        ++current;
        if (current > 1)
            return ;
        var test = Math.floor((Math.random() * 4) + 1) * 90;
        var rand = 45 + test;
        var i = -1;
        var j = 0;
        rand += 1080;
        while ((rand == 1215 && schools['Serdaigle'] == 26) ||
        (rand == 1305 && schools['Poufsouffle'] == 26) ||
        (rand == 1395 && schools['Gryffondor'] == 26) ||
        (rand == 1485 && schools['Serpentard'] == 26))
        {
            test = Math.floor((Math.random() * 4) + 1) * 90;
            rand = 45 + test;
            rand += 1080;
            if (schools['Serdaigle'] == 26 && schools['Poufsouffle'] == 26 && schools['Gryffondor'] == 26 && schools['Serpentard'] == 26) {
                end();
                return ;
            }
        }
        $('#rotating').rotate(
            {
                duration: 10000,
                angle: 0,
                animateTo: rand,
                step: function(now) {
                    if (now % 360 > 0 && now % 360 < 90 && i != 0) {
                        i = 0;
                        if (j == 0)
                            $("#schools").fadeTo(500,0.30, function() {
                                $("#schools").attr("src", $("#link").attr("/bundles/platform/images/Serpentard.png"));
                            }).fadeTo(500,1);
                        else
                            document.getElementById("schools").src = "/bundles/platform/images/Serpentard.png";
                        ++j;
                    }
                    else if (now % 360 > 90  && now % 360 < 180 && i != 1) {
                        i = 1;
                        if (j == 0)
                            $("#schools").fadeTo(500,0.30, function() {
                                $("#schools").attr("src", $("#link").attr("/bundles/platform/images/Serdaigle.png"));
                            }).fadeTo(500,1);
                        else
                            document.getElementById("schools").src = "/bundles/platform/images/Serdaigle.png";
                        ++j;
                    }
                    else if (now % 360 > 180 && now % 360 < 270 && i != 2) {
                        i = 2;
                        if (j == 0)
                            $("#schools").fadeTo(500,0.30, function() {
                                $("#schools").attr("src", $("#link").attr("/bundles/platform/images/Poufsouffle.png"));
                            }).fadeTo(500,1);
                        else
                            document.getElementById("schools").src = "/bundles/platform/images/Poufsouffle.png";
                        ++j;
                    }
                    else if (now % 360 > 270 && now % 360 < 360 && i != 3) {
                        i = 3;
                        if (j == 0)
                            $("#schools").fadeTo(500,0.30, function() {
                                $("#schools").attr("src", $("#link").attr("/bundles/platform/images/Gryffondor.png"));
                            }).fadeTo(500,1);
                        else
                            document.getElementById("schools").src = "/bundles/platform/images/Gryffondor.png";
                        ++j;
                    }
                    return now;
                }
            });
        setTimeout(function() {
            if (rand == 1305) {
                schools['Poufsouffle'] += 1;
                users[idx].school = "Poufsouffle";
                wavPouf.play();
            }
            else if (rand == 1485) {
                schools['Serpentard'] += 1;
                users[idx].school = "Serpentard";
                wavSerp.play();
            }
            else if (rand == 1215) {
                schools['Serdaigle'] += 1;
                users[idx].school = "Serdaigle";
                wavSerd.play();
            }
            else {
                schools['Gryffondor'] += 1;
                users[idx].school = "Gryffondor";
                wavGryf.play();
            }
            document.getElementById("schools").src = "/bundles/platform/images/Schools.png";
            $("#schools").fadeTo(500,0.30, function() {
                $("#schools").attr("src", $("#link").attr("/bundles/platform/images/Schools.png"));
            }).fadeTo(500,1);
            console.log('Gryffondor', schools['Gryffondor']);
            console.log('Serpentard', schools['Serpentard']);
            console.log('Serdaigle', schools['Serdaigle']);
            console.log('Poufsouffle', schools['Poufsouffle']);
            current = 0;
            console.log(users[idx]);
            console.log(users);
            delete users[idx].firstName;
            var json = JSON.stringify(users[idx]);
            console.log(json);
            $.ajax({
                type: "POST",
                url: 'http://localhost:8000/updatedList/' + users[idx].name + "/" + users[idx].school,
                async: false,
                global: false,
                dataType: 'json',
                crossDomain: true,
                data: json
            })
            place();
        }, 7000);
    });
});