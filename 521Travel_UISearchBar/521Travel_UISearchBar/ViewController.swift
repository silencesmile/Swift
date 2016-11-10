//
//  ViewController.swift
//  521Travel_UISearchBar
//
//  Created by youngstar on 16/11/3.
//  Copyright © 2016年 521Travel.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {

    var tableView:UITableView!
    var array:[String] = Array()
    var resultArray:[String] = Array()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let searchBar = UISearchBar()
        searchBar.frame = CGRect(x:0, y:20, width:375, height:30)
        searchBar.showsCancelButton = true
        searchBar.delegate = self
        self.view .addSubview(searchBar)
        
        tableView = UITableView()
        tableView.frame = CGRect(x:0, y:50, width:375, height:600)
        tableView.delegate = self
        tableView.dataSource = self
        self.view .addSubview(tableView)
        tableView.tableFooterView = UIView()
        
        tableView .register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        array = ["UILabel", "UIButton", "UITableView", "UISearchBar", "UIImage", " UITextField", "UITextView", "521Travel.com"]
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "cell"
        let cell = UITableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: identifier)
        
        cell.textLabel?.text = resultArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("选中的为：\(resultArray[indexPath.row])")
    }
    
    // delete的处理事件
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("searchText:\(searchText)")
        resultArray = Array()
        if searchText == "" {
            resultArray = array
        }
        else
        {
            for str in array {
                if str.contains(searchText) {
                    resultArray.append(str)
                }
            }
        }
        tableView.reloadData()
    }

    // 点击取消按钮处理事件
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = nil
        resultArray = Array()
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

