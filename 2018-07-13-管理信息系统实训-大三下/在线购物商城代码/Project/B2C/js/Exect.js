//弹出页面方法集合 htmlSrc 为html页面路径 向父窗体
function Eject(htmlSrc, title, width, height) {
    //获取浏览器高度
    var winHeight = $(window.parent).height();
    //获取浏览器宽度
    var winWidth = $(window.parent).width();
    //计算上部分高度
    var top = ((winHeight - height) / 2) + $(document).scrollTop();
    //计算左部分宽度
    var left = (winWidth - width) / 2;
    //添加遮盖层
    var CoverHtml = '<div id="coverDiv" style="background-color:rgba(0,0,0,.9); width:' + (window.parent.document.body.scrollWidth + 10) + 'px; height:' + (window.parent.document.body.scrollHeight + 10) + 'px; position:absolute; top:0px; left:0px; z-index:200;"></div>';
    //添加内容
    var ContentHtml = '<div id="tdiv" class="tdiv" style="position:absolute; top:-' + (height + top) + 'px; left:' + left + 'px; background-color:white; border:solid 1PX #C4C4C4; box-shadow:1px 1px 10px; border-radius:10px; onverflow:hidden; text-overflow:clip; overflow:hidden; width:' + width + 'px; height:' + height + 'px; z-index:200;">';
    ContentHtml += '<div style="width:100%; height:0px; border-radius:2PX 2PX 0PX 0PX; position:relative;  ">';
    ContentHtml += '<div id="CloseCover" style=" cursor:pointer; position:absolute;  width:30px; height:30px; text-align:center; line-height:30px; top:5px; right:30px; border-radius:5px 5px 0px 0px; color:#000;" onclick="Cover(this)" title="点击我就关闭了！"><img src="白.png" style="width:25px; height:25px;"></div>';
    ContentHtml += '</div>';
    ContentHtml += '<iframe scrolling="no" src="' + htmlSrc + '" width="' + width + '" height="' + height + '" style="border:none;"></iframe>';
    ContentHtml += '</div>';
    $(window.parent.document.body).append(CoverHtml + ContentHtml);
    $(window.parent.document.body).css('overflow', 'hidden');
    anim('#tdiv', winHeight - $(document).scrollTop(), top);
}
function Eject2(htmlSrc, title, width, height) {
    //获取浏览器高度
    var winHeight = $(window.parent).height();
    //获取浏览器宽度
    var winWidth = $(window.parent).width();
    //计算上部分高度
    var top = ((winHeight - height) / 2) + $(document).scrollTop();
    //计算左部分宽度
    var left = (winWidth - width) / 2;
    //添加遮盖层
    var CoverHtml = '<div id="coverDiv" style="background-color:rgba(0,0,0,.9); width:' + (window.parent.document.body.scrollWidth + 10) + 'px; height:' + (window.parent.document.body.scrollHeight + 10) + 'px; position:absolute; top:0px; left:0px; z-index:200;"></div>';
    //添加内容
    var ContentHtml = '<div id="tdiv" class="tdiv" style="position:absolute; top:-' + (height + top) + 'px; left:' + left + 'px; background-color:white; border:solid 1PX #C4C4C4; box-shadow:1px 1px 10px; border-radius:10px; onverflow:hidden; text-overflow:clip; overflow:hidden; width:' + width + 'px; height:' + height + 'px; z-index:200;">';
    ContentHtml += '<div style="width:100%; height:0px; border-radius:2PX 2PX 0PX 0PX; position:relative;  ">';
    ContentHtml += '<div id="CloseCover" style=" cursor:pointer; position:absolute;  width:30px; height:30px; text-align:center; line-height:30px; top:5px; right:30px; border-radius:5px 5px 0px 0px; color:#000;" onclick="Cover(this)" title="点击我就关闭了！"><img src="红.png" style="width:25px; height:25px;"></div>';
    ContentHtml += '</div>';
    ContentHtml += '<iframe scrolling="no" src="' + htmlSrc + '" width="' + width + '" height="' + height + '" style="border:none;"></iframe>';
    ContentHtml += '</div>';
    $(window.parent.document.body).append(CoverHtml + ContentHtml);
    $(window.parent.document.body).css('overflow', 'hidden');
    anim('#tdiv', winHeight - $(document).scrollTop(), top);
}
//弹出页面方法集合 htmlSrc 为html页面路径 本窗体
function EjectIdent(htmlSrc, title, width, height) {
    //获取浏览器高度
    var winHeight = $(window).height();
    //获取浏览器宽度
    var winWidth = $(window).width();
    //计算上部分高度
    var top = ((winHeight - height) / 2) + $(document).scrollTop();
    //计算左部分宽度
    var left = (winWidth - width) / 2;
    //添加遮盖层
    var CoverHtml = '<div id="coverDiv" style="background-color:rgba(0,0,0,.9); width:' + (window.document.body.scrollWidth + 10) + 'px; height:' + (window.document.body.scrollHeight + 10) + 'px; position:absolute; top:0px; left:0px; z-index:200;"></div>';
    //添加内容
    var ContentHtml = '<div id="tdiv" class="tdiv" style="position:absolute; top:-' + (height + top) + 'px; left:' + left + 'px; background-color:white; border:solid 1PX #C4C4C4; box-shadow:1px 1px 10px; border-radius:10px; onverflow:hidden; text-overflow:clip; overflow:hidden; width:' + width + 'px; height:' + height + 'px; z-index:200;">';
    ContentHtml += '<div style="width:100%; height:0px; border-radius:2PX 2PX 0PX 0PX; position:relative;  ">';
    ContentHtml += '<div id="CloseCover" style=" cursor:pointer; position:absolute;  width:30px; height:0px; text-align:center; line-height:30px; top:5px; right:30px; border-radius:5px 5px 0px 0px; color:#000;" onclick="Cover(this)" title="点击我就关闭了！"><img src="白.png" style="width:25px; height:25px;"></div>';
    ContentHtml += '</div>';
    ContentHtml += '<iframe scrolling="no" src="' + htmlSrc + '"  width="' + width + '" height="' + height + '" style="border:none;"></iframe>';
    ContentHtml += '</div>';
    $(window.document.body).append(CoverHtml + ContentHtml);
    $(window.document.body).css('overflow', 'hidden');
    animIdent('#tdiv', winHeight - $(document).scrollTop(), top);
}
function EjectIdent2(htmlSrc, title, width, height) {
    //获取浏览器高度
    var winHeight = $(window).height();
    //获取浏览器宽度
    var winWidth = $(window).width();
    //计算上部分高度
    var top = ((winHeight - height) / 2) + $(document).scrollTop();
    //计算左部分宽度
    var left = (winWidth - width) / 2;
    //添加遮盖层
    var CoverHtml = '<div id="coverDiv" style="background-color:rgba(0,0,0,.9); width:' + (window.document.body.scrollWidth + 10) + 'px; height:' + (window.document.body.scrollHeight + 10) + 'px; position:absolute; top:0px; left:0px; z-index:200;"></div>';
    //添加内容
    var ContentHtml = '<div id="tdiv" class="tdiv" style="position:absolute; top:-' + (height + top) + 'px; left:' + left + 'px; background-color:white; border:solid 1PX #C4C4C4; box-shadow:1px 1px 10px; border-radius:10px; onverflow:hidden; text-overflow:clip; overflow:hidden; width:' + width + 'px; height:' + height + 'px; z-index:200;">';
    ContentHtml += '<div style="width:100%; height:0px; border-radius:2PX 2PX 0PX 0PX; position:relative;  ">';
    ContentHtml += '<div id="CloseCover" style=" cursor:pointer; position:absolute;  width:30px; height:0px; text-align:center; line-height:30px; top:5px; right:30px; border-radius:5px 5px 0px 0px; color:#000;" onclick="Cover(this)" title="点击我就关闭了！"><img src="红.png" style="width:25px; height:25px;"></div>';
    ContentHtml += '</div>';
    ContentHtml += '<iframe scrolling="no" src="' + htmlSrc + '"  width="' + width + '" height="' + height + '" style="border:none;"></iframe>';
    ContentHtml += '</div>';
    $(window.document.body).append(CoverHtml + ContentHtml);
    $(window.document.body).css('overflow', 'hidden');
    animIdent('#tdiv', winHeight - $(document).scrollTop(), top);
}
//关闭窗体
function Cover(coverThis) {
    //关闭窗体
    $(coverThis).parent().parent().remove();
    $('#coverDiv').remove();
    $(window.document.body).css('overflow', '');
}
//窗体动画
function animIdent(id, height, top) {
    var defaulttop = -height;
    var aniva = window.setInterval(function () {
        if (defaulttop >= top) {
            $(id).css('top', top);
            window.clearInterval(aniva);
        }
        $(id).css('top', defaulttop);
        defaulttop=defaulttop + 50;
    }, 1);
}
//窗体动画
function anim(id, height, top) {
    var defaulttop = -height;
    var aniva = window.parent.window.setInterval(function () {
        if (defaulttop >= top) {
            $(id).css('top', top);
            window.parent.window.clearInterval(aniva);
        }
        $(id, parent.document).css('top', defaulttop);
        defaulttop = defaulttop + 50;
    }, 1);
}
