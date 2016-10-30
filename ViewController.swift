//
//  ViewController.swift
//  timeTranslate
//
//  Created by syh on 16/10/30.
//  Copyright © 2016年 pengma. All rights reserved.
//

import UIKit
class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
   
    let str = "1476425186115"
    let translateTime = TranslateTime()
    let timeStr =
    translateTime.dateStringWithTimeStampAndFormatString(str, formatString: "YYYY:MM:dd HH:mm:ss")
    print(timeStr)
    let date = NSDate()
    let time = translateTime.dateStringWithDateAndFormatStr(date, formatStr: "YYYY:MM:dd HH:mm:ss")
    print(time)
    let timeString = "2016:10:30 15:16:03"
    let timeDate = translateTime.dateWithDateStringAndFormatterStr(timeString, formatStr: "YYYY:MM:dd HH:mm:ss")
    print(timeDate)
    
    
    
    
  }

 


}

