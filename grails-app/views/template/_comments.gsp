<g:if test="${comments}">
    <div class="myfacebook">
        <div class="header">
            <em>Trang Tin Nhà Trọ</em>
        </div>
        <div class="body">
            <g:each in="${comments}" var="comment" status="i">
                <div class="comment ${i == 0 ? 'first' : ''}">
                    <div class="left">
                        %{--TODO: avatar user--}%
                        <tnt:genFBUser id="${comment.from.id}"/>
                        <a href="https://facebook.com/${comment.from.id}" src="https://scontent.fsgn2-2.fna.fbcdn.net/v/t1.0-1/p48x48/16265438_758891140928511_1970585712161424965_n.jpg?oh=45f449ebfeaa9d436e8e857005b60019&amp;oe=59AD5E4D" target="_blank" class="img _8o _8s UFIImageBlockImage"><img class="_1ci img" src="https://scontent.fsgn2-2.fna.fbcdn.net/v/t1.0-1/p48x48/16265438_758891140928511_1970585712161424965_n.jpg?oh=45f449ebfeaa9d436e8e857005b60019&amp;oe=59AD5E4D" alt=""></a>
                    </div>
                    <div class="right">
                        <div class="content">
                            <span>
                                <a href="https://facebook.com/${comment.from.id}" target="_blank">${comment.from.name}</a>
                            </span>
                            <div class="message">
                                <span>
                                    ${comment.message}
                                </span>
                            </div>
                            <div class="action">
                                <a href="https://facebook.com/${comment.id}" target="_blank">
                                    <em>Thích</em>
                                </a>
                                <span role="presentation" aria-hidden="true"> · </span>
                                <a href="https://facebook.com/${comment.id}" target="_blank">
                                    <em>Phản hồi</em>
                                </a>
                                <span>
                                    <em>${comment.createdTime}</em>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </g:each>
        </div>
    </div>
</g:if>