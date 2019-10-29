//
//  Hanking.swift
//  coresEnomes
//
//  Created by Mateus Rodrigues Santos on 24/10/19.
//  Copyright © 2019 Mateus Rodrigues Santos. All rights reserved.
//

import Foundation

protocol Hanking {
    //MARK:variables
    var Jogadores:[Jogador]{get set}
    //MARK:funcoes
    func montarScore() -> [String:Int]
}
