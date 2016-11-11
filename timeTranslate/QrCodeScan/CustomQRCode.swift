//
//  CustomQRCode.swift
//  timeTranslate
//
//  Created by syh on 16/11/8.
//  Copyright © 2016年 pengma. All rights reserved.
//

import UIKit
import AVFoundation
                                                                                                                   
class CustomQRCode: UIImageView {
  
  func generateCustomQRCodeAndSize(string:String,size:CGFloat,touxiangImage:String) -> UIImage {
    
    let qrcode = self.createNonInterpolatedUIImageFromCIImageWithSize(self.createQRForString(string), size: size)
    let imageView = UIImageView()
    let image = UIImage(named:touxiangImage)
    imageView.image = image
    self.image = addImageLogo(qrcode, logoImg:imageView.image!, logoSize: CGSizeMake(30, 30))
    return self.image!
//    return qrcode
  }
  
  func createNonInterpolatedUIImageFromCIImageWithSize(image:CIImage,size:CGFloat) -> UIImage {
    
    let extent = CGRectIntegral(image.extent)
    let scale = min(size/CGRectGetWidth(extent),size/CGRectGetHeight(extent))
    let width = CGRectGetWidth(extent) * scale
    let height = CGRectGetHeight(extent) * scale
    let cs = CGColorSpaceCreateDeviceGray()
    let bitmapRef = CGBitmapContextCreate(nil, Int(width), Int(height), 8, 0, cs, CGImageAlphaInfo.None.rawValue)
    let context = CIContext(options: nil)
    let bitmapImage = context.createCGImage(image, fromRect: extent)
    let quality = CGInterpolationQuality(rawValue: CGInterpolationQuality.None.rawValue)
    CGContextSetInterpolationQuality(bitmapRef, quality!);
    CGContextScaleCTM(bitmapRef, scale, scale);
    CGContextDrawImage(bitmapRef, extent, bitmapImage);
    // Create an image with the contents of our bitmap
    let scaledImage = CGBitmapContextCreateImage(bitmapRef);
    // Cleanup
    return UIImage.init(CGImage: scaledImage!)
  }
  
  func createQRForString(qrString:String) -> CIImage {
    
    let stringData = qrString.dataUsingEncoding(NSUTF8StringEncoding)
    // Create the filter
    let qrFilter = CIFilter(name: "CIQRCodeGenerator")
    // Set the message content and error-correction level
    qrFilter?.setValue(stringData, forKey: "inputMessage")
    qrFilter?.setValue("M", forKey: "inputCorrectionLevel")
    // Send the image back
    return qrFilter!.outputImage!;
  }
  
  /**
   @brief  图像中间加logo图片
   @param srcImg    原图像
   @param LogoImage logo图像
   @param logoSize  logo图像尺寸
   @return 加Logo的图像
   */
  private   func addImageLogo(srcImg:UIImage,logoImg:UIImage,logoSize:CGSize )->UIImage
  {
    UIGraphicsBeginImageContext(srcImg.size);
    srcImg.drawInRect(CGRectMake(0, 0, srcImg.size.width, srcImg.size.height))
    let rect = CGRectMake(srcImg.size.width/2 - logoSize.width/2, srcImg.size.height/2-logoSize.height/2, logoSize.width, logoSize.height);
    logoImg.drawInRect(rect)
    let resultingImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return resultingImage
  }
}
