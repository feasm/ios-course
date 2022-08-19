import UIKit

// Class - Orientacão a Objetos

var nomeFelipe: String = "Felipe"
var alturaFelipe: Double = 1.92
var pesoFelipe: Double = 110

var nomePaulo: String = "Paulo"
var alturaPaulo: Double = 1.75
var pesoPaulo: Double = 70


// Estuda numa faculdade -> Quer fumar -> Não tem cigarro
// Emprestar um cigarro de um amigo João
// Precisava de um fumante

protocol Profissao {
    var nome: String { get }
    func iniciarTrabalho(nome: String)
    func trabalhar()
}

extension Profissao {
    // Método default do protocolo
    func baterPonto() {
        print("\(self.nome) bateu o ponto!")
    }
}

fileprivate extension Profissao {
    func trabalhar() {
        print("\(self.nome) começou a trabalhar!")
    }
}

protocol Empresa {
    var nomeDaEmpresa: String { get }
}

protocol Motorista {
    
}

protocol Pai {
    
}

class Mecanico: Profissao {
    var nome: String = "Mecânico"
    private var horasDeTrabalhoPorDia: Int
    private var nomeOficina: String
    
    init(horasDeTrabalhoPorDia: Int, nomeOficina: String) {
        self.horasDeTrabalhoPorDia = horasDeTrabalhoPorDia
        self.nomeOficina = nomeOficina
    }
    
    func iniciarTrabalho(nome: String) {
        
    }
    
    func trabalhar() {
        print("Iniciando jornada de trabalho de \(self.horasDeTrabalhoPorDia) horas, como \(self.nome) na oficina \(self.nomeOficina)")
    }
}

class Programador: Profissao {
    var nome: String = "Programador"
    private var horasDeTrabalhoPorDia: Int
    private var linguagem: String
    
    init(horasDeTrabalhoPorDia: Int, linguagem: String) {
        self.horasDeTrabalhoPorDia = horasDeTrabalhoPorDia
        self.linguagem = linguagem
    }
    
    func iniciarTrabalho(nome: String) {
        print("\(nome) iniciou sua jornada de trabalho de \(self.horasDeTrabalhoPorDia) horas, como \(self.nome)")
    }
    
    // Polimorfismo - Ter métodos com nomes semelhantes, mas com parâmetros diferentes
    func trabalhar() {
        print("Iniciando jornada de trabalho de \(self.horasDeTrabalhoPorDia) horas, como \(self.nome) \(self.linguagem)")
    }
    
    // Polimorfismo
    func trabalhar(horas: Int) {
        print("Iniciando jornada de trabalho de \(horas) horas, como \(self.nome) \(self.linguagem)")
    }
    
    // Polimorfismo
    func trabalhar(linguagem: String) {
        print("Iniciando jornada de trabalho de \(self.horasDeTrabalhoPorDia) horas, como \(self.nome) \(linguagem)")
    }
}

// Superclasse
class Mamifero {
    // Atributo, o atributo é uma variável que está dentro de uma classe
    var nome: String
    var altura: Double
    var peso: Double
    
    init(nome: String, altura: Double, peso: Double) {
        self.nome = nome
        self.altura = altura
        self.peso = peso
    }
    
    func beberAgua() {
        print("\(nome) está bebendo água")
    }
}

// Definição de um tipo de dado
// Não repetir código
class Pessoa: Mamifero, Motorista, Pai {
    
    // Composição - Design Pattern
    // Dependência - Conceito/Paradigma de programação
    var profissao: Profissao
    
    init(nome: String, altura: Double, peso: Double, trabalho: String, horasDeTrabalhoPorDia: Int, linguagem: String) {
//        self.profissao = Programador(trabalho: trabalho, horasDeTrabalhoPorDia: horasDeTrabalhoPorDia, linguagem: linguagem)
        self.profissao = Mecanico(horasDeTrabalhoPorDia: horasDeTrabalhoPorDia, nomeOficina: "Start Strek")
        
        super.init(nome: nome, altura: altura, peso: peso)
    }
    
    init(nome: String, altura: Double, peso: Double, profissao: Profissao) {
//        self.profissao = Programador(trabalho: trabalho, horasDeTrabalhoPorDia: horasDeTrabalhoPorDia, linguagem: linguagem)
//        self.profissao = Mecanico(trabalho: trabalho, horasDeTrabalhoPorDia: horasDeTrabalhoPorDia, nomeOficina: "Start Strek")
        self.profissao = profissao
        
        super.init(nome: nome, altura: altura, peso: peso)
    }
    
