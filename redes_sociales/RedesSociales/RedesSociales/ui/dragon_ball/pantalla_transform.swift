//
//  pantalla_transform.swift
//  RedesSociales
//
//  Created by alumno on 30/4/25.
//

import SwiftUI
let transformacionEjemplo = Transformacion(
    id: 1,
    name: "Super Saiyan",
    image: "https://via.placeholder.com/150",
    ki: "9000000"
)

struct pantallaTransform: View {
    let transformaciones: [Transformacion]
    @Environment (ControladorAplicacion.self) var controlador
    
    let columnas = [
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
     
        var body: some View {
            ScrollView {
                Text ("Transformaciones")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    
                LazyVGrid(columns: columnas, spacing: 16) {
                    ForEach(transformaciones) { transformacion in
                        VStack(alignment: .leading, spacing: 8) {
                            Text(transformacion.name)
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
     
                            Text("Ki: \(transformacion.ki)")
                                .font(.subheadline)
                                .foregroundColor(.gray)
     
                            if let url = URL(string: transformacion.image) {
                                AsyncImage(url: url) { imagen in
                                    imagen.image?
                                        .resizable()
                                        .scaledToFit()
                                }
                                .frame(height: 120)
                                .cornerRadius(8)
                            }
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(12)
                        .shadow(radius: 3)
                    }
                }
                .padding()
            }
            .background(Color.indigo.ignoresSafeArea())
        }
    }

#Preview {
    pantallaTransform(transformaciones: [transformacionEjemplo])
        .environment(ControladorAplicacion())
}
