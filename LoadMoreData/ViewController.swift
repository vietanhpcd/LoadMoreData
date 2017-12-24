//
//  ViewController.swift
//  LoadMoreData
//
//  Created by Anhdzai on 12/21/17.
//  Copyright © 2017 Anhdzai. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var array = [Int](0...20)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "index", for: indexPath)
        cell.textLabel?.text = String(array[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastItem = array.count - 1
        print("\(indexPath) && \(lastItem)")
        if indexPath.row == lastItem {
            loadMoreData()
        }
    }
    func loadMoreData() {
        for _ in 1...2 {
            let lastItem = array.last
            let newNum = lastItem! + 1
            array.append(newNum)
        }
        tableView.reloadData()
    }
}

