#JQCustomPickView

by [Joyseedog](http://www.iseedog.com)

## DESCRIPTION ##

[![Screenshot](https://github.com/joyseedog/JQCustomTabbar/blob/master/jqtabbar_gif.gif)](https://github.com/joyseedog/JQCustomTabbar/blob/master)

 * This demo provides a simple way to customizable TabBar for your iOS app.
 * build in xcode8 with ARC.


##USAGE

```
 NSArray *leftArray = [NSArray arrayWithObjects:@"A",@"B",@"C",@"D",@"E", nil];
 NSArray *rightArray =  [NSArray arrayWithObjects:@"AA",@"BB",@"CC",@"DD",@"EE", nil];
    
 JQCustomPicker *jqCustomPicker = [[JQCustomPicker alloc] initWithSelectedBackColor:[UIColor blueColor] textColor:[UIColor whiteColor] plainColor:[UIColor blueColor] title:@"JQ Picker" leftArray:leftArray rightArray:rightArray];
 jqCustomPicker.delegate = self;
 [jqCustomPicker showInView:self.view];

```

##LICENSE
Distributed under the MIT License.

##Contributions
Any contribution is more than welcome! You can contribute through pull requests and issues on GitHub.

#Author

Contact me on my email: joyseedog@gmail.com



