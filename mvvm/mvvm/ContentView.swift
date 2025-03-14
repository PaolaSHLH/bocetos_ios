//
//  ContentView.swift
//  mvvm
//
//  Created by alumno on 14/3/25.
//

import SwiftUI

struct ContentView: View {
    @Environment(VistaModeloBasico.self) private var controlador
    var body: some View {
        VStack {
            ForEach(controlador.series_registradas){
                Image(systemName: "plus")
            }
        }
        .padding()
        
        Button("agrega por favor una serie de prueba"){
            controlador.agregar_serie()
        }
    }
}

#Preview {
    ContentView()
        .environment(VistaModeloBasico())
}
