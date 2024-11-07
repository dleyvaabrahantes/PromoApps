// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

@available(iOS 16.0.0, *)
public struct PromoApps: View {
    var actionNo: () -> Void
    var actionYes: () -> Void
    var actionClose: () -> Void
    var title: String
    var nameImage: String
    @State private var offsetY: CGFloat = -5
    @State private var widthShadow: CGFloat = 80
    
    public init(actionNo: @escaping () -> Void, actionYes: @escaping () -> Void, title: String,nameImage: String, actionClose: @escaping () -> Void) {
        self.actionNo = actionNo
        self.actionYes = actionYes
        self.title = title
        self.nameImage = nameImage
        self.actionClose = actionClose
    }
    
    public var body: some View {
        VStack(spacing: 10) {
            HStack{
                Spacer()
                Button(action: actionClose, label: {
                    
                    Image(systemName: "xmark.circle.fill")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundStyle(Color.white.opacity(0.6),
                                         Color.secondary.opacity(0.4))
                })
            }
            .padding()
            Spacer()
            // Icon and app name
            Image(nameImage)
                .resizable()
                .scaledToFit()
                .frame(width: 128, height: 128)
                .cornerRadius(20)
                .shadow(radius: 10)
                .offset(y: offsetY) // Aplica el desplazamiento vertical
                            .onAppear {
                                // Animación de rebote hacia arriba y abajo
                                withAnimation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true)) {
                                    offsetY = 5 // Cambia el desplazamiento para moverlo hacia abajo
                                }
                            }
            Ellipse()
                .fill(Color.black.opacity(0.3)) // Color negro con opacidad para dar un efecto de sombra
                .frame(width: widthShadow, height: 5) // Ajusta el tamaño del óvalo
                .shadow(color: Color.black.opacity(0.5), radius: 10, x: 0, y: 5)
                .onAppear {
                    // Animación de rebote hacia arriba y abajo
                    withAnimation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true)) {
                        widthShadow = 40 // Cambia el desplazamiento para moverlo hacia abajo
                    }
                }
            Text(title)
                .font(.title)
                .multilineTextAlignment(.center)
                .padding(.vertical,20)
            HStack{
                VStack(alignment: .leading) {
                    HStack(spacing: 4) {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Text("4.9")
                            .font(.headline)
                    }
                    Text("Valoración")
                        .font(.headline)
                }
                .padding(.horizontal)
                
                Rectangle()
                    .frame(width:1,height: 40)
                    .foregroundStyle(.gray)
                
                VStack(alignment: .leading) {
                    HStack(spacing: 4) {
                        Image(systemName: "square.and.arrow.down")
                            .foregroundColor(.yellow)
                            
                        Text("+ 1.5k")
                            .font(.headline)
                            .padding(.horizontal,5)
                    }
                    Text("Descargas")
                        .font(.headline)
                }
                .padding(.horizontal)
                
                Rectangle()
                    .frame(width:1,height: 40)
                    .foregroundStyle(.gray)
                
                VStack(alignment: .leading) {
                    HStack(spacing: 4) {
                        Text("GRATIS")
                            .font(.headline)
                        
                    }
                    Text("Instalar")
                        .font(.headline)
                }
                .padding(.horizontal)
                    
            }
            .padding(.vertical,20)
            
            HStack(spacing: 20){
                Button(action: actionNo,label: {
                    Text("CANCELAR")
                        .font(.title2)
                })
                .buttonStyle(.bordered)
                Button(action: actionYes,label: {
                    Text("OBTENER")
                        .font(.title2)
                })
                .buttonStyle(.borderedProminent)
                
            }
            .padding(.top,20)
            Spacer()
        }
        
    }
    //                    // App title
    //                    Text(title)
    //                        .font(.headline)
    //                        .multilineTextAlignment(.center)
    //
    //                    // Rating, downloads, and price info
    //                    HStack(spacing: 15) {
    //                        // Rating
    //                        HStack(spacing: 4) {
    //                            Image(systemName: "star.fill")
    //                                .foregroundColor(.yellow)
    //                            Text("4.9")
    //                                .font(.subheadline)
    //                        }
    //
    //                        // Downloads
    //                        HStack(spacing: 4) {
    //                            Image(systemName: "arrow.down.to.line.alt")
    //                                .foregroundColor(.gray)
    //                            Text("+1.5k Downloads")
    //                                .font(.subheadline)
    //                                .foregroundColor(.gray)
    //                        }
    //
    //                        // Price
    //                        Text("FREE")
    //                            .font(.subheadline)
    //                            .bold()
    //                            .foregroundColor(.blue)
    //                    }
    //
    //                    // Buttons
    //                    HStack {
    //                        Button(action: {
    //                            // Action for close button
    //                        }) {
    //                            Text("Close")
    //                                .padding(.horizontal, 20)
    //                                .padding(.vertical, 8)
    //                                .background(Color.gray.opacity(0.2))
    //                                .cornerRadius(8)
    //                        }
    //
    //                        Button(action: {
    //                            // Action for get button
    //                        }) {
    //                            Text("GET")
    //                                .padding(.horizontal, 20)
    //                                .padding(.vertical, 8)
    //                                .background(Color.blue)
    //                                .foregroundColor(.white)
    //                                .cornerRadius(8)
    //                        }
    //                    }
    //                    .padding(.top, 10)
    //                }
    //                .padding()
    //                .background(Color(.systemBackground))
    //                .cornerRadius(20)
    //                .shadow(radius: 5)
    //            }
}

@available(iOS 16.0.0, *)
#Preview {
    PromoApps(actionNo: {}, actionYes: {}, title: "Cuban Money", nameImage: "", actionClose: {})
}

