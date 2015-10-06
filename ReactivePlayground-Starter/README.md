##  纠错
```Objective-C 

 
// 格式错误  
   //    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
//      [[ self.signInService signInWithUsername:self.usernameTextField.text
//                                      password:self.passwordTextField.text
//                                      complete:^(BOOL success) {
//                                          [subscriber sendNext:@(success)];
//                                          [subscriber sendCompleted];
//                                      }];
//       return nil;
//    }];
    
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [self.signInService signInWithUsername:self.usernameTextField.text
                                      password:self.passwordTextField.text complete:^(BOOL success) {
                                          [subscriber sendNext:@(success)];
                                          [subscriber sendCompleted];
                                      }];
        return nil;
    }];
    
````  

*   上面 注释 self.signInService 左边多了一个[  ,后面没有 ],报错
   
*  ** flattenMap  的信号是从内部发往外部的这个要注意, 峰子博客是这么写的**
*  ** 一种信号 编程另一种信号 , 要用 map.**<br>
*  ** 这个地方 注意 返回值 是 RACSignal * 类型**
   
  ========= 
  
  
*  **  注意 这个流 的执行过程中的一些 响应的 链接, 响应过程自然是面向过程的**  
*  **你输错了的话可以再试一次,这个按钮同样在发送网络请求,返回之后是可点的了.self.signInButton.enabled = YES;这个源代码是加了的,**
   	 
```Objective-C  

    [[[[self.signInButton rac_signalForControlEvents:UIControlEventTouchUpInside] doNext:^(id x) {
        self.signInButton.enabled = NO;
        self.signInFailureText.hidden = YES;
    }] flattenMap:^RACStream *(id value) {
        return [self signInSignal];
    }] subscribeNext:^(id x) {    
       self.signInButton.enabled = YES;
        BOOL success = [x boolValue];
        self.signInFailureText.hidden = success;
        if (success) {
            [self  performSegueWithIdentifier:@"signInSuccess" sender:self];
        }
    }];

    
``` 