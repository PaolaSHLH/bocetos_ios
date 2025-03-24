//
//  File.swift
//  RedesSociales
//
//  Created by alumno on 24/3/25.
//

import SwiftUI

/*
 Codable
 Encodable
 Decodable
 */


struct Publicacion:Identifiable,Codable{
    let userId: Int
    let id: Int
    
    let title: String
    let body: String
}

