//
//  ProdutoViewController.swift
//  TrabFinal0207
//
//  Created by COTEMIG on 22/09/20.
//  Copyright © 2020 AnaBrendha. All rights reserved.
//

import UIKit

class ProdutoViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var motoArray: [Moto] = []
    
    var stringArray = ["String1", "String2", "String3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        downloadApi()
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
    
    private func downloadApi() {
        let link = URL(string: "https://5f6a2943d808b90016bc0dd3.mockapi.io/Produto")!
        URLSession.shared.dataTask(with: link) { (data, response, error) in
            if let data = data {
                do {
                    let motoApi = try JSONDecoder().decode([Moto].self, from: data)
                    
                    self.motoArray.append(contentsOf: motoApi)
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                    
                } catch {
                    print("Erro de parse")
                }
            }
            }.resume()
        
}
    
    func downloadImage(with url: String, completion: @escaping (UIImage   ) -> ()){
        let link = URL(string: url)!
        URLSession.shared.dataTask(with: link) { (data, response, error) in
            if let data = data {
                let uiImage = UIImage(data: data)
                DispatchQueue.main.async {
                    completion(uiImage)
                }
                
                
            }
            }.resume()    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let produtoViewController = segue.destination as? DetailMotoViewController, let moto = sender as? Moto {
            produtoViewController.moto = moto
        }
    }
}

extension ProdutoViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return motoArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "motoCell", for: indexPath) as? ProdutoViewControllerCell {
            let moto = motoArray[indexPath.row]
            cell.motoTitle.text = moto.title
            cell.motoSubtitulo.text = moto.subtitulo
            cell.motoPreco.text = String(moto.value)
            
            downloadImage(with: moto.image) { (image) in
                cell.motoImage  .image = image
            }
            return cell
        } else {
            fatalError("Não foi possivel convertar a celula.")
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let moto = motoArray[indexPath.row]
        performSegue(withIdentifier: "segueDetail", sender: moto)
    }
}
