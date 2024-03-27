//
//  Conversor1.swift
//  Menu2
//
//  Created by Tamara Rodriguez Romo on 14/05/23.
//

import SwiftUI

struct Conversor1: View {
    @State private var showConversionSheet = false
    @State private var cantidad: String = ""
    @State private var resultado: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Image("Termometro")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 180, height: 180)
                    .padding(.top, 10)
                
                Text("Seleccione una opción:")
                    .font(.headline)
                    .padding(.top, 30)
                
                NavigationLink(destination: Conversor1View(resultado: $resultado, conversion1: .celsiusToFahrenheit)) {
                    Text("Celsius a Fahrenheit")
                        .frame(width: 200, height: 50)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding()
                
                NavigationLink(destination: Conversor1View(resultado: $resultado, conversion1: .fahrenheitToCelsius)) {
                    Text("Fahrenheit a Celsius")
                        .frame(width: 200, height: 50)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding()
                
                Spacer() // Espaciador para centrar verticalmente el contenido
                
            }
            .onDisappear {
                resultado = "" // Restablecer el resultado al regresar al menú
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    
    struct Conversor1View: View {
        @Environment(\.presentationMode) var presentationMode
        @Binding var resultado: String
        @State private var cantidad: String = ""
        let conversion1: ConversionType
        
        var body: some View {
            VStack {
                TextField("Ingrese la cantidad", text: $cantidad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button(action: {
                    convertir(cantidad: cantidad)
                }) {
                    Text("Convertir")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding()
                
                Text(resultado)
                    .padding()
                    .frame(maxWidth: 300, maxHeight: 200, alignment: .center) // Ajustar al tamaño del texto
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    .padding()
            }
            .navigationBarHidden(true) // Ocultar el botón de regreso en la vista de destino
            .navigationBarTitle(conversion1.rawValue)
        }
        
        func convertir(cantidad: String) {
            if let valor = Double(cantidad) {
                switch conversion1 {
                case .celsiusToFahrenheit:
                    let fahrenheit = (valor * 9/5) + 32
                    resultado = "\(valor) grados Celsius son \(fahrenheit) grados Fahrenheit"
                case .fahrenheitToCelsius:
                    let celsius = (valor - 32) * 5/9
                    resultado = "\(valor) grados Fahrenheit son \(celsius) grados Celsius"
                }
            } else {
                resultado = "Ingrese una cantidad válida"
            }
        }
    }
    
    enum ConversionType: String {
        case celsiusToFahrenheit = "Celsius a Fahrenheit"
        case fahrenheitToCelsius = "Fahrenheit a Celsius"
    }
    
    struct Conversor1_Previews: PreviewProvider {
        static var previews: some View {
            Conversor1()
        }
    }
}
