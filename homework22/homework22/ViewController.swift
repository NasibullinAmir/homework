//
//  ViewController.swift
//  homework22
//
//  Created by karim on 07.07.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var tableView:UITableView!
    var data: [ContactsListTableViewData] = [
            ContactsListTableViewData(name: "amir", number: "89083245250"),
            ContactsListTableViewData(name: "savage", number: "89082345230"),
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let name = data[indexPath.row].name
            let number = data[indexPath.row].number
            guard let ViewController = storyboard?.instantiateViewController(withIdentifier: "AutorizationViewController") as? ViewController else { return }

            ViewController.loadViewIfNeeded()
            navigationController?.pushViewController(ViewController, animated: true)
        }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ListTableViewCell") as? ListTableViewCell
        else { return UITableViewCell() }

        cell.setPersonalInfo(data[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            100
        }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }

    @IBAction func addNewContactButtonDidTap(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(identifier: "AutorizationViewController") else {return}
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

