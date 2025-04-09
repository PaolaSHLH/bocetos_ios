//
//  pantalla_descripcion.swift
//  RedesSociales
//
//  Created by alumno on 7/4/25.
//

import SwiftUI

/*let personaje_falso = MonoChino(id: 1, name: "lala", ki: "989898", maxKi: "10000000", race: "perro", gender: "male", description: "lalalalalalalal", image: "jsjsjsjsj", affiliation: "ninguna", originPlanet: "nil" , transformations: )*/

struct pantallaDescripcion: View {
    @Environment(ControladorAplicacion.self) var controlador
    
    var body: some View {
        
        ScrollView{
            VStack{
                Text("\(controlador.personaje_seleccionado?.name ?? "Valor por defecto")")
                    .padding()
                    .background(Color.white)
                    .cornerRadius(12)
                    
                Spacer()
                if let url = URL(string: controlador.personaje_seleccionado?.image ?? "") {
                    AsyncImage(url: url) { imagen in
                        imagen.image?
                            .resizable()
                            .scaledToFit()
                    }
                    .frame(width: 150, height: 200)
                }
                
                HStack{
                    Spacer()
                    Text("\(controlador.personaje_seleccionado?.name ?? "Valor por defecto")")
                        .padding()
                        .background(Color.white)
                        .cornerRadius(12)
                    Spacer()
                    Text("\(controlador.personaje_seleccionado?.gender ?? "Valor por defecto")")
                        .padding()
                        .background(Color.white)
                        .cornerRadius(12)
                    Spacer()
                }/*este es el fin del Hstack*/
                
                Spacer()
                
                HStack{
                    Spacer()
                    Text("\(controlador.personaje_seleccionado?.ki ?? "Valor por defecto")")
                        .padding()
                        .background(Color.white)
                        .cornerRadius(12)
                    Spacer()
                    Text("\(controlador.personaje_seleccionado?.maxKi ??  "Valor por defecto")")
                        .padding()
                        .background(Color.white)
                        .cornerRadius(12)
                    Spacer()
                }
                
                HStack{
                    Spacer()
                    Text("\(controlador.personaje_seleccionado?.affiliation ?? "Valor por defecto")")
                        .padding()
                        .background(Color.white)
                        .cornerRadius(12)
                    Spacer()
                    Text("\(controlador.personaje_seleccionado?.originPlanet?.name ?? "Valor por defecto")")
                        .padding()
                        .background(Color.white)
                        .cornerRadius(12)
                    Spacer()
                }
                
                
                Spacer()
                Text("\(controlador.personaje_seleccionado?.description ?? "Valor por defecto")")
                    .padding()
                    .background(Color.white)
                    .cornerRadius(12)
                
                
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
    pantallaDescripcion()
        .environment(ControladorAplicacion())
}
