//
//  Moto.swift
//  TrabFinal0207
//
//  Created by COTEMIG on 29/09/20.
//  Copyright © 2020 AnaBrendha. All rights reserved.
//

import UIKit

class Moto: UIViewController {

    struct Moto: Codable {
    public let name: String
    public let preco: Double
    public let subtitulo: String
    public let image: String

    enum CodingKeys: String, CodingKey {
    case name = "nome"
    case preco = "preco"
    case subtitulo = "subtitulo"
    case image
    }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

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
