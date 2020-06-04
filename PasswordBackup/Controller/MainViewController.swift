//
//  MainViewController.swift
//  PasswordBackup
//
//  Created by Marie-Ange Coco on 07/05/2020.
//  Copyright © 2020 Marie-Ange Coco. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    var credentialsCollection: [Credentials] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FireDB().getCredentialsCollection { (credentialsCollection, error) in
            if let error = error {
                self.presentAlert(title: "error", message: error)
                return
            }
            guard let credentialsCollection = credentialsCollection else {
                self.presentAlert(title: "error", message: "Erreur indéterminée")
                return
            }
            self.credentialsCollection = credentialsCollection
            self.tableView.reloadData()
        }

        // Do any additional setup after loading the view.
       
    }
    
    @IBAction func logoutBtnDidPressed(_ sender: Any) {
        if let error = FireAuth().signOut() {
           let alertVC = UIAlertController(title: "Erreur !", message: error, preferredStyle: .alert)
           alertVC.addAction(UIAlertAction(title: "J’ai compris", style: .default, handler: nil))
           present(alertVC, animated: true, completion: nil)
           return
       }
       navigationController?.popViewController(animated: true)
        print("DECONNEXION")
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
//    func presentAlert(title: String, message: String) {
//             let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
//             alertVC.addAction(UIAlertAction(title: "J’ai compris", style: .default, handler: nil))
//             present(alertVC, animated: true, completion: nil)
//         }
}

extension MainViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return credentialsCollection.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "credentialsCell", for: indexPath)
        cell.textLabel?.text = credentialsCollection[indexPath.row].title
        return cell
    }
}
