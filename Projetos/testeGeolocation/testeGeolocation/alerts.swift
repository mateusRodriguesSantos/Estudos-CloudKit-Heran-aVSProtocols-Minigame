//
//  alerts.swift
//  testeGeolocation
//
//  Created by Mateus Rodrigues Santos on 10/10/19.
//  Copyright © 2019 Mateus Rodrigues Santos. All rights reserved.
//

import Foundation
import UIKit

let alert1 = UIAlertController(title: "ERRO!!!", message: "Ocorreu um erro ao tentar acessar sua localização.", preferredStyle: .alert)
let opAlerta1 = UIAlertAction(title: "Sair", style: .default) { (ok) in
    print("Erro1")
}

let alert2 = UIAlertController(title: "ERRO!!!", message: "Seu device não suporta localização.", preferredStyle: .alert)
let opAlerta2 = UIAlertAction(title: "Sair", style: .default) { (ok) in
    print("Erro2")
}
