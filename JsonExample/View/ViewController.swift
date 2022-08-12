//
//  ViewController.swift
//  JsonExample
//
//  Created by Manish on 10/08/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tblView: UITableView!
    var viewModel = UserViewModel()
    var userData = [UserModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }

    func loadData(){
        viewModel.getAllUserDetails { response in
            self.userData = response
            DispatchQueue.main.async {
                self.tblView.reloadData()
            }
        }
    }
}

extension ViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.userData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblView.dequeueReusableCell(withIdentifier: "Cell") as! UserTableCell
        cell.lblName.text = userData[indexPath.row].title
        return cell
    }
}
