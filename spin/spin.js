var users = [];
var schools = {}
var current = 0;

schools['Gryffondor'] = 0;
schools['Serpentard'] = 0;
schools['Serdaigle'] = 0;
schools['Poufsouffle'] = 0;

var wavGryf = new Audio('wav/gryffindor.wav');
var wavSerp = new Audio('wav/slytherin.wav');
var wavSerd = new Audio('wav/ravenclaw.wav');
var wavPouf = new Audio('wav/hufflepuff.wav');

function getUsers() {
    function callBackFunction(data, result) {
        $.each(data.list, function (k, v) {
            result[result.length] = v;
        })
    }

    var json = $.ajax({
        type: "GET",
        url: 'http://',
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

$(document).ready(function spin() {
    $('#clicker').click(function() {
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
                alert('C\'est fini les conneries');
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
                                $("#schools").attr("src", $("#link").attr("images/Serpentard.png"));
                            }).fadeTo(500,1);
                        else
                            document.getElementById("schools").src = "images/Serpentard.png";
                        ++j;
                    }
                    else if (now % 360 > 90  && now % 360 < 180 && i != 1) {
                        i = 1;
                        if (j == 0)
                            $("#schools").fadeTo(500,0.30, function() {
                                $("#schools").attr("src", $("#link").attr("images/Serdaigle.png"));
                            }).fadeTo(500,1);
                        else
                            document.getElementById("schools").src = "images/Serdaigle.png";
                        ++j;
                    }
                    else if (now % 360 > 180 && now % 360 < 270 && i != 2) {
                        i = 2;
                        if (j == 0)
                            $("#schools").fadeTo(500,0.30, function() {
                                $("#schools").attr("src", $("#link").attr("images/Poufsouffle.png"));
                            }).fadeTo(500,1);
                        else
                            document.getElementById("schools").src = "images/Poufsouffle.png";
                        ++j;
                    }
                    else if (now % 360 > 270 && now % 360 < 360 && i != 3) {
                        i = 3;
                        if (j == 0)
                            $("#schools").fadeTo(500,0.30, function() {
                                $("#schools").attr("src", $("#link").attr("images/Gryffondor.png"));
                            }).fadeTo(500,1);
                        else
                            document.getElementById("schools").src = "images/Gryffondor.png";
                        ++j;
                    }
                    return now;
                }
            });
        setTimeout(function() {
            if (rand == 1305) {
                schools['Poufsouffle'] += 1;
                wavPouf.play();
            }
            else if (rand == 1485) {
                schools['Serpentard'] += 1;
                wavSerp.play();
            }
            else if (rand == 1215) {
                schools['Serdaigle'] += 1;
                wavSerd.play();
            }
            else {
                schools['Gryffondor'] += 1;
                wavGryf.play();
            }
            document.getElementById("schools").src = "images/Schools.png";
            $("#schools").fadeTo(500,0.30, function() {
                $("#schools").attr("src", $("#link").attr("images/Schools.png"));
            }).fadeTo(500,1);
            console.log('Gryffondor', schools['Gryffondor']);
            console.log('Serpentard', schools['Serpentard']);
            console.log('Serdaigle', schools['Serdaigle']);
            console.log('Poufsouffle', schools['Poufsouffle']);
            current = 0;
        }, 7000);
    });
});