# GFMDemo
README
=================
该文件用来测试和展示书写README的各种 markdown语法。GitHub的markdown语法在标准的markdown语法基础上做了扩充,称之为`GitHub Flavored Markdown`。 简称`GFM`, GFM在GitHub上有广泛应用,除了README文件外,issues和wiki均支持markdown语法。

****

###　　　　　　　　　　　　　　Author:jiexishede
###　　　　　　　　 　　E-mail:chinalilonglong@sina.com


==================



##<a name="index"/> 目录

* [横线] (#line)
* [标题] (#title)
* [文本] (#text)
    * 普通文本
    * 单行文本
    * 多行文本
    * 文字高亮
    * 字体

* [代码](#code)
* [其他](#other)

<a name="line"/> 
##***、 ---、 ______显示虚横线
***
----
____
____
——————
-------
_____
＿＿＿＿
－－－－
＿＿＿＿＿
＿＿＿＿＿＿
－－－－－－



<a name="title"/>
## 标题
#一级标题
##二级标题
###三级标题
####四级标题
#####五级标题
######六级标题


##<a name="text"/>显示文本

###普通文本

这是一段普通的文本

####关于换行
直接回车不能换行,<br>
可以使用\<br>。
但是使用html标签就丧失了markdown的意义.
可以在上一行文本后面补两个空格,  
这样下一行的文本就换行了．

或者就是在两行文本直接加一个空行．

---------
(对比)
直接回车不能换行,<br>
可以使用\<br>。
但是使用html标签就丧失了markdown的意义.
可以在上一行文本后面补两个空格, 
这样下一行的文本就换行了．

或者就是在两行文本直接加一个空行．

也能实现换行效果，不过这个行间距有点大．
###单行文本
    Hello, 大家好,我是果冻虾仁.
###文本块
    欢迎到访(文字前使用Tab键)
    很高兴见到您
    祝您,早上好, 中午好,下午好,晚安
###部分文字高亮
Thank `you`. Please `Call` Me `Coder`

####高亮功能更适合做一篇文章的tag
例如:<br>
`java` `网络编程` `Socket` `全双工`

####删除线
这是一个  ~~删除线~~

#### 斜体
*斜体1*

_斜体2_
#### 粗体
**粗体1**

__粗体2__
#### 组合
***组合1***

*~~组合2~~*

~~*组合3*~~

***~~组合4~~***



##<a name="code"/>代码
```Java
public static void main(String[]args){} //java
```
```Objective-C
#import "CollectionViewCell.h" // Objective-C
@interface CollectionViewCell()
@property (weak, nonatomic) IBOutlet UILabel *firstLabelView;
@property (weak, nonatomic) IBOutlet UIImageView *pictureView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView33;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *pictureConstraint;
@property (weak, nonatomic) IBOutlet UILabel *secondLabelView;
```

##<a name="other"/>其他
###空格
    使用全角的空格显示空格
###任务列表
    使用 \- [ ] 在文字前面就可以添加了 \- [x] 或者\- [1] 
    - [ ] task one
    - [x] task two
- [1] task three
- [] task four
- [ ] task five
- [x] task six
- [1] task seve
  - [ ] first step
  - [ ] second step
- [ ]或者- [1]。看起来

