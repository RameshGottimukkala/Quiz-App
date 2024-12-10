//
//  ViewController.swift
//  Quiz App
//
//  Created by GOTTIMUKKALA RAMESH on 07/12/24.
//

import UIKit

class TaskTableViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var tests = ["Test 1"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName:"TaskCell", bundle: nil), forCellReuseIdentifier: "TaskCell")
    }

}

extension TaskTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tests.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath) as! TaskCell
        cell.testLabel.text = tests[indexPath.row]
        return cell
    }
    
    
}
extension TaskTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        switch indexPath.row {
        case 0:
            if let mathsVC = storyboard?.instantiateViewController(withIdentifier: "MathsQuizViewController") as? MathsQuizViewController {
                navigationController?.pushViewController(mathsVC, animated: true)
            }
        default:
           
            print("No action for this cell.")
        }


        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
