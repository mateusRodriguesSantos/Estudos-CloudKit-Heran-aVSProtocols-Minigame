//
//  JogadorCT.swift
//  coresEnomes
//
//  Created by Mateus Rodrigues Santos on 24/10/19.
//  Copyright © 2019 Mateus Rodrigues Santos. All rights reserved.
//

import Foundation

struct JogadorCT:Jogador,Score{

    var nome: String
    
    var pontos: Int
    
    var acertos: Int
    
    var erros: Int

    mutating func contarAcertos() {
        acertos = acertos + 1
    }
    
    mutating func contarErros() {
        erros = erros + 1
    }
    
    init(nome:String,pontos:Int,acertos:Int,erros:Int) {
        self.nome = nome
        self.pontos = pontos
        self.acertos = acertos
        self.erros = erros
    }
    
    
}
