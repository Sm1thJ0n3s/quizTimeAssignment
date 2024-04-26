//
//  EndResultsView.swift
//  VideoGameQuiz
//
//  Created by StudentAM on 4/12/24.
//

import SwiftUI

struct EndResultsView: View {
    
    var testing: Bool
    var score: Int
    var selectedQuizSave: String
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("quizBackground")
                VStack {
                    if testing {
                        VStack {
                            Text("Congrats on completing the test!")
                                .bold(true)
                            Text("I know, the test was long but at least you get to view how you did!")
                                .padding()
                                .multilineTextAlignment(.center)
                        }
                        .frame(width:400)
                        .background(.green)
                        .foregroundColor(.purple)
                        
                            Text("Your score is: \(score)")
                            if score == 0 {
                                Text("Your grade is an FF+")
                                Text("I believe you can go learn more about your video game knowledge.")
                                    .frame(width:400)
                                    .padding()
                                    .background(.yellow)
                                    .multilineTextAlignment(.center)
                            } else if score < 11 && score > 0 {
                                Text("Your grade is an FF")
                                Text("I suggest doing the quizzes first.")
                                    .frame(width:400)
                                    .padding()
                                    .background(.yellow)
                                    .multilineTextAlignment(.center)
                            } else if score < 21 && score > 10 {
                                Text("Your grade is an FF-")
                                Text("It's a good start there, not really though. You can try again if you'de like to.")
                                    .frame(width:400)
                                    .padding()
                                    .background(.yellow)
                                    .multilineTextAlignment(.center)
                            } else if score < 31 && score > 20 {
                                Text("Your grade is an F+")
                                Text("I believe a lot more work is required.")
                                    .frame(width:400)
                                    .padding()
                                    .background(.yellow)
                                    .multilineTextAlignment(.center)
                            } else if score < 41 && score > 30 {
                                Text("Your grade is an F")
                                Text("It's not passing but you can always try again. Please do try again though.")
                                    .frame(width:400)
                                    .padding()
                                    .background(.yellow)
                                    .multilineTextAlignment(.center)
                            } else if score < 60 && score > 40 {
                                Text("Your grade is an F-")
                                Text("Still an F but you're getting there. Keep on studying your lore.")
                                    .frame(width:400)
                                    .padding()
                                    .background(.yellow)
                                    .multilineTextAlignment(.center)
                            } else if score < 64 && score > 59 {
                                Text("Your grade is an D-")
                                Text("That's really close to an F. If you want to, you can keep trying!")
                                    .frame(width:400)
                                    .padding()
                                    .background(.yellow)
                                    .multilineTextAlignment(.center)
                            } else if score < 67 && score > 63 {
                                Text("Your grade is an D")
                                Text("You're really gonna get to become the master of video games (gamer). Just keep up that hard work!")
                                    .frame(width:400)
                                    .padding()
                                    .background(.yellow)
                                    .multilineTextAlignment(.center)
                            } else if score < 70 && score > 66 {
                                Text("Your grade is an D+")
                                Text("Alright, now you're beginning to get somewhere a little higher.")
                                    .frame(width:400)
                                    .padding()
                                    .background(.yellow)
                                    .multilineTextAlignment(.center)
                            } else if score < 74 && score > 69 {
                                Text("Your grade is an C-")
                                Text("Alright, in a Gaming College or University, it's still not passing. Try a Bit more harder!")
                                    .frame(width:400)
                                    .padding()
                                    .background(.yellow)
                                    .multilineTextAlignment(.center)
                            } else if score < 77 && score > 73 {
                                Text("Your grade is an C")
                                Text("Nice average score. You did try harder and you've managed to make progress!")
                                    .frame(width:400)
                                    .padding()
                                    .background(.yellow)
                                    .multilineTextAlignment(.center)
                            } else if score < 80 && score > 76 {
                                Text("Your grade is an C+")
                                Text("A C isn't too bad but I suggest trying out a B- or higher. It may increase youre chances")
                                    .frame(width:400)
                                    .padding()
                                    .background(.yellow)
                                    .multilineTextAlignment(.center)
                            } else if score < 84 && score > 79 {
                                Text("Your grade is an B-")
                                Text("A B- isn't bad. Stiil, good for ya mate!")
                                    .frame(width:400)
                                    .padding()
                                    .background(.yellow)
                                    .multilineTextAlignment(.center)
                            } else if score < 87 && score > 83 {
                                Text("Your grade is an B")
                                Text("That's some work I like to see there!")
                                    .frame(width:400)
                                    .padding()
                                    .background(.yellow)
                                    .multilineTextAlignment(.center)
                            } else if score < 90 && score > 86 {
                                Text("Your grade is an B+")
                                Text("Very much of a good grade! You're good at this video game knowledge.")
                                    .frame(width:400)
                                    .padding()
                                    .background(.yellow)
                                    .multilineTextAlignment(.center)
                            } else if score < 94 && score > 89 {
                                Text("Your grade is an A-")
                                Text("Almost an A! You're almost there my friend.")
                                    .frame(width:400)
                                    .padding()
                                    .background(.yellow)
                                    .multilineTextAlignment(.center)
                            } else if score < 97 && score > 93 {
                                Text("Your grade is an A")
                                Text("An A?! Congrats on that! You can stop now if you want to celebrate how much of a gamer you are.")
                                    .frame(width:400)
                                    .padding()
                                    .background(.yellow)
                                    .multilineTextAlignment(.center)
                                    .frame(width:400)
                            } else if score < 99 && score > 96 {
                                Text("Your grade is an A+")
                                Text("You really know your stuff! You're just one off from becoming a true gamer!")
                                    .frame(width:400)
                                    .padding()
                                    .background(.yellow)
                                    .multilineTextAlignment(.center)
                            } else if score == 100 {
                                Text("Your grade is an S")
                                Text("You've done it. You have managed to get a perfect score and become the Master of Videos. The Ultimate True Gamer.")
                                    .frame(width:400)
                                    .padding()
                                    .background(.yellow)
                                    .multilineTextAlignment(.center)
                            }
                    } else if !testing {
                        Text("Congrats on completing the quiz!")
                            .padding()
                            .background(.red)
                            .foregroundColor(.yellow)
                            .bold(true)
                        
                        Text("Your score is: \(score)")
                        
                        if score == 0 {
                            Text("Your grade is an FF")
                            Text("Wow, I didn't think you don't really know this video game.")
                                .frame(width:400)
                                .padding()
                                .background(.yellow)
                                .multilineTextAlignment(.center)
                        } else if score < 5 && score > 0 {
                            Text("Your grade is an F")
                            Text("Beginners always have room to learn more.")
                                .frame(width:400)
                                .padding()
                                .background(.yellow)
                                .multilineTextAlignment(.center)
                        } else if score == 6 {
                            Text("Your grade is an D")
                            Text("It's not an F but you can always try again!")
                                .frame(width:400)
                                .padding()
                                .background(.yellow)
                                .multilineTextAlignment(.center)
                        } else if score == 7 {
                            Text("Your grade is an C")
                            Text("An average score. You have passed though.")
                                .frame(width:400)
                                .padding()
                                .background(.yellow)
                                .multilineTextAlignment(.center)
                        } else if score == 8 {
                            Text("Your grade is an B")
                            Text("B for Bravo! Congrats for the grade as well!")
                                .frame(width:400)
                                .padding()
                                .background(.yellow)
                                .multilineTextAlignment(.center)
                        } else if score == 9 {
                            Text("Your grade is an A-")
                            Text("You have a lot of knowledge to nearly a perfect score!")
                                .frame(width:400)
                                .padding()
                                .background(.yellow)
                                .multilineTextAlignment(.center)
                        } else if score == 10 {
                            Text("Your grade is an A+")
                            Text("You really know your lore and stuff! Good on ya!")
                                .frame(width:400)
                                .padding()
                                .background(.yellow)
                                .multilineTextAlignment(.center)
                        }
                    }
                    
                    HStack {
                        NavigationLink(destination: ContentView(selectedQuiz: selectedQuizSave).navigationBarBackButtonHidden(true), label: {
                            Text("Try Again")
                                .frame(width: 100, height: 25)
                                .padding(5)
                                .background(.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        })
                        NavigationLink(destination: StartView().navigationBarBackButtonHidden(true), label: {
                            Text("Go Back")
                                .frame(width: 100, height: 25)
                                .padding(5)
                                .background(.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        })
                    }
                }
            }
        }
    }
}

#Preview {
    EndResultsView(testing: false, score: 0, selectedQuizSave: "")
}
