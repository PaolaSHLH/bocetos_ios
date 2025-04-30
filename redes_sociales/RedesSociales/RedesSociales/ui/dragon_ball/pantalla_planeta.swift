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
        
            
            ScrollView{
                VStack(){
                    Text("Planeta de origen")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                    
                    Text(planeta.name)
                        .font(.title)
                        .foregroundColor(.white)
                        //.font(.custom ("SF Pro", size: 50))
                        
                    Text(planeta.description)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(12)
                        .frame(maxWidth: .infinity)
                        .padding()
                    
                    if let url = URL(string: planeta.image) {
                        AsyncImage(url: url) { imagen in
                            imagen.image?
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(12)
                        }
                        .frame(width: 350, height: 400)
                    }
                    
                    
                }/* Aqui termina el scrollView*/
        }
            .background(Color.orange)
            .frame(width: .infinity)
    }
}

#Preview {
     pantallaPlaneta(planeta: planetaFalso)
        .environment(ControladorAplicacion())
}
