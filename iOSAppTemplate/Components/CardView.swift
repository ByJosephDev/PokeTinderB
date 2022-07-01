//
//  CardView.swift
//  iOSAppTemplate
//
//  Created by MAC32 on 10/06/22.
//

import SwiftUI

struct CardView: View {
    
    var pokemon: Result

    @State private var offset = CGSize.zero

    @StateObject var homeViewModel = HomeViewModel()

    
    var body: some View {
        ZStack{
            Image("fondobosque")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: 300)
            AsyncImage(url: URL(string: setImageFromURL(url: pokemon.url)), scale: 1.5)
            VStack(alignment: .leading){
                Text(pokemon.name.capitalized).frame(maxWidth:.infinity, alignment: .leading).foregroundColor(.white).font(.system(size: 23, weight: .bold))
                HStack{
                    Image(systemName: "location").foregroundColor(.white)
                        .font(.system(size: 16, weight: .bold))
                    Text("Pueblo Paleta").foregroundColor(.white).font(.system(size: 16, weight: .bold))

                }.frame(maxWidth: .infinity, alignment: .leading)
                                
            }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                .padding()
            
        }.cornerRadius(15)
            .padding()
            .offset(x: offset.width * 1, y: offset.height * 0.4)
            .rotationEffect(.degrees(Double(offset.width / 40)))
            .gesture(
                DragGesture()
                    .onChanged({ gesture in
                        offset = gesture.translation
                    })
                    .onEnded({ gesture in
                        withAnimation {
                            swipeCar(width: offset.width)
                        }
                    })
            )
    }
    
    func setImageFromURL(url: String) -> String {
        let id = url.components(separatedBy: "/").filter({$0 != ""}).last!
        return "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(id).png"
    }
    
    func swipeCar(width: CGFloat) {
        switch width {
        case -500...(-150):
            print("remove")
            homeViewModel.savePokemon(name: pokemon.name, url: pokemon.url)
            offset = CGSize(width: -500, height: 0)
        case 150...500:
            print("add")
            homeViewModel.savePokemon(name: pokemon.name, url: pokemon.url, like: true)
            offset = CGSize(width: 500, height: 0)
        default:
            offset = .zero
        }
    }
    
    
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(pokemon: Result(name: "Pikachu", url: "https://pokeapi.co/api/v2/pokemon/25"))
    }
}
