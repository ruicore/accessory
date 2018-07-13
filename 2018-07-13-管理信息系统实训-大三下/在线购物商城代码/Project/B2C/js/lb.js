//轮播图片
function lb() {
    //设置图片之间的等待时间
    var DeTime = 3000;
    //点击等待时间（自动设定）
    var ClickDeTime = 0;
    //图片集合
    var listImg = $('#lb ul li');
    listImg.css('list-style-type', 'none');
    //最大宽度
    var maxWidth = $('#lb').width();
    //最大高度
    var maxHeight = $('#lb').height();
    //设置图片大小
    $('#lb ul li img').css('height', maxHeight + "px");
    $('#lb ul li img').css('width', maxWidth + "px");
    listImg.css("position", "absolute");
    listImg.css('top', '0');
    listImg.css('left', 0);
    //记录动画当前index
    var animateIndex = listImg.length - 1;
    //设置动画效果
    var imgAnimate = window.setInterval(function () {
        if (ClickDeTime > 0) {
            ClickDeTime -= DeTime;
            return;
        }
        $('#lb ul li:last-child').animate({ "left": maxWidth + "px" }, 1000, function () {
            var temp = $(this).clone();
            $(this).remove();
            temp.css('left', '0');
            $('#lb ul').prepend(temp);
            animateIndex--;
            if (animateIndex < 0) {
                animateIndex = listImg.length - 1;
            }
        })
    }, DeTime);
    //鼠标经过div显示导航
    var bennerTop = maxHeight - $('.imgbanner').height();
    $('#lb').mouseover(function () {
        $('.imgbanner').stop(true, false).animate({ 'top': bennerTop + "px" }, 600)
    }).mouseout(function () {
        $('.imgbanner').stop(true, false).animate({ 'top': maxWidth + "px" }, 600)
    });
    //导航信息中添加点击事件
    $('.imgbannerDiv img').click(function () {
        var index = $(this).index();
        //停止动画
        $('#lb ul li:last-child').stop(true, true);
        //window.clearInterval(imgAnimate);
        //获得运行次数
        var Aint = animateIndex + 1 + (listImg.length - 1) - index;
        for (var i = 0; i < Aint; i++) {
            var temp = $('#lb ul li:last-child').clone();
            $('#lb ul li:last-child').remove();
            $('#lb ul').prepend(temp);
            animateIndex--;
            if (animateIndex < 0) {
                animateIndex = listImg.length - 1;
            }
            ClickDeTime = DeTime;
        }
        window.setInterval(imgAnimate);
    });
}

//鼠标经过类型显示图片
function MouseInPro() {
    var timeover = null;
    var timeout = null;
    $('#ContentPro div').mousemove(function () {
        var img = $(this).children('img');
        img.stop(false, false).animate({ "left": "0px" }, 260);
    });
    $('#ContentPro div').mouseout(function () {
        var img = $(this).children('img');
        img.stop(false, false).animate({ "left": "-165px" }, 260);
    });
}