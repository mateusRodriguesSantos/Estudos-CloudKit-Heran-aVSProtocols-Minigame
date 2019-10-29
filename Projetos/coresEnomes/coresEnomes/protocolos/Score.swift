//
//  Score.swift
//  coresEnomes
//
//  Created by Mateus Rodrigues Santos on 24/10/19.
//  Copyright © 2019 Mateus Rodrigues Santos. All rights reserved.
//

import Foundation

protocol Score {
    //MARK:variaveis
    var acertos:Int{get set}
    var erros:Int{get set}
    //MARK:funcoes
    mutating func contarAcertos()
    mutating func contarErros()
}
