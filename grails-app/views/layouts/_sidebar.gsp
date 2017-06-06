<div class="page-sidebar " id="sidebar">
    %{--<!-- Page Sidebar Header-->
    <div class="sidebar-header-wrapper">
        <input type="text" class="searchinput" />
        <i class="searchicon fa fa-search"></i>
        <div class="searchhelper">Search Reports, Charts, Emails or Notifications</div>
    </div>
    <!-- /Page Sidebar Header -->--}%
    <!-- Sidebar Menu -->
    <ul class="nav sidebar-menu">
        <li>
            <a href="${createLink(uri: "/")}">
                <i class="menu-icon glyphicon glyphicon-globe"></i>
                <span class="menu-text">Website</span>
            </a>
        </li>
        <!--Dashboard-->
        <li class="${controllerName == 'admin' && actionName == 'index' ? 'active' : ''}">
            <a href="${createLink(controller: 'admin')}">
                <i class="menu-icon glyphicon glyphicon-home"></i>
                <span class="menu-text">Dashboard</span>
            </a>
        </li>

        <sec:ifAllGranted roles="ROLE_SYSADMIN">
            <li class="${controllerName == 'room' ? 'active' : ''}">
                <a href="${createLink(controller: 'room', action: 'index')}">
                    <i class="menu-icon fa fa-user-circle-o"></i>
                    <span class="menu-text">Admin Users</span>
                </a>
            </li>
        </sec:ifAllGranted>
        <li class="${controllerName == 'admin' && actionName == 'users' ? 'active' : ''}">
            <a href="${createLink(controller: 'admin', action: 'user')}">
                <i class="menu-icon fa fa-user"></i>
                <span class="menu-text">Users</span>
            </a>
        </li>



        <li class="${controllerName == 'admin' && actionName == 'post' ? 'active' : ''}">
            <a href="${createLink(controller: 'admin', action: 'post')}">
                <i class="menu-icon fa fa-edit"></i>
                <span class="menu-text">Posts</span>
            </a>
        </li>

        <li class="${controllerName == 'region' ? 'active' : ''}">
            <a href="${createLink(controller: 'region', action: 'list')}">
                <i class="menu-icon fa fa-image"></i>
                <span class="menu-text">Image</span>
            </a>
        </li>
    </ul>
    <!-- /Sidebar Menu -->
</div>
