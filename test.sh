#!/bin/sh


#----------------------------------------------------------
#test.sh
#Created by Leo Wen on 2017-07-03
#----------------------------------------------------------

name="leo wen"
echo $name
#readonly name   #只读变量，不可以再赋值
#name="leo"
#{}便于解释器识别变量的边界，习惯加上
echo "hello ${name}"
echo ${#name}       #字符串长度
echo ${name:1:3}    #提取子字符串
unset name
echo ${name}
echo ${hello}   #未定义变量，返回未空

#在Shell中，用括号来表示数组，数组元素用"空格"符号分割开,支持一维数组（不支持多维数组）
#array_name=(value0 value1 value2 value3)
array_name=(
value0
value1
value2
value3
)
echo ${array_name[0]}
echo ${array_name[@]}   #@代表数组中所有元素
echo ${#array_name[@]}  #元素的个数
echo ${#array_name[*]}
echo ${#array_name[1]}  #一个元素的长度

#算术运算符,表达式和运算符之间要有空格
var=`expr 2 + 3`
echo ${var}
var=`expr 2 - 3`
echo ${var}
var=`expr 2 \* 3`
echo ${var}
var=`expr 20 / 3`
echo ${var}
var=`expr 20 % 3`
echo ${var}
var=`expr 20 != 3`
echo ${var}

if [ 2 == 3 ]
then
    echo " 2 == 3 "
else
    echo " 2 != 3 "
fi

#echo
echo '$var' #单引号原样输出
echo `date` #反引号，显示当前日期
echo "OK! \c" # -e 开启转义 \c 不换行

#test
#Shell中的 test 命令用于检查某个条件是否成立，它可以进行数值、字符和文件三个方面的测试。

demoFun(){
echo "这是我的第一个 shell 函数!"
echo '输入 1 到 4 之间的数字:'
echo '你输入的数字为:'
read aNum
case $aNum in
1)  echo '你选择了 1'
echo "你选择了 ${1}"
return 1
;;
2)  echo '你选择了 2'
echo "你选择了 ${2}"
return 2
;;
3)  echo '你选择了 3'
echo "你选择了 ${3}"
return 3
;;
4)  echo '你选择了 4'
echo "你选择了 ${4}"
return 4
;;
*)  echo '你没有输入 1 到 4 之间的数字'
echo '你选择了 None'
return 0
;;
esac
}
demoFun 10 20 30 40 #函数调用, 和参数传递
echo "return $?"    #$? 上一指令运行的返回值

remark() {  #函数可以用于临时注释
$#	传递到脚本的参数个数
$*	以一个单字符串显示所有向脚本传递的参数
$$	脚本运行的当前进程ID号
$!	后台运行的最后一个进程的ID号
$@	与$*相同，但是使用时加引号，并在引号中返回每个参数。
$-	显示Shell使用的当前选项，与set命令功能相同。
$?	显示最后命令的退出状态。0表示没有错误，其他任何值表明有错误。
}

remark() {
Shell 文件包含
和其他语言一样，Shell 也可以包含外部脚本。这样可以很方便的封装一些公用的代码作为一个独立的文件

. filename   # 注意点号(.)和文件名中间有一空格

或

source filename
}







