function setPlatTxtSize(isMac)
{
    if(isMac== 0)
    {
       textSize = 12;
    }else{
       textSize = 14;
    }
}
var textType = "微软雅黑"
var textSize = 12
var wallpaper_top_leftarrow_img_btnName = "leftarrowBtn"
var wallpaper_top_leftarrow_img_n = "qrc:/images/pics/pics_trun_left_n.png"
var wallpaper_top_leftarrow_img_h = "qrc:/images/pics/wallpaper_trun_left_h.png"
var wallpaper_top_leftarrow_img_p = "qrc:/images/pics/wallpaper_trun_left_p.png"

var wallpaper_top_rightarrow_img_btnName = "rightarrowBtn"
var wallpaper_top_rightarrow_img_n = "qrc:/images/pics/wallpaper_trun_right_n.png"
var wallpaper_top_rightarrow_img_h = "qrc:/images/pics/wallpaper_trun_right_h.png"
var wallpaper_top_rightarrow_img_p = "qrc:/images/pics/wallpaper_trun_right_p.png"

var wallpaper_top_setwallpaper_btnName = "setwallpaperBtn"
var wallpaper_top_setwallpaper_n = "qrc:/images/pics/wallpaper_set_btn_n.png"
var wallpaper_top_setwallpaper_h = "qrc:/images/pics/wallpaper_set_btn_h.png"
var wallpaper_top_setwallpaper_p = "qrc:/images/pics/wallpaper_set_btn_p.png"

var wallpaper_view_prev_navtion_btn_n = "qrc:/images/picview/pre_page_n.png"
var wallpaper_view_prev_navtion_btn_h = "qrc:/images/picview/pre_page_p.png"
var wallpaper_view_next_navtion_btn_n = "qrc:/images/picview/next_page_n.png"
var wallpaper_view_next_navtion_btn_h = "qrc:/images/picview/next_page_p.png"

var wallpaper_view_leftarrow_btn_n = "qrc:/images/picview/arr_left_n.png"
var wallpaper_view_leftarrow_btn_p = "qrc:/images/picview/arr_left_p.png"
var wallpaper_view_rightarrow_btn_n = "qrc:/images/picview/arr_right_n.png"
var wallpaper_view_rightarrow_btn_p = "qrc:/images/picview/arr_right_p.png"
var wallpaper_view_download_btn_n = "qrc:/images/picview/download_pic_n.png"
var wallpaper_view_download_btn_p = "qrc:/images/picview/download_pic_p.png"

