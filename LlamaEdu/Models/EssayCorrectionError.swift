//
//  EssayCorrectionError.swift
//  LlamaEdu
//
//  Created by Giovanna Moeller on 08/11/24.
//

import Foundation

enum EssayCorrectionError: Error {
    case invalidImage
    case unreadableImage
    case networkError(Error)
    case other(String)
    
    var title: String {
        switch self {
        case .invalidImage:
            return "Imagem Inválida"
        case .unreadableImage:
            return "Imagem Ilegível"
        case .networkError:
            return "Erro de Conexão"
        case .other(let str):
            return str
        }
    }
    
    var message: String {
        switch self {
        case .invalidImage:
            return "A imagem selecionada é inválida. Por favor, tente outra imagem."
        case .unreadableImage:
            return "Não foi possível identificar o texto na imagem. Por favor, certifique-se que a imagem está nítida e bem iluminada."
        case .networkError:
            return "Ocorreu um erro ao tentar enviar sua redação. Por favor, verifique sua conexão e tente novamente."
        case .other(let str):
            return "Ocorreu um erro. Tente novamente."
        }
    }
}
