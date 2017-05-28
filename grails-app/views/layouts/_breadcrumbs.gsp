<div class="page-breadcrumbs">
    <ul class="breadcrumb">
        <li>
            <i class="fa fa-home"></i>
            <a href="${createLink(controller: 'home', action: 'index')}">${session.currentname ?: 'Dashborad'}</a>
        </li>
        <g:if test="${title}">
            <li>
                <a href="${link ?: ''}">${title}</a>
            </li>
        </g:if>
        <li class="active">
            ${current}
        </li>
    </ul>
</div>
<div class="page-header position-relative">
    <div class="header-title">
        <h1>
            ${current}
        </h1>
    </div>
    <!--Header Buttons-->
    <div class="header-buttons">
        <a class="sidebar-toggler" href="#">
            <i class="fa fa-arrows-h"></i>
        </a>
        <a class="refresh" id="refresh-toggler" href="">
            <i class="glyphicon glyphicon-refresh"></i>
        </a>
        <a class="fullscreen" id="fullscreen-toggler" href="#">
            <i class="glyphicon glyphicon-fullscreen"></i>
        </a>
    </div>
    <!--Header Buttons End-->
</div>
