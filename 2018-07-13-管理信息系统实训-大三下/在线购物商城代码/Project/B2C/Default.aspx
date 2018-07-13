<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Default" %>

<%@ Register Src="top.ascx" TagName="top" TagPrefix="uc1" %>
<%@ Register Src="left.ascx" TagName="left" TagPrefix="uc2" %>
<%@ Register Src="bottom.ascx" TagName="bottom" TagPrefix="uc3" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>电子商务网站</title>
    <link href="css/StyleSheet.css" rel="StyleSheet" type="text/css" />
    <link href="css/StyleSheet.css" rel="StyleSheet" type="text/css" />
    <link href="css/StyleSheet.css" rel="StyleSheet" type="text/css" />
    <link href="css/StyleSheet.css" rel="StyleSheet" type="text/css" />
    <script src="js/jquery.min.js"></script>
    <script src="js/Exect.js"></script>
    <script src="js/lb.js"></script>
    <style>
        .menu {
            height: 40px;
            width: 120px;
            line-height: 40px;
            text-align: center;
            font-size: 16px;
            float: left;
            font-weight: 700;
            cursor: pointer;
        }
        /*轮播用的*/
        .imgbanner {
            position: absolute;
            top: 320px;
            left: 0px;
            background-color: rgba(255,255,255,.4);
            height: 75px;
            width: 100%;
        }

        .imgbannerDiv {
            padding-left: 20px;
        }

            .imgbannerDiv img {
                width: 70px;
                height: 70px;
                margin: 2px 10px;
                cursor: pointer;
            }
        /*轮播用的 END*/
    </style>
    <script>
        $(function () {
            LoginSet();
            GetType();
            GetBBS();
            lb();
            GetJiayong('1');
            GetJiayong('2');
            GetJiayong('3');
            GetJiayong('11');
        });
        //点击登录
        function ClickLogin() {
            EjectIdent('login.html', '', '500', '500');
        }
        //点击注册
        function ClickReg() {
            EjectIdent('reg.html', '', '500', '630');
        }
        //用户登录设置
        function LoginSet() {
            var pd = { "t": "CheckLogin" };
            $.ajax({
                type: "post",
                url: "tools/Handler.ashx",
                data: pd,
                dataType: "json",
                success: function (data) {
                    if (data.status != "-1") {
                        $('#loginBtn').hide();
                        $('#userNameBtn').html(data.status);
                        $('#userNameBtn').show();
                        $('#outBtn').show();
                        $('#regBtn').hide();
                        $('#dingdanBtn').show();
                        $('#carBtn').show();
                        $('#kefuBtn').show();
                    }
                    else {
                        $('#loginBtn').show();
                        $('#userNameBtn').hide();
                        $('#outBtn').hide();
                        $('#regBtn').show();
                        $('#dingdanBtn').hide();
                        $('#carBtn').hide();
                        $('#kefuBtn').hide();
                    }
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                }
            });
        }
        //获取类型
        function GetType() {
            var pd = { "t": "SelectType" };   //设置需要向后台传递的值
            $.ajax({
                type: "post",
                url: "tools/Handler.ashx",
                data: pd,
                dataType: "json",
                success: function (data) {
                    if (data.status != "-1") {
                        var dataobj = eval("(" + data.status + ")");          //格式化后台传递过来的值
                        $('#lx').empty();                                     //清空显示类型区域的内容
                        var tagtypeStr = '-99';//当前类型
                        var tagstr = '';//当前文本
                        var o = 1;
                        $.each(dataobj.root, function (i, item) {
                            var title = item.TypeName;//显示文本
                            var values = item.ID;//值
                            var typeStr = item.superType;//类型
                            if (tagstr == '') {
                                tagtypeStr = typeStr;
                            }

                            if (tagtypeStr == typeStr) {
                                tagstr += "<font style='cursor:pointer;margin-left:18px;margin-top:20px;display:block;float:left' onclick='ClickType(" + values + ")'>" + title + "</font>";
                                o++;
                                if (o == 4) {
                                    tagstr += "<br />";
                                    o = 1;
                                }
                            }
                            else {
                                $('#lx').append('<div style="margin-left: 1px; font-size: 14px; ">' + tagstr + '</div>');
                                tagtypeStr = '-99';
                                tagstr = '';
                            }
                            //$('#lx').append(title);
                        });
                    }
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                }
            });
        }
        //获取公告
        function GetBBS() {
            var pd = { "t": "GetBBs" };
            $.ajax({
                type: "post",
                url: "tools/Handler.ashx",
                data: pd,
                dataType: "json",
                success: function (data) {
                    if (data.status != "-1") {
                        var dataobj = eval("(" + data.status + ")");
                        $.each(dataobj.root, function (i, item) {
                            var html = '<div style="margin-top: 15px; margin-left: 10px;cursor: pointer;white-space:nowrap; text-overflow:ellipsis;overflow:hidden;" onclick="clickBBs(\'' + item.ID + '\')"><font style="color:#ff3300">【促销】</font> ' + item.title + '</div>';
                            $('#gg').append(html);
                        });
                    }
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                }
            });
        }
        //点击公告
        function clickBBs(a) {
            //affiche.aspx?id=
            EjectIdent2('affiche.aspx?id=' + a, '', '500', '600');
        }
        //点击客服中心
        function ceneter() {
            EjectIdent2('WenCenter.html', '', '500', '600');
        }
        //点击购物车
        function shoppC() {
            EjectIdent2('ShoppingCart.html', '', '1000', '600');
        }
        //查询家用电器
        function GetJiayong(a) {
            var pd = { "t": "GetGoodList", "typeid": a };
            $.ajax({
                type: "post",
                url: "tools/Handler.ashx",
                data: pd,
                dataType: "json",
                success: function (data) {
                    if (data.status != "-1") {
                        var dataobj = eval("(" + data.status + ")");
                        $.each(dataobj.root, function (i, item) {
                            if (i == 0) {
                                //大图片
                                var h1 = '<img src="' + item.picture + '" style="width: 150px; height: 150px;cursor:pointer;" onclick="ClickGood(\'' + item.ID + '\')" />';
                                $('#f' + a + '_1').append(h1);
                            }
                            if (i >= 1 && i <= 4) {
                                //文字
                                if (i == 1 || i == 3) {
                                    var t1 = '<div style="width: 70px; float: left; font-size: 15px; margin-top: 13px; margin-left: 7px;white-space:nowrap; text-overflow:ellipsis;overflow:hidden;cursor:pointer;" onclick="ClickGood(\'' + item.ID + '\')">' + item.goodsName + '</div>';
                                    $('#f' + a + '_2').append(t1);
                                }
                                else {
                                    var t1 = '<div style="width: 70px; float: left; font-size: 15px; margin-top: 13px;white-space:nowrap; text-overflow:ellipsis;overflow:hidden;cursor:pointer;" onclick="ClickGood(\'' + item.ID + '\')">' + item.goodsName + '</div>';
                                    $('#f' + a + '_2').append(t1);
                                }
                            }
                            if (i >= 5 && i <= 8) {
                                if (i <= 6) {
                                    var t1 = '<div style="width: 260px; height: 108px; margin-left: 35px; float: left;cursor:pointer; ">' +
                                           '     <img src="' + item.picture + '" style="width: 260px; height: 108px;" onclick="ClickGood(\'' + item.ID + '\')" />' +
                                           ' </div>';
                                    $('#f' + a + '_3').append(t1);
                                }
                                else {
                                    var t1 = '<div style="width: 260px; height: 108px; margin-left: 35px; float: left; margin-top: 10px;cursor:pointer; ">' +
                                             '      <img src="' + item.picture + '" style="width: 260px; height: 108px;" onclick="ClickGood(\'' + item.ID + '\')" />' +
                                             '  </div>';
                                    $('#f' + a + '_3').append(t1);
                                }
                            }
                            if (i == 7) {
                                return;
                            }
                        });
                    }
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                }
            });
        }
        //点击物品
        function ClickGood(a) {
            EjectIdent2('goodsDetile.html?id=' + a, '', '500', '500');
        }
        //点击排行
        function Clickph(a) {
            EjectIdent2('ph.html', '', '500', '500');
        }
        //点击分类
        function ClickType(a) {
            EjectIdent('goodsBytype.html?id=' + a, '', '1000', '750');
        }
        //点击搜索
        function Clickselect() {
            var str = $('#strSelect').val();
            var pd = { "t": "SetSelectStr", "str": str };
            $.ajax({
                type: "post",
                url: "tools/Handler.ashx",
                data: pd,
                dataType: "json",
                success: function (data) {
                    if (data.status != "-1") {
                        EjectIdent('select.html', '', '1000', '700');
                    }
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                }
            });

        }
        //点击特价商品和新品上架
        function goodShow(a) {
            //0位新品上架，1位特价商品
            EjectIdent('GoodShow.html?id=' + a, '', '1000', '750');
        }
        //点击我的订单
        function ClickOrder() {
            EjectIdent2('orderList.html', '', '1000', '700');
        }
        //点击退出
        function Out()
        {
            var pd = { "t": "outhTML" };
            $.ajax({
                type: "post",
                url: "tools/Handler.ashx",
                data: pd,
                dataType: "json",
                success: function (data) {
                    if (data.status != "-1") {
                        LoginSet();
                    }
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                }
            });

        }
    </script>
