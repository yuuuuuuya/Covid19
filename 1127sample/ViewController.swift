//
//  ViewController.swift
//  1127sample
//
//  Created by 伊島　悠矢 on 2020/11/27.
//  Copyright © 2020 伊島　悠矢. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

struct covid19 {
    var isShown: Bool
    var area: String
    var todoufukenName: [String]
}



class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var myTableView: UITableView!
    
    let areaArray: [String] = ["北海道", "東北", "関東", "中部", "近畿", "中国", "四国", "九州"]
    let todoufukenName: [String] = ["a","b"]
    var tableViewArray: [covid19]!
    /// インジケーター
       private let indicator = UIActivityIndicatorView()
    /// プレゼンター
       private var presenter = AreaListPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myTableView.delegate = self
        myTableView.dataSource = self
        
        tableViewArray = [
            covid19(isShown: true, area: areaArray[0], todoufukenName: todoufukenName),
            covid19(isShown: false, area: areaArray[1], todoufukenName: todoufukenName)
        ]
    
    }
    
    func tuushinAPI() {
        ///インジケーター開始
        self.indicator.startAnimating()
        ///API通信開始
        presenter.communicationAPI(
            sucsess: {
            self.myTableView.reloadData()
            self.indicator.stopAnimating()
            }
        )
    }
    
    //セクションの数
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewArray.count
    }
    
    //セクションのタイトル名
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return tableViewArray[section].area
    }
    
    //セクションをカスタマイズ
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UITableViewHeaderFooterView()
        let gesturer = UITapGestureRecognizer(target: self, action: #selector(touch(sender:)))
        header.addGestureRecognizer(gesturer)
        header.tag = section
        return header
    }
    
    //セクションをタップ
    @objc func touch(sender: UITapGestureRecognizer) {
        guard let section = sender.view?.tag else{
            return
        }
        
        tableViewArray[section].isShown.toggle()
        
        myTableView.beginUpdates()
        myTableView.reloadSections([section], with: .automatic)
        myTableView.endUpdates()
    }
    
    //セルの数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableViewArray[section].isShown{
            return tableViewArray[section].todoufukenName.count
        }else{
            return 0
        }
    }
    
    //セルの内容
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = tableViewArray[indexPath.section].todoufukenName[indexPath.row]
        return cell
    }
   
}
