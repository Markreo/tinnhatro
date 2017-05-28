
<!-- Chat Bar -->
<div id="chatbar" class="page-chatbar">
%{--    <div class="chatbar-contacts">
        <div class="contacts-search">
            <input type="text" class="searchinput" placeholder="Search Contacts" />
            <i class="searchicon fa fa-search"></i>
            <div class="searchhelper">Search Your Contacts and Chat History</div>
        </div>
        <ul class="contacts-list">
            <g:set var="user" value="${session.user as com.quanlinhatro.User}"/>
            <g:each in="${com.quanlinhatro.User.findAllByUsernameNotEqual(user?.username)}" var="contact">
                <li class="contact" data-contactid="${contact.id}" data-parseid="${user.parseId(contact.id)}">
                    <div class="contact-avatar">
                        <asset:image src="user_default.jpg"/>
                    </div>
                    <div class="contact-info">
                        <div class="contact-name">${contact.fullname}</div>
                        <div class="contact-status">
                            <div class="online"></div>
                            <div class="status">online</div>
                        </div>
                        <div class="last-chat-time">
                            last week
                        </div>
                    </div>
                </li>
            </g:each>
        </ul>
    </div>
    <div id="group_chatbar_messages">
    </div>--}%
</div>
<!-- /Chat Bar -->
<script>
    $(document).on('click', '.contact', function(e){
        e.preventDefault();
        e.stopPropagation();
        var contactid = $(this).data("contactid");
        var parseid = $(this).data("parseid");
        var chatbar_messages = $("#" + parseid);
        if(chatbar_messages.length) {
            console.log('open')
            $(".page-chatbar .chatbar-contacts").hide();
            $("#" + parseid).show();
        } else {
            console.log('post')
            $.post("${createLink(controller: 'chat', action: 'chatbarMessage')}", {contactid: contactid, parseid: parseid}, function (data) {
                $("#group_chatbar_messages").append(data.chatbarmessage);
                $(".page-chatbar .chatbar-contacts").hide();
                $("#" + parseid).show();
            });
        }
    })
</script>