    // Método, são funções dentro de uma classe
    func seApresentar() {
        print("Olá, meu nome é \(self.nome), tenho \(self.altura) de altura e meu peso é \(self.peso)")
    }
    
    func iniciarTrabalho() {
        profissao.iniciarTrabalho(nome: self.nome)
    }
    
    func trabalhar() {
        profissao.trabalhar()
    }
}

// Subclasse de Mamifero
class Cachorro: Mamifero {
    
    func latir() {
        print("O cachorro \(self.nome) está latindo")
    }
    
    // Sobrecarga
    override func beberAgua() {
        print("\(nome) está bebendo água do pote")
    }
    
}

extension Cachorro {
    func correr() {
        print("\(self.nome) está correndo!")
    }
}


// Neste contexto, felipe é uma variável E também um objeto
//let felipe = Pessoa(nome: "Felipe", altura: 1.92, peso: 110, trabalho: "Programador", horasDeTrabalhoPorDia: 8, linguagem: "iOS")
//let paulo = Pessoa(nome: "Paulo", altura: 1.75, peso: 70, trabalho: "Programador", horasDeTrabalhoPorDia: 6, linguagem: "Android")
//let gabriel = Pessoa(nome: "Gabriel", altura: 1.69, peso: 60, trabalho: "Mecânico", horasDeTrabalhoPorDia: 10, linguagem: "de Carros")


let programadorIOS = Programador(horasDeTrabalhoPorDia: 8, linguagem: "iOS")
let programadorAndroid = Programador(horasDeTrabalhoPorDia: 6, linguagem: "Android")
let mecanico = Mecanico(horasDeTrabalhoPorDia: 10, nomeOficina: "Start Trek")

let felipe = Pessoa(nome: "Felipe", altura: 1.92, peso: 110, profissao: programadorIOS)
let paulo = Pessoa(nome: "Paulo", altura: 1.75, peso: 70, profissao: programadorAndroid)
let gabriel = Pessoa(nome: "Gabriel", altura: 1.69, peso: 60, profissao: mecanico)

felipe.profissao.baterPonto()
paulo.profissao.baterPonto()
gabriel.profissao.baterPonto()

felipe.seApresentar()
paulo.seApresentar()

//felipe.iniciarTrabalho()
//paulo.iniciarTrabalho()

felipe.trabalhar()
paulo.trabalhar()

let mike = Cachorro(nome: "Mike", altura: 1.2, peso: 40)
mike.latir()

felipe.beberAgua()
mike.beberAgua()

gabriel.trabalhar()

mike.correr()

// KISS - Keep it simple stupid
// Nunca tentar prever o que tá acontecendo
// Fazer da forma mais simples e coerente possível, se o código estiver simples, ele pode ser reescrito
// Prestar manutenção consome 10x mais tempo que criar código novo

// DRY - Don't repeat yourself
// Sempre que vc se deparar com código repetido, parar para pensar e tentar não repeti-lo, ou seja, reutilizar código

// Encapsulamento
// Esconder informações que não são relevantes pra quem precisar utilizar a sua classe

// Herança
// Utilizar superclasses para centralizar informação em comum entre várias classes

// Polimorfimo
// Utilizar o mesmo método, mas com parâmetros diferentes, e o objetivo precisa ser fazer a mesma coisa

// Acoplamento
// Que é quando uma classe herda funcionalidades que não deveria

// Composição
// Ao invés de trabalhar com herança, temos na verdade variáveis dentro da classe representando outros tipos de classe
// Já que temos essa variável, podemos utilizar seus métodos e atributos
// A composição foi adotada como padrão para evitar o alto acoplamento que classes com vários níveis de herança possuiam no passado

// Sobrecarga
// Quando quero modificar o comportamento de uma superclasse

// Protocols
// Server para categorizar classes, ao mesmo tempo que garantem que uma classe implemente suas funcionalidades
// Você pode implementar multiplos protocolos, mas não consegue herdar de multiplas classes

// Injeção de dependências
// Não quero definir as dependências dentro da minha classe
// Eu vou definir as dependências fora da classe, e injetar(passar como parâmetro) para dentro da classe dependente
