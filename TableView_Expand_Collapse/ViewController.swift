//
//  ViewController.swift
//  TableView_Expand_Collapse
//
//  Created by Appanna Yaragal on 28/05/22.
//

import UIKit

class ViewController: UIViewController {

    var titleListArray : [String] = []
    var detailsListArray : [String] = []
    
    var selectedIndexPath : IndexPath?
    
    //MARK: - ViewController Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        title = "IPL Teams Names"
        
        titleListArray = ["Bengaluru", "Chennai", "Delhi", "Gujarat", "Kolkata", "Lucknow", "Mumbai", "Punjab", "Rajasthan", "Hyderabad"]
        detailsListArray = ["Royal Challengers Bangalore (RCB)", "Chennai Super Kings (CSK)", "Delhi Capitals (DC)", "Gujarat Titans (GT)", "Kolkata Knight Riders (KKR)", "Lucknow Super Giants (LSG)", "Mumbai Indians (MI)", "Punjab Kings (PBKS)", "Rajasthan Royals (RR)", "Sun Risers Hyderabad (SRH)" ]
    }

}

//MARK: - UITableView Delegate & UITableView DataSource Methods
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListTableViewCell", for: indexPath) as! ListTableViewCell
        
        cell.titleLabel.text = titleListArray[indexPath.row]
        cell.detailsLabel.text = detailsListArray[indexPath.row]
        cell.selectionStyle = .none
        
        if let selectedIndex = selectedIndexPath, selectedIndex.row == indexPath.row {
            cell.detailsLabel.isHidden = false
        } else {
            cell.detailsLabel.isHidden = true
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if let selectedIndex = selectedIndexPath, selectedIndex.row == indexPath.row {
            selectedIndexPath = nil
        } else {
            selectedIndexPath = indexPath
        }
        tableView.reloadData()
    }
}
