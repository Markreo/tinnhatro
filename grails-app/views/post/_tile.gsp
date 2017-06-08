<a href="${createLink(controller: 'post', action: 'detail', id: post.id)}" data-expand-width="col-9" data-transition-parent=".content-loader" data-external="true">
    <div class="inner">
        <div class="image">
            <div class="price average-color"><span><g:formatNumber number="${post.gia}" format="###,###,###"/> đ</span></div>
            <g:if test="${post.image}">
                <tnt:image filename="${post.image.first().path}"/>
                %{--<img src="${createLink(controller: 'media', action: 'getImage', id: post.image.first()?.id)}"/>--}%
            </g:if>
            <g:else>
                <asset:image src="default-item.png"/>
            </g:else>
        </div>
        <div class="item-content">
            <header class="average-color">
                <h2>${post.tieude} - <span style="opacity: 0.6;font-size: 12px;font-weight: normal;margin: 0;">${post.loai.name}</span></h2>
                <h3 style="font-size: 13px">${post.diachi}</h3>
            </header>
            <footer style="padding: 10px">
                <p style="white-space: pre-line">
                    ${post.dieukhoan?.subSequence(0, post.dieukhoan?.length() < 255 ? post.dieukhoan?.length() : 255)}...
                </p>
            </footer>
        </div>
    </div>
</a>