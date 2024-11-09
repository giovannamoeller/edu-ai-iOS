//
//  Competency.swift
//  LlamaEdu
//
//  Created by Giovanna Moeller on 09/11/24.
//

import Foundation

enum Competency {
    case one, two, three, four, five
    
    var romanNumeral: String {
        switch self {
        case .one: return "I"
        case .two: return "II"
        case .three: return "III"
        case .four: return "IV"
        case .five: return "V"
        }
    }
    
    var description: String {
        switch self {
        case .one: return "Demonstrar domínio da modalidade escrita formal da língua portuguesa."
        case .two: return "Compreender a proposta de redação e aplicar conceitos das várias áreas de conhecimento para desenvolver o tema, dentro dos limites estruturais do texto dissertativo-argumentativo em prosa."
        case .three: return "Selecionar, relacionar, organizar e interpretar informações, fatos, opiniões e argumentos em defesa de um ponto de vista."
        case .four: return "Demonstrar conhecimento dos mecanismos linguísticos necessários para a construção da argumentação."
        case .five: return "Elaborar proposta de intervenção para o problema abordado, respeitando os direitos humanos."
        }
    }
}
