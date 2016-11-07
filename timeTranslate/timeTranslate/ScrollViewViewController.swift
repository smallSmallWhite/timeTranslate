//
//  ScrollViewViewController.swift
//  timeTranslate
//
//  Created by syh on 16/11/5.
//  Copyright © 2016年 pengma. All rights reserved.
//

import UIKit
let screenW = UIScreen.mainScreen().bounds.size.width
let screenH = UIScreen.mainScreen().bounds.size.height
class ScrollViewViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,iCarouselDelegate,iCarouselDataSource {

  var tableView:UITableView!
  var icarousel:iCarousel!
  var timer:NSTimer!
  var imagesArray:NSMutableArray!//存放图片的数组
    override func viewDidLoad() {
        super.viewDidLoad()
      self.imagesArray = ["2-150521105400.png","51ebb215a.png","6358900stacksfly.png","xinxin1.jpg","xinxin2.jpg","xinxin3.jpg","xinxin4.jpg","xinxin5.jpg","xinxin6.jpg"]
      initTableView()
      initHeaderView()

      
    }
  //MARK:init tableView
  func initTableView()  {
    
    tableView = UITableView.init(frame: CGRectMake(0, 0, screenW, screenH))
    tableView.delegate = self
    tableView.dataSource = self
    tableView.separatorStyle = .None
    self.view.addSubview(tableView)
  }
  //MARK:init tableView-HearderView
  func initHeaderView() {
    
    icarousel = iCarousel.init(frame: CGRectMake(0, 0, screenW, 150))
    icarousel.type = .InvertedTimeMachine
    icarousel.bounces = true
    icarousel.delegate = self
    icarousel.dataSource = self
    self.tableView.tableHeaderView = icarousel
    self.timer = NSTimer.scheduledTimerWithTimeInterval(2, target: self, selector: #selector(ScrollViewViewController.timerAction), userInfo: nil, repeats: true)
    
  }
  //MARK:tableView dataSource
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 15
  }
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
    tableView.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: "CELL")
    let cell = tableView.dequeueReusableCellWithIdentifier("CELL", forIndexPath: indexPath)
    cell.textLabel?.text = "测试数据"
    cell.selectionStyle = .None
    return cell
  }
  //MARK:iCarousel dataSource
  func numberOfItemsInCarousel(carousel: iCarousel) -> Int {
    
    return self.imagesArray.count
  }
  func carousel(carousel: iCarousel, viewForItemAtIndex index: Int, reusingView view: UIView?) -> UIView {
    
    let imageView = FXImageView(frame: CGRectMake(100, 100, 200, 200))
    imageView.image = UIImage(named: String(format: "%@", (imagesArray[index] as? String)!))
    imageView.contentMode = .ScaleAspectFit
    imageView.asynchronous = true
    imageView.reflectionScale = 0.5
    imageView.reflectionAlpha = 0.25
    imageView.reflectionGap = 10.0
    imageView.shadowOffset = CGSizeMake(0.0, 2.0)
    imageView.shadowBlur = 5.0
    return imageView
  }
  //MARK:timer
  func timerAction()  {
    
    var index = icarousel.currentItemIndex
    index = index + 1
    if index == self.imagesArray.count + 1 {
      //最后一张图片的时候，跳转到第一张
      index = 0
    }
    self.icarousel.scrollToItemAtIndex(index, animated: true)

  }

}
