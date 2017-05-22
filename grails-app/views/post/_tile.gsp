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
                <h2>${post.diachi}</h2>
                <h3>${post.loai.name}</h3>
            </header>
            <footer>
                <dl>
                    <dt>Bathrooms</dt>
                    <dd>1</dd>
                    <dt>Bedrooms</dt>
                    <dd>2</dd>
                    <dt>Area</dt>
                    <dd>165m<sup>2</sup></dd>
                    <dt>Garages</dt>
                    <dd>1</dd>
                </dl>
            </footer>
        </div>
    </div>
</a>