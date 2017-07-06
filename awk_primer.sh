#!/bin/sh

# awk_primer.sh
# Created by Leo Wen on 2017年 7月 6日 星期四 15时45分16秒 CST

#---------------------------------------------------------------------------
#awk 語法：
#awk [选项参数] 'script' var=value file(s)
#awk [选项参数] -f scriptfile var=value file(s)

# 每行默認按空格或TAB分割，输出文本中的1、4项, 
# 每行的分割項以＄1開始，
awk '{print $1,$4}' ./log.txt

# 格式化输出
awk '{printf "%-8s %-10s\n",$1,$4}' log.txt

# 使用","分割
awk -F, '{print $1,$2}'   log.txt

# 或者使用内建变量
awk 'BEGIN{FS=","} {print $1,$2}'     log.txt

# 使用多个分隔符.先使用空格分割，然后对分割结果再使用","分割
awk -F '[ ,]'  '{print $1,$2,$5}'   log.txt

#awk -v  # 设置变量, 对以选择的分割项进行变量操作，
awk -v a=1 '{print $1,$1+a}' log.txt
awk -v a=1 -v b=s '{print $1,$1+a,$1a,$1+b,$1b}' log.txt
#+对数字的操作，字符串认为0

#---------------------------------------------------------------------------
#awk 运算符

#过滤第一列大于3的行, 字母大于数字
awk '$1>3' log.txt 

#过滤第一列等于2的行
awk '$1==2 {print $1,$3}' log.txt    #命令

#过滤第一列大于2并且第二列等于'Are'的行
awk '$1>2 && $2=="Are" {print $1,$2,$3}' log.txt

#---------------------------------------------------------------------------
#内建变量
awk 'BEGIN{printf "%4s %4s %4s %4s %4s %4s %4s %4s %4s\n","FILENAME","ARGC","FNR","FS","NF","NR","OFS","ORS","RS";printf "---------------------------------------------\n"} {printf "%4s %4s %4s %4s %4s %4s %4s %4s %4s\n",FILENAME,ARGC,FNR,FS,NF,NR,OFS,ORS,RS}'  log.txt

# 输出顺序号 NR, 匹配文本行号
awk '{print NR,FNR,$1,$2,$3}' log.txt

# 指定输出分割符
awk '{print $1,$2,$5}' OFS=" $ "  log.txt

#---------------------------------------------------------------------------
#使用正则，字符串匹配, ~ 表示模式开始。// 中是模式。
# 输出第二列包含 "th"，并打印第二列与第四列
awk '$2 ~ /th/ {print $2,$4}' log.txt

# 输出包含"re" 的行, 未选择项，全行输出
awk '/re/ ' log.txt

#忽略大小写
awk 'BEGIN{IGNORECASE=1} /This/' log.txt

#模式取反
awk '$2 !~ /th/ {print $2,$4}' log.txt
awk '!/th/ {print $2,$4}' log.txt
awk '/th/ {print $2,$4}' log.txt

#---------------------------------------------------------------------------
#awk -f {awk脚本} {文件名}
#关于awk脚本，我们需要注意两个关键词BEGIN和END。
#BEGIN{ 这里面放的是执行前的语句 }
#END {这里面放的是处理完所有的行后要执行的语句 }
#{这里面放的是处理每一行时要执行的语句}
#基于score.txt， cal.awk

awk -f cal.awk score.txt

#---------------------------------------------------------------------------
#常用用法：

#计算文件大小
#ls -l *.txt | awk '{sum+=$6} END {print sum}'

#从文件中找出长度大于80的行
#awk 'lenght>80' log.txt

#打印九九乘法表
seq 9 | sed 'H;g' | awk -v RS='' '{for(i=1;i<=NF;i++)printf("%dx%d=%d%s", i, NR, i*NR, i==NR?"\n":"\t")}'