</head>
<body style="margin-top: 0px; padding-top: 0px; background-color:#f1f1f1;">

    <form id="form1" runat="server" class="css/StyleSheet.css">
        <div style="width: 790px; margin: auto; background-color:#fff;">
            <div style=" width: 790px; height: 172px;">
                <div style="width: 100%; height: 20px; background-color:#5FA6DB;">
                    <div style="color: #fff; width: 260px; float: left; margin-top: 3px;">HI，欢迎来到 51购商城</div>
                    <div id="outBtn" style="color: #fff; width: 60px; float: right; margin-top: 3px; cursor: pointer;" onclick="Out()">退出</div>
                    <div id="loginBtn" style="color: #fff; width: 60px; float: right; margin-top: 3px; cursor: pointer;" onclick="ClickLogin()">登录</div>
                    <div id="userNameBtn" style="color: #fff; width: 60px; float: right; margin-top: 3px; cursor: pointer;" onclick="User()">用户名</div>
                    <div id="regBtn" style="color: #fff; width: 60px; float: right; margin-top: 3px; cursor: pointer;" onclick="ClickReg()">注册</div>
                    <div id="dingdanBtn" style="color: #fff; width: 60px; float: right; margin-top: 3px; cursor: pointer;" onclick="ClickOrder()">我的订单</div>
                    <div id="carBtn" style="color: #fff; width: 60px; float: right; margin-top: 3px; cursor: pointer;" onclick="shoppC()">购物车</div>
                    <div id="kefuBtn" style="color: #fff; width: 60px; float: right; margin-top: 3px; cursor: pointer;" onclick="ceneter()">客服中心</div>
                </div>
                <div style="width: 100%; height: 50px;">
                    <div style="width: 220px; height: 50px; float: left; margin-top: 20px; margin-left: 25px;">
                        <img src="image/51gou.png" />
                    </div>
                    <div style="width: 500px; height: 50px; float: right; margin-top: 60px;">
                        <input id="strSelect" type="text" style="height: 40px; width: 320px; float: left; font-size: 15px; border-color:#5FA6DB; border-style:solid;" placeholder="请输入搜索信息：例如“电视，彩电，洗衣机”" />
                        <input type="button" value="搜索" style="float: left; height: 46px; width: 100px; border: none; font-size: 18px; color: white; background-color: #5FA6DB;" onclick="Clickselect()" />
                    </div>
                    <div style="width: 500px; height: 20px; float: right; margin-top: 0px;">
                        <div style="float: left; color: #5fa6db; width: 110px;">辉伟等离子</div>
                        <div style="float: left; color: #5fa6db; width: 110px;">新书推荐</div>
                        <div style="float: left; color: #5fa6db; width: 110px;">特价五折</div>
                        <div style="float: left; color: #5fa6db; width: 110px;">电视</div>
                    </div>
                </div>
            </div>
            <div style="height: 40px; width: 100%;">
                <div class="menu" style="background-color: #5fa6db; width: 220px; color: #fff;">全部商品分类</div>
                <div style="float: left; margin-left: 70px;">
                    <div class="menu" onclick="goodShow(0)" style="color:#5fa6db">新品上架</div>
                    <div class="menu" onclick="goodShow(1)" style="margin-left: 40px;color:#5fa6db">其他商品</div>
                </div>

            </div>
            <div style="width: 100%; height: 270px;">
                <div id="lx" style=" width: 220px; height: 270px; float: left; color:#5fa6db">
                    <%--类型显示地方--%>
                </div>
                <div style="width: 420px; height: 270px; float: left;">
                    <!--图片循环-->
                    <div id="lb" style="width: 420px; height: 270px; position: relative; overflow: hidden; text-overflow: clip;">
                        <ul>
                            <li>
                                <img src="image/1-1.png" /></li>
                            <li>
                                <img src="image/1-2.jpg" /></li>
                            <li>
                                <img src="image/1-3.png" /></li>
                            <li>
                                <img src="image/1-4.jpg" /></li>
                        </ul>
                        <div class="imgbanner">
                            <div class="imgbannerDiv">
                                <img src="image/1-1.png" />
                                <img src="image/1-2.jpg" />
                                <img src="image/1-3.png" />
                                <img src="image/1-4.jpg" />
                            </div>
                        </div>
                    </div>
                </div>
                <div style="width: 150px; height: 300px; float: left;">
                    <div id="gg" style=" height: 240px; width: 140px; margin-left: 5px; margin-top: 20px;">
                        <div style="margin-top: 15px; margin-left: 10px; cursor: pointer;" onclick="Clickph()"><font style="color: rgb(255, 106, 0)">【公告】</font> 销售排名</div>
                    </div>
                </div>
            </div>
            <div style="width: 100%; height: 200px; margin-top: 10px;">
                <div style="width: 185px; height: 200px; background-color: aqua; margin-left: 10px; float: left; position: relative;">
                    <img src="image/4.jpg" style="width: 100%; height: 100%;" />
                    <font style="position: absolute; top: 100px; left: 40px; font-size: 20px; font-weight: 900; color: rgb(255, 121, 53)"></font>
                </div>
                <div style="width: 185px; height: 200px; background-color: aqua; margin-left: 10px; float: left; position: relative;">
                    <img src="image/1.jpg" style="width: 100%; height: 100%;" />
                    <font style="position: absolute; top: 100px; left: 40px; font-size: 20px; font-weight: 900; color: rgb(255, 121, 53)"></font>
                </div>
                <div style="width: 185px; height: 200px; background-color: aqua; margin-left: 10px; float: left; position: relative;">
                    <img src="image/2.jpg" style="width: 100%; height: 100%;" />
                    <font style="position: absolute; top: 100px; left: 40px; font-size: 20px; font-weight: 900; color: rgb(255, 121, 53)"></font>
                </div>
                <div style="width: 185px; height: 200px; background-color: aqua; margin-left: 10px; float: left; position: relative;">
                    <img src="image/3.jpg" style="width: 100%; height: 100%;" />
                    <font style="position: absolute; top: 100px; left: 60px; font-size: 20px; font-weight: 900; color: rgb(255, 121, 53)"></font>
                </div>
            </div>
            <div style="width: 100%; margin-top: 20px;">
                <hr style="width: 100%; border: 1px dashed rgb(194, 194, 194);" />
            </div>
            <div style="width: 100%; height: 280px;">
                <div style="font-size: 20px; margin-left: 20px;">F1 家用电器</div>
                <div style="margin-top: 20px;">
                    <div style="float: left; margin-left: 20px;">
                        <div id="f1_1">
                            <%--<img src="image/父亲节1.jpg" style="width: 150px; height: 150px;" />--%>
                        </div>
                        <div id="f1_2" style="width: 148px; border: 1px solid rgb(194, 194, 194); height: 75px;">
                            <%--<div style="width: 70px; float: left; font-size: 15px; margin-top: 13px; margin-left: 7px;">电视频道</div>
                            <div style="width: 70px; float: left; font-size: 15px; margin-top: 13px;">电视频道</div>
                            <div style="width: 70px; float: left; font-size: 15px; margin-top: 13px; margin-left: 7px;">电视频道</div>
                            <div style="width: 70px; float: left; font-size: 15px; margin-top: 13px;">电视频道</div>--%>
                        </div>
                    </div>
                    <div style="float: left; width: 610px; height: 220px;" id="f1_3">
                        <%--<div style="width: 260px; height: 108px; margin-left: 35px; float: left;">
                            <img src="image/父亲节1.jpg" style="width: 260px; height: 108px;" />
                        </div>
                        <div style="width: 260px; height: 108px; margin-left: 35px; float: left;">
                            <img src="image/父亲节1.jpg" style="width: 260px; height: 108px;" />
                        </div>
                        <div style="width: 260px; height: 108px; margin-left: 35px; float: left; margin-top: 10px;">
                            <img src="image/父亲节1.jpg" style="width: 260px; height: 108px;" />
                        </div>
                        <div style="width: 260px; height: 108px; margin-left: 35px; float: left; margin-top: 10px;">
                            <img src="image/父亲节1.jpg" style="width: 260px; height: 108px;" />
                        </div>--%>
                    </div>
                </div>
            </div>
            <div style="width: 100%; height: 280px; margin-top: 20px;">
                <div style="font-size: 20px; margin-left: 20px;">F2 电脑数码</div>
                <div style="margin-top: 20px;">
                    <div style="float: left; margin-left: 20px;">
                        <div id="f2_1">
                            <%--<img src="image/父亲节1.jpg" style="width: 150px; height: 150px;" />--%>
                        </div>
                        <div id="f2_2" style="width: 148px; border: 1px solid rgb(194, 194, 194); height: 75px;">
                            <%--<div style="width: 70px; float: left; font-size: 15px; margin-top: 13px; margin-left: 7px;">电视频道</div>
                            <div style="width: 70px; float: left; font-size: 15px; margin-top: 13px;">电视频道</div>
                            <div style="width: 70px; float: left; font-size: 15px; margin-top: 13px; margin-left: 7px;">电视频道</div>
                            <div style="width: 70px; float: left; font-size: 15px; margin-top: 13px;">电视频道</div>--%>
                        </div>
                    </div>
                    <div style="float: left; width: 610px; height: 220px;" id="f2_3">
                        <%--<div style="width: 260px; height: 108px; margin-left: 35px; float: left;">
                            <img src="image/父亲节1.jpg" style="width: 260px; height: 108px;" />
                        </div>
                        <div style="width: 260px; height: 108px; margin-left: 35px; float: left;">
                            <img src="image/父亲节1.jpg" style="width: 260px; height: 108px;" />
                        </div>
                        <div style="width: 260px; height: 108px; margin-left: 35px; float: left; margin-top: 10px;">
                            <img src="image/父亲节1.jpg" style="width: 260px; height: 108px;" />
                        </div>
                        <div style="width: 260px; height: 108px; margin-left: 35px; float: left; margin-top: 10px;">
                            <img src="image/父亲节1.jpg" style="width: 260px; height: 108px;" />
                        </div>--%>
                    </div>
                </div>
            </div>
            <div style="width: 100%; height: 280px; margin-top: 20px;">
                <div style="font-size: 20px; margin-left: 20px;">F3 手机专区</div>
                <div style="margin-top: 20px;">
                    <div style="float: left; margin-left: 20px;">
                        <div id="f3_1">
                            <%--<img src="image/父亲节1.jpg" style="width: 150px; height: 150px;" />--%>
                        </div>
                        <div id="f3_2" style="width: 148px; border: 1px solid rgb(194, 194, 194); height: 75px;">
                            <%--<div style="width: 70px; float: left; font-size: 15px; margin-top: 13px; margin-left: 7px;">电视频道</div>
                            <div style="width: 70px; float: left; font-size: 15px; margin-top: 13px;">电视频道</div>
                            <div style="width: 70px; float: left; font-size: 15px; margin-top: 13px; margin-left: 7px;">电视频道</div>
                            <div style="width: 70px; float: left; font-size: 15px; margin-top: 13px;">电视频道</div>--%>
                        </div>
                    </div>
                    <div style="float: left; width: 610px; height: 220px;" id="f3_3">
                        <%--<div style="width: 260px; height: 108px; margin-left: 35px; float: left;">
                            <img src="image/父亲节1.jpg" style="width: 260px; height: 108px;" />
                        </div>
                        <div style="width: 260px; height: 108px; margin-left: 35px; float: left;">
                            <img src="image/父亲节1.jpg" style="width: 260px; height: 108px;" />
                        </div>
                        <div style="width: 260px; height: 108px; margin-left: 35px; float: left; margin-top: 10px;">
                            <img src="image/父亲节1.jpg" style="width: 260px; height: 108px;" />
                        </div>
                        <div style="width: 260px; height: 108px; margin-left: 35px; float: left; margin-top: 10px;">
                            <img src="image/父亲节1.jpg" style="width: 260px; height: 108px;" />
                        </div>--%>
                    </div>
                </div>
            </div>
            <div style="width: 100%; height: 280px; margin-top: 20px;">
                <div style="font-size: 20px; margin-left: 20px;">F4 彩妆专区</div>
                <div style="margin-top: 20px;">
                    <div style="float: left; margin-left: 20px;">
                        <div id="f11_1">
                            <%--<img src="image/父亲节1.jpg" style="width: 150px; height: 150px;" />--%>
                        </div>
                        <div id="f11_2" style="width: 148px; border: 1px solid rgb(194, 194, 194); height: 75px;">
                            <%--<div style="width: 70px; float: left; font-size: 15px; margin-top: 13px; margin-left: 7px;">电视频道</div>
                            <div style="width: 70px; float: left; font-size: 15px; margin-top: 13px;">电视频道</div>
                            <div style="width: 70px; float: left; font-size: 15px; margin-top: 13px; margin-left: 7px;">电视频道</div>
                            <div style="width: 70px; float: left; font-size: 15px; margin-top: 13px;">电视频道</div>--%>
                        </div>
                    </div>
                    <div style="float: left; width: 610px; height: 220px;" id="f11_3">
                        <%--<div style="width: 260px; height: 108px; margin-left: 35px; float: left;">
                            <img src="image/父亲节1.jpg" style="width: 260px; height: 108px;" />
                        </div>
                        <div style="width: 260px; height: 108px; margin-left: 35px; float: left;">
                            <img src="image/父亲节1.jpg" style="width: 260px; height: 108px;" />
                        </div>
                        <div style="width: 260px; height: 108px; margin-left: 35px; float: left; margin-top: 10px;">
                            <img src="image/父亲节1.jpg" style="width: 260px; height: 108px;" />
                        </div>
                        <div style="width: 260px; height: 108px; margin-left: 35px; float: left; margin-top: 10px;">
                            <img src="image/父亲节1.jpg" style="width: 260px; height: 108px;" />
                        </div>--%>
                    </div>
                </div>
            </div>
            <img src="image/页脚(2).png" />
        </div>
        
    </form>
</body>
</html>
