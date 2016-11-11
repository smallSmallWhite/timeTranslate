//
//  ViewController.swift
//  QrCodeScan
//
//  Created by syh on 16/11/8.
//  Copyright © 2016年 pengma. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationItem.title = "二维码"
    self.view.backgroundColor = UIColor.whiteColor()
    
    let qrCode = CustomQRCode()
    let customQrcode = qrCode.generateCustomQRCodeAndSize("马鹏 18291820539", size: 250, touxiangImage: "xinxin10.jpg")
    let imageView = UIImageView(frame: CGRectMake(0, 0, 250, 250))
    
    imageView.center = self.view.center
    imageView.image = customQrcode
    self.view.addSubview(imageView)
    
    
  }
  
  
  
  
 

 
}

