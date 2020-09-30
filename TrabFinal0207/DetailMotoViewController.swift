//
//  DetailMotoViewController.swift
//  TrabFinal0207
//
//  Created by COTEMIG on 29/09/20.
//  Copyright © 2020 AnaBrendha. All rights reserved.
//

import UIKit

class DetailMotoViewController: UIViewController {

    @IBOutlet weak var detailTableView: UITableView!
    var moto: moto?
    var motoDetails: [String] = ["Cor", "Marca", "Assento de couro", "Motor"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailTableView.dataSource = self
        detailTableView.isScrollEnabled = false
        detailTableView.allowsSelection = false
        
        if let moto = moto {
            print(moto)
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension DetailMotoViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return motoDetails.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = motoDetails[indexPath.row]
        cell.textLabel?.numberOfLines = 0
        return cell
    }
}
