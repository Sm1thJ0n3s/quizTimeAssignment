//
//  StartView.swift
//  VideoGameQuiz
//
//  Created by StudentAM on 4/12/24.
//

import SwiftUI

struct StartView: View {
    
    @State private var selectedOption = 0
    @State private var selectedVideoGame: String = "Terraria"
    let options = ["Terraria", "Call of Duty", "Minecraft", "Five Nights At Freddy's", "Clash Royale", "Dead Island", "Brawl Stars", "Halo", "Super Mario Bros", "Pokemon", "Testing Time"]
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("quizBackground")
                
                VStack {
                    Text("Video Game Quiz")
                        .frame(width: 220, height:100)
                        .padding(50)
                        .multilineTextAlignment(.center)
                        .font(.system(size: 40))
                        .bold(true)
                    
                    Picker(selection: $selectedOption, label: Text("")) {
                        ForEach(options.indices, id: \.self) { index in Text(options[index])
                        }
                    }
                    .pickerStyle(.wheel)
                    
                    NavigationLink(destination: ContentView(selectedQuiz: selectedVideoGame).navigationBarBackButtonHidden(true), label: {Text("Start Quiz")
                    })
                    .frame(width: 230, height: 115)
                    .background(.blue)
                    .foregroundColor(.white)
                    .font(.system(size: 50))
                    .padding(60)
                    
                }
                .onChange(of: selectedOption) { newValue in
                    selectedVideoGame = options[selectedOption]
                }
            }
        }
    }
}

#Preview {
    StartView()
}
