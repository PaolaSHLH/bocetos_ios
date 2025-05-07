//
//  pantalla_desc_planetas.swift
//  RedesSociales
//
//  Created by alumno on 7/5/25.
//

import SwiftUI

struct pantallaDescPlanetas: View {
    @Environment(ControladorAplicacion.self) var controlador
    
    var body: some View {
        
        
        ScrollView{
            VStack{
                Text("\(controlador.planeta_seleccionado?.name ?? "Valor por defecto")")
                    .padding()
                    .frame(width: 250)
                    .background(Color.white)
                    .cornerRadius(12)
                
                
                Spacer()
                if let url = URL(string: controlador.planeta_seleccionado?.image ?? "") {
                    AsyncImage(url: url) { imagen in
                        imagen.image?
                            .resizable()
                            .scaledToFit()
                    }
                    .frame(width: 150, height: 200)
                }
                
                
                Spacer()
                
                
                Spacer()
                Text("\(controlador.planeta_seleccionado?.description ?? "Valor por defecto")")
                    .padding()
                    .background(Color.white)
                    .cornerRadius(12)
                    .frame(maxWidth: .infinity)
                
                //Text("\(controlador.personaje_seleccionado?.transformations?.name ?? "Valor por defecto")")
                
                
            }/*este es el Vstack*/
            .padding()
            .background(Color.blue)
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            .cornerRadius(12)
        }/*este es el Scroll View*/
        .padding()
        .background(Color.orange)
        
            
            
        
    }
}

#Preview {
    pantallaDescPlanetas()
        .environment(ControladorAplicacion())
}
