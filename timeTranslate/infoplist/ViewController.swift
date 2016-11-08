//
//  ViewController.swift
//  infoplist
//
//  Created by syh on 16/11/8.
//  Copyright © 2016年 pengma. All rights reserved.
//

import UIKit
let screenW = UIScreen.mainScreen().bounds.size.width
let screenH = UIScreen.mainScreen().bounds.size.height
class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

  var tableView:UITableView!
  var dataSource:NSMutableArray = []
  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationItem.title = "地区"
//    let path = NSBundle.mainBundle().pathForResource("CareerList", ofType: "plist")
//    let data1 = NSMutableArray.init(contentsOfFile: path!)
//    for i in 0..<data1!.count {
//      
//      let array = data1![i].objectForKey("通用岗位")
//      let array1 = data1![i].objectForKey("服务业")
//      let array2 = data1![i].objectForKey("工业制造")
//      let array3 = data1![i].objectForKey("政府组织")
//       let array4 = data1![i].objectForKey("医疗生物")
//       let array5 = data1![i].objectForKey("教育培训")
//       let array6 = data1![i].objectForKey("金融")
//       let array7 = data1![i].objectForKey("文化传媒")
//       let array8 = data1![i].objectForKey("IT互联网")
//       dataSource.addObject(array!)
//      
//    }
    
    
    
    
    
    
    
    
    
    //获取文件路径
    let filePath = NSBundle.mainBundle().pathForResource("PropertyList", ofType: "plist")
    let data = NSMutableArray.init(contentsOfFile: filePath!)
    for i in 0..<data!.count {
      
      let area_name = data![i].objectForKey("area_name")
      dataSource.addObject(area_name!)
      
    }
    initTableView()
    
    
  }

  //init
  func initTableView()  {
    
    tableView = UITableView(frame: CGRectMake(0, 0,screenW, screenH))
    tableView.delegate = self
    tableView.dataSource = self
    tableView.separatorStyle = .None
    self.view.addSubview(tableView)
  }
  //tableView delegate  dataSource
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.dataSource.count
  }
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
    tableView.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: "CELL")
    let cell = tableView.dequeueReusableCellWithIdentifier("CELL", forIndexPath: indexPath)
    cell.textLabel?.text = dataSource[indexPath.row] as? String
    cell.selectionStyle = .None
    return cell
  }

}

