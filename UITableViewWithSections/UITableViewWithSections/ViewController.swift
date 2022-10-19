//
//  ViewController.swift
//  UITableViewWithSections
//
//  Created by mahendran-14703 on 18/10/22.
//

import UIKit


class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var tableView = UITableView()
    
    let tableViewData = [
        ["1","2","3","4","5"],
        ["1","2","3","4","5"],
        ["1","2","3","4","5"],
        ["1","2","3","4","5"],
        ["1","2","3","4","5"],
    ]
    
    let alphabets = ["A","B","C","D","E"]
    
    var hiddenSections: Set<Int> = [0,1,2,3,4]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tableView.frame = view.bounds
        tableView.backgroundColor = .black
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if hiddenSections.contains(section) {
            return 0
        }
        
        return tableViewData[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .black
        cell.textLabel?.textColor = .white
        cell.textLabel?.text = tableViewData[indexPath.section][indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionButton = UIButton()
        sectionButton.setTitle(alphabets[section], for: .normal)
        sectionButton.backgroundColor = .black
        sectionButton.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        sectionButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0)
        sectionButton.layer.cornerRadius = 3
        sectionButton.tag = section
        
        sectionButton.addTarget(self, action: #selector(self.hideSection(sender: )), for: .touchUpInside)
        return sectionButton
    }
    
    @objc
    private func hideSection(sender: UIButton) {
        let section = sender.tag
    
        func indexPathsForSection() -> [IndexPath] {
            var indexPaths = [IndexPath]()
            
            for row in 0..<self.tableViewData[section].count {
                indexPaths.append(IndexPath(row: row,
                                            section: section))
            }
            
            return indexPaths
        }
        
        if self.hiddenSections.contains(section) {
            self.hiddenSections.remove(section)
            self.tableView.insertRows(at: indexPathsForSection(),
                                      with: .fade)
        } else {
            self.hiddenSections.insert(section)
            self.tableView.deleteRows(at: indexPathsForSection(),
                                      with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 25.0
    }
}


        


