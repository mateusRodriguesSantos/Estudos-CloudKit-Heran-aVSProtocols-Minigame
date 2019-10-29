//Herança

class Athlete{
    var idade:Int
    var nome:String
    
    init(idade:Int,nome:String) {
        self.idade = idade
        self.nome = nome
    }
    
    func correr() -> Bool {
        return true
    }
}

class Amateur:Athlete{
    var time:String
    var anoEmAcao:Int
    
    init(idade:Int,nome:String,time:String,anoEmAcao:Int) {
        self.time = time
        self.anoEmAcao = anoEmAcao
        super.init(idade: idade, nome: nome)
    }
}

class AmFootballPlayer:Amateur{
    override init(idade: Int, nome: String, time: String, anoEmAcao: Int) {
        super.init(idade: idade, nome: nome, time: time, anoEmAcao: anoEmAcao)
    }
    
    override func correr() -> Bool {
        return true
    }
}

class AmBaseballPlayer:Amateur{
    override init(idade: Int, nome: String, time: String, anoEmAcao: Int) {
        super.init(idade: idade, nome: nome, time: time, anoEmAcao: anoEmAcao)
    }
    
    override func correr() -> Bool {
        return true
    }
}

//Protocolo

protocol AthleteP{
    var idade:Int { get }
    var nome:String { get }
    
    func correr() -> Bool
}

protocol AmateurP{
    var time:String { get }
    var anoEmAcao:Int { get }

}

class AmFootballPlayerP:AthleteP,AmateurP{
    var time: String
    
    var anoEmAcao: Int
    
    var idade: Int
    
    var nome: String
    
    init(idade: Int, nome: String, time: String, anoEmAcao: Int) {
        self.idade = idade
        self.nome = nome
        self.time = time
        self.anoEmAcao = anoEmAcao
    }
    
    func correr() -> Bool {
        return true
    }
    
    
}

class AmBaseballPlayerPs:AthleteP,AmateurP{
    var time: String
    
    var anoEmAcao: Int
    
    var idade: Int
    
    var nome: String
    
    init(idade: Int, nome: String, time: String, anoEmAcao: Int) {
        self.idade = idade
        self.nome = nome
        self.time = time
        self.anoEmAcao = anoEmAcao
    }
    
    func correr() -> Bool {
        return true
    }
    
    
}

