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
        <!--Dashboard-->
            <li class="${controllerName == 'home' ? 'active' : ''}">
                <a href="${createLink(controller: 'home')}">
                    <i class="menu-icon glyphicon glyphicon-home"></i>
                    <span class="menu-text">${session.currentname ?: 'Dashboard'}</span>
                </a>
            </li>

        <li class="${controllerName == 'room' ? 'active' : ''}">
            <a href="${createLink(controller: 'room', action: 'index')}">
                <i class="menu-icon fa fa-th-large"></i>
                <span class="menu-text">Phòng cho thuê</span>
            </a>
        </li>

        <li class="${controllerName == 'renter' ? 'active' : ''}">
            <a href="${createLink(controller: 'renter', action: 'index')}">
                <i class="menu-icon fa fa-user"></i>
                <span class="menu-text">Khách thuê</span>
            </a>
        </li>

        <li class="${controllerName == 'region' ? 'active' : ''}">
            <a href="${createLink(controller: 'region', action: 'list')}">
                <i class="menu-icon fa fa-bar-chart"></i>
                <span class="menu-text">Khu - Dãy trọ</span>
            </a>
        </li>

        <li class="${controllerName == 'camera' ? 'active' : ''}">
            <a href="${createLink(controller: 'region', action: 'index')}" rel='new-tab'>
                <i class="menu-icon fa fa-video-camera"></i>
                <span class="menu-text"> Camera </span>
            </a>
        </li>

        <li class="${controllerName == 'message' ? 'active' : ''}">
            <a href="${createLink(controller: 'region', action: 'index')}" rel='new-tab'>
                <i class="menu-icon fa fa-envelope-o"></i>
                <span class="menu-text"> Tin nhắn </span>
            </a>
        </li>

        <li class="${controllerName in ['roomType', 'user', 'permission'] ? 'open' : ''}">
            <a href="javascript:void(0);" class="menu-dropdown">
                <i class="menu-icon fa fa-cog"></i>
                <span class="menu-text">Cài đặt</span>
                <i class="menu-expand"></i>
            </a>
            <ul class="submenu">
                <li class="${actionName in ['roomType'] ? 'active' : ''}">
                    <a href="${createLink(controller: 'roomType', action: 'index')}">
                        <i class="fa fa-sitemap"></i>
                        Loại phòng
                    </a>
                </li>
                <li class="${actionName in ['index'] ? 'active' : ''}">
                    <a href="${createLink(controller: 'user', action: 'index')}">
                        <i class="fa fa-credit-card"></i>
                        Tài khoản
                    </a>
                </li>

                    <li class="${controllerName in ['user'] ? 'active' : ''}">
                        <a href="${createLink(controller: 'user', action: 'list')}">
                            <i class="fa fa-users"></i>
                            Nhân viên
                        </a>
                    </li>



                    <li class="${controllerName in ['permission'] ? 'active' : ''}">
                        <a href="${createLink(controller: 'permission', action: 'list')}">
                            <i class="fa fa-users"></i>
                            Phan quyen
                        </a>
                    </li>

            </ul>
        </li>
    </ul>
    <!-- /Sidebar Menu -->
</div>
