//
//  ViewController.swift
//  TrabFinal0207
//
//  Created by COTEMIG on 21/09/20.
//  Copyright © 2020 AnaBrendha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var userText: UITextField!

    @IBOutlet weak var senhaText: UITextField!
    
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func login(_ sender: Any) {
        //let user = userText.text
        //let password = senhaText.text
        
        //if user == "admin" && password == "123"{
            //performSegue(withIdentifier: "segueLogin", sender: nil)
        //}else {
          //  let alert = UIAlertController(title: "Erro", message: "usuario ou senha invalido", preferredStyle: .alert)
            //alert.addAction(UIAlertAction(title: "Ok", style: .default))
            //present(alert, animated: true)
        //}
        
        if let user = userText.text {
            if let password = senhaText.text {
                fazerLogin(user: user, password: password)
            }
        }
    }
    
    private func fazerLogin(user: String, password: String) {
        let parameters: [String: String] = [
            "user": user,
            "password": password,
        ]
        
        var urlRequest = URLRequest(url: URL(string: "https://5f6a2943d808b90016bc0dd3.mockapi.io/usuario")!)
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpMethod = "POST"
        let body = try? JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
        urlRequest.httpBody = body
        
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let data = data {
                guard let _ = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) else { return }
                DispatchQueue.main.async {
                    UserDefaults.standard.set(true, forKey: "user")
                    self.performSegue(withIdentifier: "segueLogin", sender: nil)
                }
            }
            }.resume()
    }
    
}

struct Login: Codable{
    let user: String
    let password: String
}