var wallpaper_mention_first = "已是第一张"
var wallpaper_mention_end = "已是最后一张"
//http://static.nduoa.com/apk/628/628899/icon_72.png
var plJson = "[{friendimg:\"http://img01.nduoa.com/apk/658/658954/icon_72.png\",friendname:\"yitb@12306\",\
   contents:\"我在易班的职位是C++开发工程师 \\r\\n我在这里等你 \\r\\n我在测试model\",\
   images:[],\
   plJson:[{\"imgHead\":\"http://img01.nduoa.com/apk/658/658954/icon_72.png\",\"names\":\"寒山居士\",\"content\":\"得很给力\"}]},{friendimg:\"http://img02.nduoa.com/apk/659/659270/icon_72.png\",friendname:\"yitb@12306\",\
   contents:\"我在易班的职位是C++开发工程师 \\r\\n我在这里等你 \\r\\n我在测试model\",\
   images:[{\"colors\":\"http://img02.nduoa.com/apk/662/662362/0.watermark.jpg\",\"value\":\"http://img01.nduoa.com/apk/658/658954/icon_72.png\"},\
   {\"colors\":\"http://img02.nduoa.com/apk/662/662362/2.watermark.jpg\",\"value\":\"http://img02.nduoa.com/apk/592/592436/icon_72.png\"},\
   {\"colors\":\"http://img02.nduoa.com/apk/662/662362/2.watermark.jpg\",\"value\":\"http://img02.nduoa.com/apk/659/659270/icon_72.png\"},\
   {\"colors\":\"http://img02.nduoa.com/apk/662/662362/2.watermark.jpg\",\"value\":\"http://img02.nduoa.com/apk/658/658954/icon_72.png\"},\
   {\"colors\":\"http://img02.nduoa.com/apk/662/662362/2.watermark.jpg\",\"value\":\"http://img01.nduoa.com/apk/662/662455/icon_72.png\"}],\
   plJson:[{\"imgHead\":\"http://img02.nduoa.com/apk/659/659270/icon_72.png\",\"names\":\"yitb\",\"content\":\"我很给力\"},\
   {\"imgHead\":\"http://img02.nduoa.com/apk/659/659270/icon_72.png\",\"names\":\"2013\",\"content\":\"我觉得很给力\"},\
   {\"imgHead\":\"http://img02.nduoa.com/apk/659/659270/icon_72.png\",\"names\":\"寒山居士\",\"content\":\"得很给力\"}]},{friendimg:\"http://img02.nduoa.com/apk/659/659270/icon_72.png\",friendname:\"yitb@12306\",\
   contents:\"我在易班的职位是C++开发工程师 我在这里等你 我在测试model\",\
   images:[{\"colors\":\"http://img02.nduoa.com/apk/662/662362/2.watermark.jpg\",\"value\":\"http://img01.nduoa.com/apk/658/658954/icon_72.png\"},\
   {\"colors\":\"http://img02.nduoa.com/apk/662/662362/2.watermark.jpg\",\"value\":\"http://img02.nduoa.com/apk/592/592436/icon_72.png\"},\
{\"colors\":\"http://img02.nduoa.com/apk/662/662362/2.watermark.jpg\",\"value\":\"http://img02.nduoa.com/apk/659/659270/icon_72.png\"},\
   {\"colors\":\"http://img02.nduoa.com/apk/662/662362/2.watermark.jpg\",\"value\":\"http://img02.nduoa.com/apk/659/659270/icon_72.png\"}],\
   plJson:[{\"imgHead\":\"http://img01.nduoa.com/apk/662/662455/icon_72.png\",\"names\":\"yitb\",\"content\":\"我很给力\"},\
   {\"imgHead\":\"http://img02.nduoa.com/apk/659/659270/icon_72.png\",\"names\":\"寒山居士\",\"content\":\"得很给力\"}]},{friendimg:\"http://img02.nduoa.com/apk/659/659270/icon_72.png\",friendname:\"yitb@12306\",\
   contents:\"我在易班的职位是C++开发工程师我在这里等你我在测试model\",\
   images:[{\"colors\":\"http://img02.nduoa.com/apk/662/662362/5.watermark.jpg\",\"value\":\"http://img01.nduoa.com/apk/658/658954/icon_72.png\"},\
   {\"colors\":\"http://img02.nduoa.com/apk/662/662362/2.watermark.jpg\",\"value\":\"http://img02.nduoa.com/apk/592/592436/icon_72.png\"},\
{\"colors\":\"http://img02.nduoa.com/apk/662/662362/2.watermark.jpg\",\"value\":\"http://img01.nduoa.com/apk/662/662455/icon_72.png\"},\
   {\"colors\":\"http://img02.nduoa.com/apk/662/662362/2.watermark.jpg\",\"value\":\"http://img02.nduoa.com/apk/659/659270/icon_72.png\"}],\
   plJson:[{\"imgHead\":\"http://img02.nduoa.com/apk/659/659270/icon_72.png\",\"names\":\"yitb\",\"content\":\"我很给力\"},\
   {\"imgHead\":\"http://img02.nduoa.com/apk/659/659270/icon_72.png\",\"names\":\"寒山居士\",\"content\":\"得很给力\"}]},{friendimg:\"http://img02.nduoa.com/apk/659/659270/icon_72.png\",friendname:\"yitb@12306\",\
   contents:\"我在易班的职位是C++开发工程师 \\r\\n我在这里等你 \\r\\n我在测试model\",\
   images:[{\"colors\":\"http://img02.nduoa.com/apk/662/662362/2.watermark.jpg\",\"value\":\"http://img01.nduoa.com/apk/658/658954/icon_72.png\"},\
   {\"colors\":\"http://img02.nduoa.com/apk/662/662362/2.watermark.jpg\",\"value\":\"http://img02.nduoa.com/apk/592/592436/icon_72.png\"},\
{\"colors\":\"http://img02.nduoa.com/apk/662/662362/2.watermark.jpg\",\"value\":\"http://img02.nduoa.com/apk/659/659270/icon_72.png\"},\
   {\"colors\":\"\",\"value\":\"\"}],\
   plJson:[{\"imgHead\":\"http://img02.nduoa.com/apk/659/659270/icon_72.png\",\"names\":\"yitb\",\"content\":\"我很给力\"},\
   {\"imgHead\":\"http://img02.nduoa.com/apk/659/659270/icon_72.png\",\"names\":\"秋思波渺\",\"content\":\"我觉得很给力\"},\
   {\"imgHead\":\"http://img02.nduoa.com/apk/659/659270/icon_72.png\",\"names\":\"寒山居士\",\"content\":\"得很给力\"}]}]";

