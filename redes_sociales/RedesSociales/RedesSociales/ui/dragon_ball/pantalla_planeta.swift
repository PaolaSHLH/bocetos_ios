//
//  pantalla_planeta.swift
//  RedesSociales
//
//  Created by alumno on 28/4/25.
//

import SwiftUI

let planetaFalso = Planeta(id: 1, name: "Namek", isDestroyed: true, description: "Planeta verde con mucho pasto", image: "")

struct pantallaPlaneta: View {
    let planeta : Planeta
    @Environment (ControladorAplicacion.self) var controlador
    
    var body: some View {
        NavigationStack{
            
            ScrollView{
                VStack(){
                    Text("Planeta de origen")
                        .font(.title)
                        .foregroundColor(.white)
                    
                    Text(planeta.name)
                    
                    if let url = URL(string: planeta.image) {
                        AsyncImage(url: url) { imagen in
                            imagen.image?
                                .resizable()
                                .scaledToFit()
                        }
                        .frame(width: 150, height: 200)
                    }
                    
                    
                    
                    Text(planeta.description)
                    
                    
                    
                }/* Aqui termina el scrollView*/
                .background(Color.orange)
            }/* Aqui termina el Nav stack*/
        }
    }
}

#Preview {
     pantallaPlaneta(planeta: planetaFalso)
        .environment(ControladorAplicacion())
}
