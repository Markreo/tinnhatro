<div class="infobox">
    <div class="left">
        <a href="${createLink(controller: 'post', action: 'detail', id: post.id)}" data-expand-width="col-9" data-transition-parent=".content-loader" data-external="true">
            <div class="image">
                <div class="price average-color">
                    <span><g:formatNumber number="${post.gia}" format="###,###,###"/> đ </span>
                </div>
                <img src="${createLink(controller: 'media', action: 'getImage', id: post.image?.first()?.id)}" alt="${post.tieude}">
            </div>
        </a>
    </div>
</div>