var pldetailsJson = "[{imgHead:\"http://img02.nduoa.com/apk/659/659270/icon_72.png\",names:\"一衣代水\",\
   contents:\"评论@我在易班的职位是C++开发工程师eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee \\r\\n我在这里等你 \\r\\n我在测试model\",plTime:\"15:33\"},\
{imgHead:\"http://img02.nduoa.com/apk/659/659270/icon_72.png\",names:\"晓满\",\
   contents:\"评论@易班的职位是C++开发工程师 \\r\\n我在这里等你 \\r\\n我在测试model\",plTime:\"16:22\"},\
{imgHead:\"http://img02.nduoa.com/apk/659/659270/icon_72.png\",names:\"寒山-居士\",\
   contents:\"我在易班,是C++开发工程师 \\r\\n我在这里等你 \\r\\n我在测试model\",plTime:\"16:29\"},\
{imgHead:\"http://img02.nduoa.com/apk/659/659270/icon_72.png\",names:\"函数\",\
   contents:\"评论@我在易班的职位是C++开发工程师 \\r\\n我在这里等你 \\r\\n我在测试model\",plTime:\"16:42\"}]";
var zhuanFJson = "[{imgHead:\"http://img02.nduoa.com/apk/659/659270/icon_72.png\",names:\"秋思波渺\",\
   contents:\"转发@C++开发工程师 \\r\\n我在这里等你 \\r\\n我在测试model\",plTime:\"15:33\"},\
{imgHead:\"http://img02.nduoa.com/apk/659/659270/icon_72.png\",names:\"寒山-居士\",\
   contents:\"C++开发工程师 \\r\\n我在这里xxxxxxxxxxxxxxxxxxx等你 \\r\\n我在测试model\",plTime:\"16:22\"},\
{imgHead:\"http://img02.nduoa.com/apk/659/659270/icon_72.png\",names:\"yitb\",\
   contents:\"是C++开发工程师 \\r\\n我在这里等你 \\r\\n我在测试model\",plTime:\"16:29\"},\
{imgHead:\"http://img02.nduoa.com/apk/659/659270/icon_72.png\",names:\"一衣代水\",\
   contents:\"转发@我在易班 \\r\\n我在这里等你 \\r\\n我在测试model\",plTime:\"16:42\"},\
{imgHead:\"http://img02.nduoa.com/apk/659/659270/icon_72.png\",names:\"秋思波渺\",\
   contents:\"易班 \\r\\n我在这里等你 \\r\\n我在测试model\",plTime:\"16:42\"}]";
var blueArr=[
            "#000079",
            "#000093",
            "#0000C6",
            "#0000C6",
            "#0000E3",
            "#2828FF",
            "#4A4AFF",
            "#6A6AFF",
            "#7D7DFF",
            "#9393FF",
            "#AAAAFF",
            "#B9B9FF",
            "#CECEFF"];
var greenArr =[
            "#467500",
            "#548C00",
            "#64A600",
            "#73BF00",
            "#82D900",
            "#8CEA00",
            "#9AFF02",
            "#A8FF24",
            "#B7FF4A",
            "#C2FF68",
            "#CCFF80",
            "#D3FF93",
            "#DEFFAC"
        ];
var redArr=[
            "#000000",
            "#4D0000",
            "#600000",
            "#750000",
            "#930000",
            "#AE0000",
            "#CE0000",
            "#EA0000",
            "#FF0000",
            "#FF2D2D",
            "#FF5151",
            "#ff7575",
            "#FF9797"
        ]

var yb_zhuce_url = "http://www.yiban.cn/reg";
var yb_forget_pass = "https://www.yiban.cn/findpass";
