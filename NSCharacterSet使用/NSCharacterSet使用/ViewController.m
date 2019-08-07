//
//  ViewController.m
//  NSCharacterSet使用
//
//  Created by mac on 2019/8/7.
//  Copyright © 2019 iOS. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSString * testString = @"   this is the string contains whitespace in beginnig and ending.  ";
//  1.  去掉首尾空格
    NSString * whitesspaceStr = [testString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
//    NSLog(@"去掉首尾空格==%@",whitesspaceStr);
    
//    2.   用指定字符串替代当前字符中的指定字符集中的字符串
    NSMutableCharacterSet *  letter  = [NSMutableCharacterSet lowercaseLetterCharacterSet];
    NSCharacterSet * decimalDigit = [NSCharacterSet decimalDigitCharacterSet];
    
    [letter formUnionWithCharacterSet:decimalDigit];
    NSString * string2 = @"g8!hgr3@09#23uiq%^78sjn453t78&13gesg*wt53(545y45)q3at";
    
//    NSLog(@"1===%@",[[string2 componentsSeparatedByCharactersInSet:letter] componentsJoinedByString:@"_"]);
    [letter invert];

//     NSLog(@"2===%@",[[string2 componentsSeparatedByCharactersInSet:letter] componentsJoinedByString:@"_"]);
    
    
    
//   3.  去除所有空格
    NSString * string3 = @" a b cd ef gh ij kml nopq rstu v w x y z";
//    NSLog(@"去除空格=%@",[[string3 componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] componentsJoinedByString:@""]);
    

    
//    4将string转化成array 和array转换成string
    NSString * string4 = @"asdfg";
  NSArray * array4 =   [string4 componentsSeparatedByString:@","];
//    NSLog(@"转化成数组==%@",array4);
    
  NSString * string41 =   [array4 componentsJoinedByString:@","];
//    NSLog(@"数组转化成字符串%@",string41);
    
    
    
//5.  判断字符串是否只包含数字
   BOOL isnum =  [self validateNumber:@"123"];
    
    if (isnum) {
        NSLog(@"只包含数字");
    }else{
        NSLog(@"不仅只有数字");
    }
    
    
      NSString *str = @"今天我们来学习NSCharacterSet我们快乐";
     NSString *str1 = @"我s今";
//    NSMutableString * muStr = [[NSMutableString alloc]init];
//    for (int i =0; i < str.length; i ++) {
//      NSString * indexStr =  [str substringWithRange:NSMakeRange(i, 1)];
//        if (![str1 containsString:indexStr]) {
//            [muStr appendString:indexStr];
//        }
//
//    }
//
//    NSLog(@"拼接==%@",muStr);
    
    NSCharacterSet * characterSet = [NSCharacterSet characterSetWithCharactersInString:@"我s今"];
   NSArray * arr1 =  [str componentsSeparatedByCharactersInSet:characterSet];
    
   NSString * string6 = [arr1 componentsJoinedByString:@""];
    NSLog(@"string6==%@",string6);
    
//    新添加的内容
    
}
//  5.  判断字符串是否只包含数字
- (BOOL)validateNumber:(NSString *)number{
    BOOL res = YES;
    NSCharacterSet * tmSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
    int i =0;
    while (i < number.length) {
        
        NSString * string5 = [number substringWithRange:NSMakeRange(i, 1)];
        NSRange range = [string5 rangeOfCharacterFromSet:tmSet];
        if (range.length == 0) {
            NSLog(@"查看");
            res = NO;
            break;
        }
       i ++;
    }
    
    return res;
}


@end
