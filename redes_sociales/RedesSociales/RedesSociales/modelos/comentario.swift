//
//  comentario.swift
//  RedesSociales
//
//  Created by alumno on 26/3/25.
//

import SwiftUI

struct Comentario: Identifiable, Codable{
    let postId: Int
    let id: Int
    let name: String
    let email: String
    let body: String
}
