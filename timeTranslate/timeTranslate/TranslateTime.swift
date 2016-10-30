//
//  TranslateTime.swift
//  timeTranslate
//
//  Created by syh on 16/10/30.
//  Copyright © 2016年 pengma. All rights reserved.
//

import UIKit

class TranslateTime: NSObject {
  
  /*
  G: 公元时代，例如AD公元
  yy: 年的后2位
  yyyy: 完整年
  MM: 月，显示为1-12
  MMM: 月，显示为英文月份简写,如 Jan
  MMMM: 月，显示为英文月份全称，如 Janualy
  dd: 日，2位数表示，如02
  d: 日，1-2位显示，如 2
  EEE: 简写星期几，如Sun
  EEEE: 全写星期几，如Sunday
  aa: 上下午，AM/PM
  H: 时，24小时制，0-23
  K：时，12小时制，0-11
  m: 分，1-2位
  mm: 分，2位
  s: 秒，1-2位
  ss: 秒，2位
  S: 毫秒
  */
  //NSDate转时间戳
  func timeStampWithDate(date:NSDate) -> String {
    
    let timeStamp = String(format:"%ld",date.timeIntervalSinceDate(date))
    return timeStamp
  }
  
  /**
   //时间戳转化为时间的方法
   
   - parameter timeStamp:    要转换的时间
   - parameter formatString: 要转换的时间格式 例如：YYYY:MM:dd HH:mm:ss
   hh与HH的区别:分别表示12小时制,24小时制
   
   - returns: 返回值
   */
  //Objective-C的时间戳与java的时间戳相差1000倍，用java的时间戳除以1000即可Objective-C的时间戳
  func dateStringWithTimeStampAndFormatString(timeStamp:String,formatString:String) -> String {
    
    let string = NSString(string: timeStamp)
    let timeInterval = string.doubleValue
    let time = timeInterval/1000
    let formatter = NSDateFormatter()
    formatter.dateFormat = formatString
    let timeDate = NSDate.init(timeIntervalSince1970: time)
    let dateStr = formatter.stringFromDate(timeDate)
    return dateStr
    
  }
 
  /**
    //格式化NSDate  即将NSDate格式转换为字符串类型的时间输出
   
   - parameter date:      要转换的时间
   - parameter formatStr: 需要转换的格式  例如：YYYY:MM:dd HH:mm:ss
   hh与HH的区别:分别表示12小时制,24小时制
   
   - returns: 返回值
   */
  func dateStringWithDateAndFormatStr(date:NSDate,formatStr:String) -> String {
    
    let dateFormatter = NSDateFormatter()
    dateFormatter.dateFormat = formatStr
    let dateStr = dateFormatter.stringFromDate(date)
    return dateStr
  }
  
  /**
   //将时间字符串转换为NSDate格式
   
   - parameter dateStr:   要转换的时间  类型为NSDate
   - parameter formatStr: 格式化的格式，注意：这里的格式一定要和传入的时间字符串的格式一致，否则无法进行转换
   
   - returns: 返回值
   */
  func dateWithDateStringAndFormatterStr(dateStr:String,formatStr:String) -> NSDate {
    
    let dateFormatter = NSDateFormatter()
    dateFormatter.dateFormat = formatStr
    let timeDate = dateFormatter.dateFromString(dateStr)
    return timeDate!
    
  }

}
