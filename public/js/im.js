/**
 * Created by Administrator on 2017-08-17.
 */
//只能输入数字，其他格式的字符是无法输入：
    function onlyNum(){
        if(!(event.keyCode==46)&&!(event.keyCode==8)&&!(event.keyCode==37)&&!(event.keyCode==39))
            if(!((event.keyCode>=48&&event.keyCode<=57)||(event.keyCode>=96&&event.keyCode<=105)))
                event.returnValue=false;  //执行至该语句时，阻止输入；可类比阻止冒泡原理或者禁止右键功能；
    }
