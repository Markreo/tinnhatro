<div id="submit-page">
    <div class="inner">
        <h1 id="temp">Đăng tin</h1>
        <g:formRemote name="create_post" url="[controller: 'post', action: 'saveCreate']" update="update_createPost" role="form" method="post">
            <div id="update_createPost"></div>
            <article class="animate move_from_bottom_short">
                <div class="row">
                    <div class="col-md-8">
                        <div class="form-group form-group-lg">
                            <input type="text" class="form-control" id="title" name="tieude" placeholder="Tiêu đề" required>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group form-group-lg">
                            <div class="input-group">
                                <input type="text" class="form-control" id="price" name="gia" placeholder="Giá" required>
                                <span class="input-group-addon">đ</span>
                            </div><!-- /input-group -->
                        </div>
                    </div>
                </div>
                <!--end .row-->
                <div class="form-group">
                    <textarea name="mota" class="form-control" rows="6" id="description" placeholder="Mô tả"></textarea>
                </div>
                <div class="form-group">
                    <textarea name="mota" class="form-control" rows="6" id="dieukhoan" placeholder="Giá và các điều khoản"></textarea>
                </div>
                <!--end textarea-->
            </article>
            <!--end Description-->
            <article class="animate move_from_bottom_short">
                <h3>Địa chỉ</h3>
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group form-group-lg">
                            <input type="text" class="form-control" id="diachi" name="diachi" placeholder="Dia chi" required>
                        </div>
                        <div class="row">
                            <div class="col-md-3 col-sm-3 col-xs-3">
                                <div class="form-group form-group-lg">
                                    <input type="text" class="form-control" name="sonha" placeholder="So nha">
                                </div>
                            </div>
                            <div class="col-md-9 col-sm-9 col-xs-9">
                                <div class="form-group form-group-lg">
                                    <input type="text" class="form-control" name="tenduong" placeholder="Ten duong">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="form-group form-group-lg">
                                    <input type="text" class="form-control" name="phuong" placeholder="Phuong">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 col-sm-6 col-xs-6">
                                <div class="form-group form-group-lg">
                                    <input type="text" class="form-control" id="quanhuyen" name="quanhuyen" placeholder="Quan/huyen" required>
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-6 col-xs-6">
                                <div class="form-group form-group-lg">
                                    <input type="text" class="form-control" id="tinhthanh" name="tinhthanh" placeholder="Tinh thanh" required>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <i style="color: #BBBBBB; font-size: 12px">Hãy xác định lại vị trí chính xác hơn!</i>
                        <div id="map-simple"></div>
                    </div>
                </div>
            </article>
            <!--end Address-->
            <article class="animate move_from_bottom_short">
                <h3>Tong quan</h3>
                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <g:select name="loai" from="${com.tinnhatro.Post.Loai.values()}" optionValue="name"/>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="input-group drop-down">
                            <input type="text" class="form-control" name="dientich" placeholder="Dien tich">
                            <div class="input-group-btn">
                                <select id="measure">
                                    <option value="1">m<sup>2</sup></option>
                                </select>
                            </div><!-- /btn-group -->
                        </div><!-- /input-group -->
                    </div>
                    <!--end .col-md-4-->
                    <div class="col-md-4">
                        <div class="form-group">
                            <input type="text" class="form-control" id="build-year" name="namxay" placeholder="Nam xay dung">
                        </div>
                    </div>
                    <!--end .col-md-4-->
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <select name="doituong">
                                <option disabled selected>Doi tuong cho thue</option>
                                <option value="Nam">Nam</option>
                                <option value="Nu">Nu</option>
                                <option value="Tat ca">Tat ca</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <br>
                </div>

                <!--end .row-->
            </article>
            <!--end Overview-->
            <article>
                <h3>Hinh anh</h3>
                <input id="file-1" type="file" multiple class="file" data-overwrite-initial="false" data-min-file-count="2" accept=".jpeg,.jpg,.png">
            </article>
            <!--end Gallery-->
            <article>
                <h3>Tien ich</h3>
                <ul class="list-unstyled checkboxes">
                    <g:each in="${com.tinnhatro.Utilities.values()}" var="tienich">
                        <li><div class="checkbox"><label><input type="checkbox" name="tienich" value="${tienich.name}">${tienich.name}</label></div></li>
                    </g:each>
                </ul>
            </article>
            <!--end Features-->
            <article class="center">
                <div class="form-group">
                    <button id="submit_createpost" type="submit" class="btn btn-circle btn-primary btn-xl"><i class="fa fa-check"></i></button>
                </div>
                <!--end .form-group-->
            </article>
            <!--end Submit Button-->
            <article class="center">
                <small>By clicking “submit” button you agree with <a href="" class="link">Terms and Conditions</a></small>
            </article>
            <!--end terms-->
        </g:formRemote>
    </div>
    <!--end .row-->
</div>
<!--end #item-detail-->

<script>
    $(document).ready(function($) {
        var _latitude = 10.791628;
        var _longitude = 106.732535;
        var draggableMarker = true;
        var scrollwheel = true;

        rating();

        averageColor( $('#item-detail') );

        bootstrapSelect();

        $('input').iCheck();

        $('.submit-button').addClass('submit-page-open');

        setTimeout(function() {
            simpleMap(_latitude, _longitude,draggableMarker,scrollwheel);
        }, 200);

//        $(window).keydown(function(event){
//            if(event.keyCode == 13) {
//                console.log(event.targetEl)
//                event.stopPropagation();
//                return false;
//            }
//        });

        $("#file-1").fileinput({
            uploadUrl: '#', // you must set a valid URL here else you will get an error
            allowedFileTypes: ['image'],
            allowedFileExtensions: ['jpg', 'png', 'gif'],
            overwriteInitial: false,
            maxFileSize: 1000,
            maxFilesNum: 10,
            showUpload: false,
            showRemove: false,
            showUploadedThumbs: false,
            showCaption: false,
            maxFileSize: 1024,
            maxFileCount: 3,
            //allowedFileTypes: ['image', 'video', 'flash'],
            slugCallback: function (filename) {
                return filename.replace('(', '_').replace(']', '_');
            }
        });


    });
</script>
