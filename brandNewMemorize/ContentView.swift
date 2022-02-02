//
//  ContentView.swift
//  brandNewMemorize
//
//  Created by Илия Гичев on 02.02.2022.
//

import SwiftUI

struct ContentView: View {
    let vehicles = ["🚗", "🚕", "🚙", "🚌", "🦼", "🛴", "🚲", " 🛵", "🚁", "🚀"]
    let flags = ["🇦🇺", "🇦🇹", "🇩🇿", "🇦🇿", "🇦🇸", "🇦🇶", "🇦🇲", "🇧🇸", "🇧🇾", "🇧🇬", "🇧🇴"]
    let sports = ["⚽️", "🏀", "🥎", "🎾", "🎱", "🥏", "🏐", "🪀", "🏓", "🏉", "🏈", "⚾️", "🏐", "🏹", "🥅"]
    
    @State var emojis = ["🚗", "🚕", "🚙", "🚌", "🦼", "🛴", "🚲", " 🛵", "🚁", "🚀"]
    @State var currentCount = 4
    
    
    var body: some View {
        VStack{
            Text("Memorize!")
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))] ){
                    ForEach(emojis[0..<currentCount], id: \.self){ emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
  
            HStack{
                vehicleThemeButton
                flagThemeButton
                sportThemeButton
            }
            .font(.largeTitle)
            .padding(.horizontal)
            
        }
    }
    
    var vehicleThemeButton: some View{
            Button{
                currentCount = Int.random(in: 4...vehicles.count)
                emojis = vehicles.shuffled()
            } label: {
                VStack{
                    Image(systemName: "car")
                    Text("vehicles").font(.caption)
                }
            }
            .padding(.horizontal)
    }
    
    var flagThemeButton: some View{
            Button{
                currentCount = Int.random(in: 4...flags.count)
                emojis = flags.shuffled()
            } label: {
                VStack{
                    Image(systemName: "flag")
                    Text("flags").font(.caption)
                }
            }
            .padding(.horizontal)
    }
    
    var sportThemeButton: some View{
            Button{
                currentCount = Int.random(in: 4...sports.count)
                emojis = sports.shuffled()
            } label: {
                VStack{
                    Image(systemName: "heart")
                    Text("sports").font(.caption)
                }
            }
            .padding(.horizontal)
    }
    

}


struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        let shape = RoundedRectangle(cornerRadius: 20)
            
        ZStack{
            if isFaceUp{
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}









struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
                .preferredColorScheme(.dark)
        }
    }
}
