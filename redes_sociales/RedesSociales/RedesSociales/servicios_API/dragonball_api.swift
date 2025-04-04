//
//  dragonball_api.swift
//  RedesSociales
//
//  Created by alumno on 4/4/25.
//

import SwiftUI


class DragonBallAPI: Codable {
    let url_base = "https://dragonball-api.com/api"

    func descargar_pagina_personajes() async ->  PaginaResultado?{
        let ubicacion_recurso = "/characters"
        
        return await descargar(recurso: ubicacion_recurso)
    }
    
    func descargar<TipoGenerico:Codable>(recurso: String) async -> TipoGenerico?{
        do{
            guard let url = URL(string: "\(url_base)\(recurso)") else {throw ErroresDeRed.badUrl}
            let(datos, respuesta) = try await URLSession.shared.data(from: url)
            guard let respuesta = respuesta as? HTTPURLResponse else {throw  ErroresDeRed.badResponse}
            guard respuesta.statusCode >= 200 && respuesta.statusCode < 300 else {throw ErroresDeRed.badStatus}
            do{
                 let respuesta_decodificada = try JSONDecoder().decode(TipoGenerico.self, from: datos)
                return respuesta_decodificada
            }
            catch let error as NSError{
                print("El error en tu modelo es: \(error.debugDescription)")
            }
            //return respuesta_decodificada
            
        }catch ErroresDeRed.badUrl{
            print("Tienes mala conexion, matate")
        }
        catch ErroresDeRed.badResponse{
            print("Algo salio mal con la respuesta, revisa porfi")
        }
        catch ErroresDeRed.badStatus{
            print("Como puedes tener un error en algo que no se mueve? Esto es en Dragon ball")
        }
        catch ErroresDeRed.fallaAlConvertirLaRespuesta{
            print("Tienes mal el modelo o la implementacion de este")
        }
        catch ErroresDeRed.invalidRequest {
            print("como llegaste aqui? 0-0")
        }
        catch{
            print("algo muy malo paso y no se que es, no deberias de ver esto")
        }
        return nil
    }
}
