//
//  Peca.swift
//  coresEnomes
//
//  Created by Mateus Rodrigues Santos on 24/10/19.
//  Copyright © 2019 Mateus Rodrigues Santos. All rights reserved.
//

import Foundation
import SpriteKit

protocol Peca {
    //MARK:variaveis
    var cor:UIColor{get set}
    var nomeCor:String{get}
    //MARK:funcoes
    func desaparecer()
}
