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
    
   //  上面 注释 self.signInService 左边多了一个[  ,后面没有 ],报错
   
   //## flattenMap  的信号是从内部发往外部的这个要注意, 峰子博客是这么写的
   
   // ## 一种信号 编程另一种信号 , 要用 map.
   

    
``` 