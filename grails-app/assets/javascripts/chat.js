/*
    $(function() {
        var socket = new SockJS("/stomp");
        var client = Stomp.over(socket);

        client.connect({}, function() {
            client.subscribe("/user/queue/chat", function(data) {
                var mapData = $.parseJSON(data.body);

                if(mapData.type == 'replay') {
                    var now = new Date();
                    var time = now.getHours() + ":" + now.getMinutes() + " "
                    var tempalte  = "<li class='message'><div class='message-info'><div class='bullet'></div><div class='contact-name'>" + mapData.fullname + "</div><div class='message-time'>" + time + ", Today</div></div><div class='message-body'>" + mapData.message + "</div></li>"
                    var chatlist = $("#" + mapData.parseid).find(".messages-list");
                    if(chatlist.length) {
                        chatlist.append(tempalte);
                    } else {
                        console.log('notify')
                    }

                }
            });
        });


        $(document).on("keydown", ".send-message textarea", function (event) {
            if (event.keyCode == 13) {
                console.log("sadasd")
                var message = $(this).val();
                var parseid = $(this).data('parseid');
                var to = $(this).data("to");
                var from = $(this).data('from');
                $(this).html('');
                $(this).val('');
                if (message) {
                    client.send("/app/chat", {}, JSON.stringify({
                        "to": to,
                        "from": from,
                        "message": message
                    }));
                    $.post("/chat/send", {message: message}, function(data) {
                        $("#" + parseid).find(".messages-list").append(data.message)
                    })

                }
                return false;
            }
        });
    });
*/
