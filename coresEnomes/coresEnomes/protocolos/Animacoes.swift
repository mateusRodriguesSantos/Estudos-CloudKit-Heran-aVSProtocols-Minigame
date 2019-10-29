//
//  Animacoes.swift
//  coresEnomes
//
//  Created by Mateus Rodrigues Santos on 24/10/19.
//  Copyright © 2019 Mateus Rodrigues Santos. All rights reserved.
//

import Foundation
import SpriteKit

protocol Animacoes {
    //MARK:Variaveis
    
    //MARK:Funcoes
    func moverPeca() -> SKAction
    
    func spawnPecas(scene:SKScene) 
    
    func spawn(scene:SKScene) ->SKAction

}
