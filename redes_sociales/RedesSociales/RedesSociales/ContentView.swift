//
//  ContentView.swift
//  RedesSociales
//
//  Created by alumno on 24/3/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GenerarPublicaciones()
    }
}

#Preview {
    ContentView()
        .environment(ControladorAplicacion())
}
