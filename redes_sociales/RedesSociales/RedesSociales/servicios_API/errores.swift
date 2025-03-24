//
//  errores.swift
//  RedesSociales
//
//  Created by alumno on 24/3/25.
//

enum ErroresDeRed: Error {
    case badUrl
    case invalidRequest
    case badResponse
    case badStatus
    case fallaAlConvertirLaRespuesta
}
