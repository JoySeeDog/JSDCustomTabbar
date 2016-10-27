自定义了一个类似类似咸鱼的TabBar，又加了一个蛋疼的需求在里面。

UI设计了一个很有趣的需求。就是在TabBar点击的时候，下面的文字需要变成一个图片。具体看图片，就是红色箭头这里。
[![Screenshot](https://github.com/joyseedog/JQCustomTabbar/blob/master/tab.png)](https://github.com/joyseedog/JQCustomTabbar/blob/master)

##年轻的想法
有的开发者可能会想，TabBar自定义太麻烦了，美工改设计吧。有的可能会想，让美工切一个很大的图。不就可以直接覆盖了吗。道理并没有错。不过写代码还是需要有一点追求嘛。

##网上资料
网上很多资料都主要是自定义了中间那个圆形的按钮，而且大部分还是使用了比较复杂的方法，重写了TabBar，代码也很多，看着就觉得头晕。所以索性还是自己琢磨琢磨。

##基本思路
###圆形按钮
中间那个圆形的按钮，我们只需要在Tabbar上面再加一个Button不就好了。

```
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2-37.5 , -15, 75, 75)];
    
    button.layer.cornerRadius = 37.5;
    button.layer.masksToBounds = YES;
    
    [button setBackgroundColor:[UIColor purpleColor]];
    button.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [button setImage:[UIImage imageNamed:@"main_live"] forState:UIControlStateNormal];
    [self.tabBar addSubview:button];
    [self.tabBar bringSubviewToFront:button];
    [button addTarget:self action:@selector(selectImagePicker) forControlEvents:UIControlEventTouchUpInside];
```

###选中之后的小半圆
一开始的思路打算选中的时候替换文本。这个可以在在`UITabBarControllerDelegate`的代理方法里实现，可是要打出来那个半圆形的字符还是有点难。

然后想到的是在上面加`ImageView`的方式进行解决，怎么加又是一个问题，因为需要和选中的状态联动起来。还有就是加到哪里，总不能自己去算位置。于是我看了一下`TabBar`的图层结构，我们可以使用它下面的子视图来定位计算我们的`ImageView`要加到哪里。

```
 for (UIView *UITabBarButton in self.tabBar.subviews) {
     
        if ([@"UITabBarButton" isEqualToString:NSStringFromClass([UITabBarButton class])]) {
          
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(UITabBarButton.frame.origin.x+UITabBarButton.frame.size.width/2-5, UITabBarButton.frame.origin.y+UITabBarButton.frame.size.height-5, 10, 5)];
            imageView.image = [UIImage imageNamed:@"main_point"];
            [self.tabBar addSubview:imageView];
                   }
    }
```

另外一个问题就是如何在选中Tab的时候，隐藏文字显示小半圆呢，我的做法是定义了一个数组用来存储`imageView`然后在代理方法里面进行隐藏和显示的处理。

```
for (int i = 0; i<self.jqTabBarViewController.customSelectViews.count;i++) {
        UIImageView *imageView = [self.jqTabBarViewController.customSelectViews objectAtIndex:i];
        if (i == self.jqTabBarViewController.selectedIndex) {
            imageView.hidden = NO;
        }else {
            imageView.hidden = YES;
        }
    }
```
最后的效果如下：
[![Screenshot](https://github.com/joyseedog/JQCustomTabbar/blob/master/jqtabbar_gif.gif)](https://github.com/joyseedog/JQCustomTabbar/blob/master)

##待改进
需要改进的是中间那个点击区域的范围。超出TabBar的区域不能点击，我看了咸鱼还有一些应用有这个问题。解决的方式就是自定义一个TabBar，这样我也试过，不过这样下面那个半圆的选中按钮就会出问题，不能两者都达到要求。如果有好的思路可以给我留言。






