//
//  ContentView.swift
//  brandNewMemorize
//
//  Created by Илия Гичев on 02.02.2022.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["🚗", "🚕", "🚙", "🚌", "🦼", "🛴", "🚲", " 🛵", "🚁", "🚀", "🗿", "🎠", "🏠", "🏡", "🏭"]
    
    @State var emojiCount = 4
    
    var body: some View {
        VStack{
            Text("Memorize!")
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))] ){
                    ForEach(emojis[0..<emojiCount], id: \.self){ emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
  
            HStack{
                removeButton
                Spacer()
                addButton
            }
            .font(.largeTitle)
            .padding(.horizontal)
            
        }
    }
    
    
    var removeButton: some View{
        Button{
            if emojiCount > 1{
                emojiCount -= 1
            }
        } label: {
            Image(systemName: "minus.circle")
        }
    }
    
    var addButton: some View{
        Button{
            if emojiCount < emojis.count{
                emojiCount += 1
            }
        } label: {
            Image(systemName: "plus.circle")
        }
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
