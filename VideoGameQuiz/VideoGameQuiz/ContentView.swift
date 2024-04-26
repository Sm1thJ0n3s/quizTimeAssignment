//
//  ContentView.swift
//  VideoGameQuiz
//
//  Created by StudentAM on 4/12/24.
//

import SwiftUI

struct ContentView: View {
    
    // Gets the video game from the Picker in the StartView the user wants to take a quiz on.
    let selectedQuiz: String
    
    // This is the make things a lot more easier. It's also required.
    struct Question {
        var question: String
        var answers: [String]
        var trueAnswer: String
    }
    
    // The score. Adds up for every correct answer the user gets.
    @State var score: Int = 0
    
    // User answer and question Index.
    // userAnswered becomes true when the user clicks on an answer
    @State private var userAnswered: Bool = false
    // answerIndex grabs the index of the button which chnages to font color if they clicked on that button.
    @State private var answerIndex: Int = 0
    // questionNum is the index of the questions. Adds up by 1 whenever the user answers.
    @State private var questionNum: Int = 0
    // A cap to make life easier between quizzes and the test.
    @State private var questionCap: Int = 9
    // To show the the player is testing a some things are going to be different.
    @State private var testing: Bool = false
    
    // These are the questions the user will face.
    // Terraria Questions.
    @State private var terrariaQuestions = [
        Question(question: "Which boss was removed?", answers: ["Moon Lord", "Eye of Cthulhu", "Ocram", "Golem"], trueAnswer: "Ocram"),
        Question(question: "When was mounts introduced into Terraria (Hint: Chocolate)?", answers: ["Apr. 19, 2017", "May 23rd, 2011", "Dec. 20, 2013", "Nov. 15, 2016"], trueAnswer: "May 23rd, 2011"),
        Question(question: "Which item permanently increase your mana?", answers: ["Crystal Star", "Life Fruit", "Book of MP", "Mana Crystal"], trueAnswer: "Mana Crystal"),
        Question(question: "Who's the hardest boss?", answers: ["Golem", "Moon Lord", "Ocram", "Queen Slime"], trueAnswer: "Moon Lord"),
        Question(question: "Which NPC is different from the rest?", answers: ["The Clothier", "The Princess", "Fisher Boy", "Santa Clause"], trueAnswer: "Fisher Boy"),
        Question(question: "What biome corrupts the world?", answers: ["Hallowed", "Desert", "Jungle", "Crimson"], trueAnswer: "Crimson"),
        Question(question: "What connect is there between The Wall of Flesh and The Guide?", answers: ["They're the same", "They're brothers", "They're different", "Neither"], trueAnswer: "They're the same"),
        Question(question: "Who is the Moon Lord?", answers: ["A Squid?", "Lunatic Cultist's God", "Book of MP", "Cthulhu"], trueAnswer: "Cthulhu"),
        Question(question: "What is the Lunatic Cultist theory?", answers: ["Keep Away Moon Lord", "Summoning Moon Lord", "Stopping the Lunar Event", "I don't Know"], trueAnswer: "Summoning Moon Lord"),
        Question(question: "Which item permanently increases your health?", answers: ["Life Fruit/Heart Crystal", "Mana Crystal/Book of MP", "Greater Healing Potion", "Life Force Potion"], trueAnswer: "Life Fruit/Heart Crystal")
    ].shuffled()
    
    // Call of Duty Questions.
    @State private var callOfDutyQuestions = [
        Question(question: "What made Menendez grew hatred towards the United States?", answers: ["The killing of his people", "Wasn't supported", "American Abuser", "Destruction of his cartel"], trueAnswer: "The killing of his people"),
        Question(question: "Where is this line from: '50,000 people user to live here, now it's a ghost town'?", answers: ["CoD4: Modern Warfare", "Black Ops 4", "CoD: Modern Warfare 2", "CoD: Modern Warfare III"], trueAnswer: "CoD4: Modern Warfare"),
        Question(question: "Why did Gen. Shepherd betrayed Ghost and Roach?", answers: ["To take credit of the DSM", "He wants fame and glory", "To hide the dead undercover", "None of the above"], trueAnswer: "To hide the dead undercover"),
        Question(question: "What was the point of No Russian?", answers: ["To cause terrorism Russia", "To make a scene", "No Idea", "To blame on the enemy (U.S.)"], trueAnswer: "To blame on the enemy (U.S.)"),
        Question(question: "When does Soap die?", answers: ["Just Like Old Times", "Black Tuesday", "The Gulag", "Blood Brothers"], trueAnswer: "Blood Brothers"),
        Question(question: "What mission is Alex Mason's dependent on you?", answers: ["Suffer With Me", "Old Wounds", "Judgement Day", "Phyrrhic Victory"], trueAnswer: "Suffer With Me"),
        Question(question: "When is Black Ops 2.5 coming out?", answers: ["Nov. of 2024", "Dec. of 2027", "Dec. of 2025", "Nov. of 2025"], trueAnswer: "Nov. of 2025"),
        Question(question: "What perk gave you 6 perks?", answers: ["Who's Who?", "Electric Cherry", "Tombstone", "Juggernog"], trueAnswer: "Tombstone"),
        Question(question: "When was Dempsey introduced in the Zombies story?", answers: ["Since Shi No Numa", "Since Der Riese", "Since Verruckt", "Since Origins"], trueAnswer: "Since Verruckt"),
        Question(question: "Which Mod was shut down for 'Piracy' reasons?", answers: ["BOIII", "SM2", "Steam", "Custom BO3 maps"], trueAnswer: "SM2")
    ].shuffled()
    
    // Minecraft Questions.
    @State private var minecraftQuestions = [
        Question(question: "Who is the final boss?", answers: ["Technoblade", "Ender Dragon", "Warden", "Wither"], trueAnswer: "Ender Dragon"),
        Question(question: "When were horses introduced to Minecraft?", answers: ["May 23, 2014", "Dec. 31, 2020", "July 1, 2016", "July 1 2011"], trueAnswer: "July 1, 2016"),
        Question(question: "Which items permanently increases your stats?", answers: ["None", "A Enchanted Book", "Water breathing Potion", "Instant Health Potion"], trueAnswer: "None"),
        Question(question: "What day was the first Minecon?", answers: ["Oct. 15, 2023", "Aug. 31, 2010", "Jan. 16, 2008", "Sep. 28, 2019"], trueAnswer: "Aug. 31, 2010"),
        Question(question: "Which entity is an NPC?", answers: ["Villager", "Cow", "Vex", "Santa Clause"], trueAnswer: "Villager"),
        Question(question: "What biome spreads and infects other blocks?", answers: ["Cave", "Desert", "Plains", "Deep Dark"], trueAnswer: "Deep Dark"),
        Question(question: "What versions have a tutorial world?", answers: ["Legacy Edition", "Beta", "Alpha", "Bedrock"], trueAnswer: "Legacy Edition"),
        Question(question: "What texture pack came from Legacy Edition?", answers: ["John Smith Legacy", "Lithos 32x", "Halloween Mash-Up", "Radiant Pack RTX"], trueAnswer: "Halloween Mash-Up"),
        Question(question: "What's the most useless armor?", answers: ["Leather Armor", "Netherite Armor", "Wolf Armor", "Horse Armor"], trueAnswer: "Wolf Armor"),
        Question(question: "What was the first biome added to Minecraft?", answers: ["Plains", "Desert", "Badlands", "Snow"], trueAnswer: "Plains")
    ].shuffled()
    
    // Five Nights at Freddy's Questions.
    @State private var fiveNightsAtFreddysQuestions = [
        Question(question: "Who controls Golden Freddy?", answers: ["Cassidy", "Evan Afton", "William Afton", "Michael Afton"], trueAnswer: "Cassidy"),
        Question(question: "Who was in FNAF 2?", answers: ["Eggs Benedict", "Michael Afton", "Jeremy Fitzgerald", "Ronald Reagan"], trueAnswer: "Jeremy Fitzgerald"),
        Question(question: "What happened to Clara Afton?", answers: ["She died", "Disappeared", "Stuffed into Ballora", "None of the above"], trueAnswer: "She died"),
        Question(question: "Who is the killer of the 5 original kids?", answers: ["Mike Schmidt", "William Afton", "Herny Emily", "Cassidy"], trueAnswer: "William Afton"),
        Question(question: "Who else was in the Golden Freddy Suit?", answers: ["Jeremy", "Evan Afton", "Susie", "None of the above"], trueAnswer: "Evan Afton"),
        Question(question: "Who was taken control of by Ennard?", answers: ["William Afton", "Clara Afton", "Mike Schmidt", "Herny William"], trueAnswer: "Mike Schmidt"),
        Question(question: "How did William Afton die?", answers: ["Springtrap's springlocks", "Axe to the head", "Stabbed by Clara Afton", "Scooped"], trueAnswer: "Springtrap's springlocks"),
        Question(question: "What happened to Evan Afton?", answers: ["Died from Bite of 83'", "Passed away in a coma", "Commit Suicide", "Died inside a animatronic"], trueAnswer: "Died from Bite of 83'"),
        Question(question: "Is this game the most confusing lore to understand?", answers: ["Yes", "Maybe", "I want to stop", "None of the above"], trueAnswer: "Yes"),
        Question(question: "When was the first FNAF game made?", answers: ["Oct. 7, 2016", "Mar. 2, 2015", "Aug. 8, 2014", "Jan. 21, 2016"], trueAnswer: "Aug. 8, 2014")
    ].shuffled()
    
    // Clash Royale Questions.
    @State private var clashRoyaleQuestions = [
        Question(question: "What was the most rarest card to see in soft launch?", answers: ["Maxed Epic Cards", "Witches", "The Princess", "Goblins"], trueAnswer: "Maxed Epic Cards"),
        Question(question: "What was a main problem throughout most of Clash Royale's lifetime?", answers: ["The Chests", "Expensive Tournaments", "Clan Wars", "Gold Coins"], trueAnswer: "Gold Coins"),
        Question(question: "What was the first card to dash?", answers: ["Knight", "Spear Goblins", "Dark Prince", "Prince"], trueAnswer: "Prince"),
        Question(question: "What card is the fastest card?", answers: ["Miner", "Hog Rider", "Skeletons", "Giant Goblin"], trueAnswer: "Miner"),
        Question(question: "Which card introduce chaining attacks to Clash Royale?", answers: ["The Golden Knight", "Electro Wizard", "Electro Dragon", "None of the above"], trueAnswer: "Electro Dragon"),
        Question(question: "Which spirit once spawned 3 in 1 card placement?", answers: ["Electro Spirit", "Heal Spirit", "Fire Spirit", "Ice Spirit"], trueAnswer: "Fire Spirit"),
        Question(question: "Which card was removed premanently?", answers: ["Heal Spell", "Santa Hog", "Warmth", "Elixir Golem"], trueAnswer: "Heal Spell"),
        Question(question: "When was the first new tower troop added?", answers: ["Oct. 10, 2016", "Jan. 1, 2024", "July 5, 2019", "Dec. 29, 2023"], trueAnswer: "Jan. 1, 2024"),
        Question(question: "What happens to Cursed Troops?", answers: ["Turns to Cursed Hogs", "Becomes a Skeletons", "Turns to Cursed Goblins", "Cursed as a Skeletons For Witches"], trueAnswer: "Turns to Cursed Hogs"),
        Question(question: "Which card was left alone to rot?", answers: ["Flying Machine", "Goblin Hut", "Skeleton Guards", "Wizard"], trueAnswer: "Wizard")
    ].shuffled()
    
    // Dead Island Questions.
    @State private var deadIslandQuestions = [
        Question(question: "What song do you hear in the intro?", answers: ["Without Me", "Who Do You Voodoo", "X Gon' Give It To Ya", "Rolling In The Deep"], trueAnswer: "Who Do You Voodoo"),
        Question(question: "Where did Sam B start with his rapping career?", answers: ["New York City", "Banoi Royal Palms", "Boston", "New Orleans"], trueAnswer: "New Orleans"),
        Question(question: "What was Earl's one request in exchange for fixing up the armored vehicle?", answers: ["Take Jin Away", "Defend the mechanic", "Bring some tools", "Bring back some food"], trueAnswer: "Take Jin Away"),
        Question(question: "What caused Logan Carter's NFL career to plummet?", answers: ["Street Racing", "Cockiness", "His addiction and ego", "Going to prison"], trueAnswer: "His addiction and ego"),
        Question(question: "Why was Xian Mei sent to Banoi Royal Palms Island?", answers: ["To watch the Westerners", "To look for a criminal", "Survive a zombie apocalypse", "None of the above"], trueAnswer: "To watch the Westerners"),
        Question(question: "Why couldn't the child molestor Purna shot couldn't be touched?", answers: ["Incredibly rich", "His wealth and connections", "He was a manipulator", "He had many lawyers"], trueAnswer: "His wealth and connections"),
        Question(question: "Which island did the heroes meet?", answers: ["Maui", "Banoi Royal Palms", "New Guinea", "Bora Bora"], trueAnswer: "Banoi Royal Palms"),
        Question(question: "Who is the first human that asked as a main mission?", answers: ["Xian Mei", "Earl", "Mother Helen", "Sinamoi"], trueAnswer: "Sinamoi"),
        Question(question: "Where was the radio man trapped in?", answers: ["A cabin", "The prison", "The hotel", "A club"], trueAnswer: "The prison"),
        Question(question: "What are the infected with their humanity called?", answers: ["Numen", "Autophage", "Blood Type B", "None of the above"], trueAnswer: "Numen")
    ].shuffled()
    
    // Brawl Stars Questions.
    @State private var brawlStarsQuestions = [
        Question(question: "What was the first project name of Brawl Stars?", answers: ["Brawlers", "Slug Fest", "Project Laser", "Starr Park"], trueAnswer: "Project Laser"),
        Question(question: "Who was once the worst brawler to pick in 2017?", answers: ["Ricochet", "Shelly", "Bull", "Colt"], trueAnswer: "Ricochet"),
        Question(question: "What fan was put in the Brawl Stars game?", answers: ["Edgar", "Hank", "Grom", "Colette"], trueAnswer: "Colette"),
        Question(question: "Which brawler had one of the least skins then?", answers: ["Jessie", "Pam", "Colt", "Shelly"], trueAnswer: "Pam"),
        Question(question: "When were gadgets added to the game?", answers: ["Mar. 31, 2025", "Feb. 19, 2020", "Mar. 26, 2020", "May 20, 2020"], trueAnswer: "Mar. 26, 2020"),
        Question(question: "Which robot was once a brawler?", answers: ["Melee Robot", "Ranged Robot", "Mini Robot", "Ricochet"], trueAnswer: "Mini Robot"),
        Question(question: "Which gadget allows teleportation?", answers: ["Power Surge (Before 2022)", "Honey Coat", "Fast Forward", "Silver Bullet"], trueAnswer: "Power Surge (Before 2022)"),
        Question(question: "What was one/only star power that was removed?", answers: ["Plant Life", "Rude Sands", "Extra Life", "Mama's Hug"], trueAnswer: "Extra Life"),
        Question(question: "Who was the first Chromatic brawler to have Hypercharge?", answers: ["Dynamike", "Buzz", "Pearl", "Charlie"], trueAnswer: "Pearl"),
        Question(question: "What would being a Star Player once give?", answers: ["Star Points", "Star Player Tokens", "Coins", "10 Extra Experience"], trueAnswer: "Star Player Tokens")
    ].shuffled()
    
    // Halo Questions.
    @State private var haloQuestions = [
        Question(question: "What year is Halo:CE set in?", answers: ["The 30th Century", "The 26th Century", "The 27th Century", "The 10th Century"], trueAnswer: "The 26th Century"),
        Question(question: "Who dies in a cutscene from a cursed M6D?", answers: ["Pvt. Mendoza", "Sgt. Jacob Keyes", "Pvt. Bisenti", "SSgt. Johnson"], trueAnswer: "Sgt. Jacob Keyes"),
        Question(question: "Why does the Convenant believe in the prophecy?", answers: ["To be Supreme", "To create a Flood", "To stop the Flood", "Stopping Floods"], trueAnswer: "To stop the Flood"),
        Question(question: "What events of Halo came first?", answers: ["Halo: CE", "Halo 3", "Halo Wars", "Halo: Reach"], trueAnswer: "Halo Wars"),
        Question(question: "Can you die in mid-air with land underneath in Halo: CE?", answers: ["No", "Yes", "Maybe", "Skip"], trueAnswer: "Yes"),
        Question(question: "When were loadouts created?", answers: ["Halo 3", "Halo: Reach", "Halo Infinite", "Halo 4"], trueAnswer: "Halo: Reach"),
        Question(question: "What was the main protagonist's real name?", answers: ["John", "John Harper", "Tord", "James Bond"], trueAnswer: "John"),
        Question(question: "When was sprinting introduced?", answers: ["Since Halo: Reach", "Since Halo 4", "Since Halo 2", "Since Halo 5"], trueAnswer: "Since Halo: Reach"),
        Question(question: "Who replaced Cortana?", answers: ["The Weapon", "Cortana 2.0", "Christina Berrington", "Charlie"], trueAnswer: "The Weapon"),
        Question(question: "Who was a potnetial Spartan?", answers: ["Noble 8", "Noble SSgt. Johnson", "John", "Noble 6"], trueAnswer: "Noble 6")
    ].shuffled()
    
    // Super Mario Brothers Questions.
    @State private var superMarioBrosQuestions = [
        Question(question: "When was the first Super Mario game?", answers: ["April 1980", "Sep. 13, 1985", "May 18, 1990", "Nov. 12, 1960"], trueAnswer: "Sep. 13, 1985"),
        Question(question: "When was Luigi given his name?", answers: ["Sep. 21, 2012", "Oct. 13, 1995", "Jan. 12, 2001", "Sep. 2015"], trueAnswer: "Sep. 2015"),
        Question(question: "What game introduced flying?", answers: ["Super Mario Bros", "Super Mario World", "Super Mario Bros 3", "Super Mario 64"], trueAnswer: "Super Mario Bros 3"),
        Question(question: "What game isn't even talked or remembered?", answers: ["New Super Mario Bros U", "Super Mario 3D Land", "New Super Mario Bros 2", "Super Mario Bros"], trueAnswer: "Super Mario 3D Land"),
        Question(question: "What game introduce the Propeller Mushroom?", answers: ["New Super Mario Bros 2", "Super Mario Bros 2", "New Super Mario Bros Wii", "New Super Mario Bros U Del."], trueAnswer: "New Super Mario Bros Wii"),
        Question(question: "What game increase max players to 4 First?", answers: ["Super Mario Bros 2", "New Super Maio Bros Wii", "Super Mario Bros 3D World", "Super Mario World"], trueAnswer: "Super Mario Bros 3D World"),
        Question(question: "When were Boos introduced?", answers: ["Nov. 26, 1989", "Oct. 23, 1988", "Sep. 21, 2021", "Sep. 19, 1991"], trueAnswer: "Oct. 23, 1988"),
        Question(question: "How do we get more Blocks?", answers: ["Toads", "Stone Cutted", "Goombas", "Hand crafted"], trueAnswer: "Toads"),
        Question(question: "What was Luigi once called?", answers: ["Green Jump Man", "Booger", "Green Mario", "Number 2"], trueAnswer: "Green Mario"),
        Question(question: "Are we the killers or is Mario the killer?", answers: ["Luigi is the killer", "Mario", "We are", "I Don't Know"], trueAnswer: "I Don't Know")
    ].shuffled()
    
    // Pokemon Questions.
    @State private var pokemonQuestions = [
        Question(question: "How many different forms does Arceus have?", answers: ["Sixty Eight", "Eighteen", "Five", "Twenty"], trueAnswer: "Eighteen"),
        Question(question: "Who is the main pokemon in the pokemon shows?", answers: ["Mew", "Drio", "Eevee", "Pikachu"], trueAnswer: "Pikachu"),
        Question(question: "What game was Lavender Town's creepypasta in?", answers: ["Pokemon: Red and Green", "Pokemon: Ruby/Sapphire", "Pokemon: Black/White", "Pokemon: Red and Blue"], trueAnswer: "Pokemon: Red and Green"),
        Question(question: "What did Lavender Town contain?", answers: ["A Graveyard of Pokemons", "A Secret PokeCenter", "A Gym Leader", "A Hint of Depression"], trueAnswer: "A Graveyard of Pokemons"),
        Question(question: "How many types of pokemon are there?", answers: ["Eighteen", "Fourteen", "Twenty", "Nineteen"], trueAnswer: "Nineteen"),
        Question(question: "Which pokemon type stands out the most?", answers: ["Metal types", "Dark types", "Ground Types", "Stellar type"], trueAnswer: "Stellar type"),
        Question(question: "What team you face against in Alola Island?", answers: ["Skull Team", "Team Plasma", "Team Rocket", "Team Magma"], trueAnswer: "Skull Team"),
        Question(question: "What villain team is the oldest?", answers: ["Team Flare", "Team Plasma", "Team Galactic", "Team Rocket"], trueAnswer: "Team Rocket"),
        Question(question: "What is pikachu's ID?", answers: ["Twenty Two", "Twenty Six", "Twenty Five", "Twenty One"], trueAnswer: "Twenty Five"),
        Question(question: "What pokemon has this ID? (5^3 * 10 + 29 - 12)?", answers: ["Plusle", "Sectera", "Arceus", "Meowstic"], trueAnswer: "Sectera")
    ].shuffled()
    
    // The Test Questions (Some questions will be different!)
    @State private var testQuestions = [
        Question(question: "What could happen if you give the contracts to the Devil in Cuphead?", answers: ["You're released", "He takes your soul", "He kills you", "You fight with the Devil"].shuffled(), trueAnswer: "He takes your soul"),
        Question(question: "When was mounts introduced into Terraria (Hint: Chocolate)?", answers: ["Apr. 19, 2017", "May 23rd, 2011", "Dec. 20, 2013", "Nov. 15, 2016"].shuffled(), trueAnswer: "May 23rd, 2011"),
        Question(question: "Which item permanently increase your mana?", answers: ["Crystal Star", "Life Fruit", "Book of MP", "Mana Crystal"].shuffled(), trueAnswer: "Mana Crystal"),
        Question(question: "Who's the hardest boss?", answers: ["Skeletron Prime", "Moon Lord", "Ocram", "Lunatic Cultist"].shuffled(), trueAnswer: "Moon Lord"),
        Question(question: "What could the Neighbor be hinding inside his basement?", answers: ["An amusement park", "A dead body", "We may never know", "Maybe a beast"].shuffled(), trueAnswer: "We may never know"),
        Question(question: "What biome corrupts the world?", answers: ["Hallowed", "Desert", "Jungle", "Crimson"].shuffled(), trueAnswer: "Crimson"),
        Question(question: "What connect is there between The Wall of Flesh and The Guide?", answers: ["They're the same", "They're brothers", "They're different", "Neither"].shuffled(), trueAnswer: "They're the same"),
        Question(question: "Who is the Moon Lord?", answers: ["A Squid?", "Lunatic Cultist's God", "Book of MP", "Cthulhu"].shuffled(), trueAnswer: "Cthulhu"),
        Question(question: "What is the Lunatic Cultist theory?", answers: ["Keep Away Moon Lord", "Summoning Moon Lord", "Stopping the Lunar Event", "I don't Know"].shuffled(), trueAnswer: "Summoning Moon Lord"),
        Question(question: "Which item permanently increases your health?", answers: ["Life Fruit/Heart Crystal", "Mana Crystal/Book of MP", "Greater Healing Potion", "Life Force Potion"].shuffled(), trueAnswer: "Life Fruit/Heart Crystal"),
        Question(question: "What made Menendez grew hatred towards the United States?", answers: ["The killing of his people", "Wasn't supported", "American Abuser", "Destruction of his cartel"].shuffled(), trueAnswer: "The killing of his people"),
        Question(question: "Where is this line from: '50,000 people user to live here, now it's a ghost town'?", answers: ["CoD4: Modern Warfare", "Black Ops 4", "CoD: Modern Warfare 2", "CoD: Modern Warfare III"].shuffled(), trueAnswer: "CoD4: Modern Warfare"),
        Question(question: "What does the Doom guy do?", answers: ["Kills Aliens", "Slayer of Demons", "Annihilates all things", "Just a Sigma man"].shuffled(), trueAnswer: "Slayer of Demons"),
        Question(question: "What was the point of No Russian?", answers: ["To cause terrorism Russia", "To make a scene", "No Idea", "To blame on the enemy (U.S.)"].shuffled(), trueAnswer: "To blame on the enemy (U.S.)"),
        Question(question: "When does Soap die?", answers: ["Just Like Old Times", "Black Tuesday", "The Gulag", "Blood Brothers"].shuffled(), trueAnswer: "Blood Brothers"),
        Question(question: "What mission is Alex Mason's dependent on you?", answers: ["Suffer With Me", "Old Wounds", "Judgement Day", "Phyrrhic Victory"].shuffled(), trueAnswer: "Suffer With Me"),
        Question(question: "What version of Wii Sports was first sold to the United States?", answers: ["Verion 1.01", "Version 1.05", "Version 1.00", "Version 1.02"].shuffled(), trueAnswer: "Version 1.00"),
        Question(question: "What perk gave you 6 perks?", answers: ["Who's Who?", "Electric Cherry", "Tombstone", "Juggernog"].shuffled(), trueAnswer: "Tombstone"),
        Question(question: "When was Dempsey introduced in the Zombies story?", answers: ["Since Shi No Numa", "Since Der Riese", "Since Verruckt", "Since Origins"].shuffled(), trueAnswer: "Since Verruckt"),
        Question(question: "Which Mod was shut down for 'Piracy' reasons?", answers: ["BOIII", "SM2", "Steam", "Custom BO3 maps"].shuffled(), trueAnswer: "SM2"),
        Question(question: "Who is the final boss?", answers: ["Technoblade", "Ender Dragon", "Warden", "Wither"].shuffled(), trueAnswer: "Ender Dragon"),
        Question(question: "When were horses introduced to Minecraft?", answers: ["May 23, 2014", "Dec. 31, 2020", "July 1, 2016", "July 1 2011"].shuffled(), trueAnswer: "July 1, 2016"),
        Question(question: "Which items permanently increases your stats?", answers: ["None", "A Enchanted Book", "Water breathing Potion", "Instant Health Potion"].shuffled(), trueAnswer: "None"),
        Question(question: "What day was the first Minecon?", answers: ["Oct. 15, 2023", "Aug. 31, 2010", "Jan. 16, 2008", "Sep. 28, 2019"].shuffled(), trueAnswer: "Aug. 31, 2010"),
        Question(question: "What boss in the Hollow Knight game inflicts self harm?", answers: ["The Radiance", "The Dreamers", "The Hollow Knight", "The Knight"].shuffled(), trueAnswer: "The Hollow Knight"),
        Question(question: "What biome spreads and infects other blocks?", answers: ["Cave", "Desert", "Plains", "Deep Dark"].shuffled(), trueAnswer: "Deep Dark"),
        Question(question: "What versions have a tutorial world?", answers: ["Legacy Edition", "Beta", "Alpha", "Bedrock"].shuffled(), trueAnswer: "Legacy Edition"),
        Question(question: "What texture pack came from Legacy Edition?", answers: ["John Smith Legacy", "Lithos 32x", "Halloween Mash-Up", "Radiant Pack RTX"].shuffled(), trueAnswer: "Halloween Mash-Up"),
        Question(question: "Who do you play as in BioShock 2?", answers: ["A Big Daddy", "A Little Child", "Subject Delta", "Subject Charlie"].shuffled(), trueAnswer: "Subject Delta"),
        Question(question: "What was the first biome added to Minecraft?", answers: ["Plains", "Desert", "Badlands", "Snow"].shuffled(), trueAnswer: "Plains"),
        Question(question: "Who controls Golden Freddy?", answers: ["Cassidy", "Evan Afton", "William Afton", "Michael Afton"].shuffled(), trueAnswer: "Cassidy"),
        Question(question: "Who was in FNAF 2?", answers: ["Eggs Benedict", "Michael Afton", "Jeremy Fitzgerald", "Ronald Reagan"].shuffled(), trueAnswer: "Jeremy Fitzgerald"),
        Question(question: "What happened to Clara Afton?", answers: ["She died", "Disappeared", "Stuffed into Ballora", "None of the above"].shuffled(), trueAnswer: "She died"),
        Question(question: "Who was the first person to beat Tetris?", answers: ["Scott Cawthon", "Willis Gibson", "MatPat", "VanossGaming"].shuffled(), trueAnswer: "Willis Gibson"),
        Question(question: "Who else was in the Golden Freddy Suit?", answers: ["Jeremy", "Evan Afton", "Susie", "None of the above"].shuffled(), trueAnswer: "Evan Afton"),
        Question(question: "Who was taken control of by Ennard?", answers: ["William Afton", "Clara Afton", "Mike Schmidt", "Herny William"].shuffled(), trueAnswer: "Mike Schmidt"),
        Question(question: "How did William Afton die?", answers: ["Springtrap's springlocks", "Axe to the head", "Stabbed by Clara Afton", "Scooped"].shuffled(), trueAnswer: "Springtrap's sprinlocks"),
        Question(question: "What season created a new map that's different from Chapter 1?", answers: ["Season 10, Chapter 1", "Season 8, Chapter 2", "Seasn 4, Chapter 4", "Season 6 Chapter 3"].shuffled(), trueAnswer: "Season 10, Chapter 1"),
        Question(question: "Is this game the most confusing lore to understand?", answers: ["Yes", "Maybe", "I want to stop", "None of the above"].shuffled(), trueAnswer: "Yes"),
        Question(question: "When was the first FNAF game made?", answers: ["Oct. 7, 2016", "Mar. 2, 2015", "Aug. 8, 2014", "Jan. 21, 2016"].shuffled(), trueAnswer: "Aug. 8, 2014"),
        Question(question: "What game is Retro Bowl trying to become?", answers: ["A Football game", "Madden 1970s", "Tecmo Super Bowl 2.0", "Tecmo Bowl 2.0"].shuffled(), trueAnswer: "Tecmo Bowl 2.0"),
        Question(question: "What was a main problem throughout most of Clash Royale's lifetime?", answers: ["The Chests", "Expensive Tournaments", "Clan Wars", "Gold Coins"].shuffled(), trueAnswer: "Gold Coins"),
        Question(question: "What was the first card to dash?", answers: ["Knight", "Spear Goblins", "Dark Prince", "Prince"].shuffled(), trueAnswer: "Prince"),
        Question(question: "What card is the fastest card?", answers: ["Miner", "Hog Rider", "Skeletons", "Giant Goblin"].shuffled(), trueAnswer: "Miner"),
        Question(question: "Which card introduce chaining attacks to Clash Royale?", answers: ["The Golden Knight", "Electro Wizard", "Electro Dragon", "None of the above"].shuffled(), trueAnswer: "Electro Dragon"),
        Question(question: "Which spirit once spawned 3 in 1 card placement?", answers: ["Electro Spirit", "Heal Spirit", "Fire Sirit", "Ice Spirit"].shuffled(), trueAnswer: "Fire Spirit"),
        Question(question: "Which card was removed premanently?", answers: ["Heal Spell", "Santa Hog", "Warmth", "Elixir Golem"].shuffled(), trueAnswer: "Heal Spell"),
        Question(question: "When was the first new tower troop added?", answers: ["Oct. 10, 2016", "Jan. 1, 2024", "July 5, 2019", "Dec. 29, 2023"].shuffled(), trueAnswer: "Jan. 1, 2024"),
        Question(question: "What happens to Cursed Troops?", answers: ["Turns to Cursed Hogs", "Becomes Skeletons", "Turns to Cursed Goblins", "Cursed as a Skeletons For Witches"].shuffled(), trueAnswer: "Turns to Cursed Hogs"),
        Question(question: "Which characters can you kill in GTA V?", answers: ["Michael, Trevor, & Knox", "Paul, Franklin, & Knox", "Trevor, Knox, & Paul", "None of the Above"].shuffled(), trueAnswer: "Michael, Trevor, & Knox"),
        Question(question: "What song do you hear in the intro?", answers: ["Without Me", "Who Do You Voodoo", "X Gon' Give It To Ya", "Rolling In The Deep"].shuffled(), trueAnswer: "Who Do You Voodoo"),
        Question(question: "Where did Sam B start with his rapping career?", answers: ["New York City", "Banoi Royal Palms", "Boston", "New Orleans"].shuffled(), trueAnswer: "New Orleans"),
        Question(question: "What was Luigi most scared of?", answers: ["King Boo", "Boos", "Haunted Houses", "Mario"].shuffled(), trueAnswer: "King Boo"),
        Question(question: "What caused Logan Carter's NFL career to plummet?", answers: ["Street Racing", "Cockiness", "His addiction and ego", "Going to prison"].shuffled(), trueAnswer: "His addiction and ego"),
        Question(question: "Why was Xian Mei sent to Banoi Royal Palms Island?", answers: ["To watch the Westerners", "To look for a criminal", "Survive a zombie apocalypse", "None of the above"].shuffled(), trueAnswer: "To watch the Westerners"),
        Question(question: "Why couldn't the child molestor Purna shot couldn't be touched?", answers: ["Incredibly rich", "His wealth and connections", "He was a manipulator", "He had many lawyers"].shuffled(), trueAnswer: "His wealth and connections"),
        Question(question: "Who was put in a similar situation as Lee Everett?", answers: ["Tennessee", "Clementine", "Glenn Rhee", "Rick Grimes"].shuffled(), trueAnswer: "Clementine"),
        Question(question: "Who is the first human that asked as a main mission?", answers: ["Xian Mei", "Earl", "Mother Helen", "Sinamoi"].shuffled(), trueAnswer: "Sinamoi"),
        Question(question: "Where was the radio man trapped in?", answers: ["A cabin", "The prison", "The hotel", "A club"], trueAnswer: "The prison"),
        Question(question: "What are the infected with their humanity called?", answers: ["Numen", "Autophage", "Blood Type B", "None of the above"].shuffled(), trueAnswer: "Numen"),
        Question(question: "What was the first project name of Brawl Stars?", answers: ["Brawlers", "Slug Fest", "Project Laser", "Starr Park"].shuffled(), trueAnswer: "Project Laser"),
        Question(question: "Who was once the worst brawler to pick in 2017?", answers: ["Ricochet", "Shelly", "Bull", "Colt"].shuffled(), trueAnswer: "Ricochet"),
        Question(question: "What fan was put in the Brawl Stars game?", answers: ["Edgar", "Hank", "Grom", "Colette"].shuffled(), trueAnswer: "Colette"),
        Question(question: "What troop was added to Clash Royale first and then Clash of Clans soon after?", answers: ["Dragon", "Yeti", "Baby Dragon", "Bomber"].shuffled(), trueAnswer: "Baby Dragon"),
        Question(question: "When were gadgets added to the game?", answers: ["Mar. 31, 2025", "Feb. 19, 2020", "Mar. 26, 2020", "May 20, 2020"].shuffled(), trueAnswer: "Mar. 26, 2020"),
        Question(question: "Which robot was once a brawler?", answers: ["Melee Robot", "Ranged Robot", "Mini Robot", "Ricochet"].shuffled(), trueAnswer: "Mini Robot"),
        Question(question: "Which gadget allows teleportation?", answers: ["Power Surge (Before 2022)", "Honey Coat", "Fast Forward", "Silver Bullet"].shuffled(), trueAnswer: "Power Surge (Before 2022)"),
        Question(question: "What game includes Clash of Clans and Clash Royale?", answers: ["Clash Mini", "Squad Busters", "Brawl Stars", "Clash 1980s"].shuffled(), trueAnswer: "Squad Busters"),
        Question(question: "Who was the first Chromatic brawler to have Hypercharge?", answers: ["Dynamike", "Buzz", "Pearl", "Charlie"].shuffled(), trueAnswer: "Pearl"),
        Question(question: "What would being a Star Player once give?", answers: ["Star Points", "Star Player Tokens", "Coins", "10 Extra Experience"].shuffled(), trueAnswer: "Star Player Tokens"),
        Question(question: "What year is Halo:CE set in?", answers: ["The 30th Century", "The 26th Century", "The 27th Century", "The 10th Century"].shuffled(), trueAnswer: "The 26th Century"),
        Question(question: "Who dies in a cutscene from a cursed M6D?", answers: ["Pvt. Mendoza", "Sgt. Jacob Keyes", "Pvt. Bisenti", "SSgt. Johnson"].shuffled(), trueAnswer: "Sgt. Jacob Keyes"),
        Question(question: "Why does the Convenant believe in the prophecy?", answers: ["To be Supreme", "To create a Flood", "To stop the Flood", "Stopping Floods"].shuffled(), trueAnswer: "To stop the Flood"),
        Question(question: "What events of Halo came first?", answers: ["Halo: CE", "Halo 3", "Halo Wars", "Halo: Reach"].shuffled(), trueAnswer: "Halo Wars"),
        Question(question: "Can you die in mid-air with land underneath in Halo: CE?", answers: ["No", "Yes", "Maybe", "Skip"].shuffled(), trueAnswer: "Yes"),
        Question(question: "When were loadouts created?", answers: ["Halo 3", "Halo: Reach", "Halo Infinite", "Halo 4"].shuffled(), trueAnswer: "Halo: Reach"),
        Question(question: "Why did the Lotus betray her people in Warframe?", answers: ["To escape them", "To make a better law", "To protect the Tenno", "To protect the USNC"].shuffled(), trueAnswer: "To protect the Tenno"),
        Question(question: "What game allows you to do more than Scribbl.io?", answers: ["John Carter", "Gartic Phone", "Make It Meme", "Family Feud"].shuffled(), trueAnswer: "Gartic Phone"),
        Question(question: "Who replaced Cortana?", answers: ["The Weapon", "Cortana 2.0", "Christina Berrington", "Charlie"].shuffled(), trueAnswer: "The Weapon"),
        Question(question: "Who was a potnetial Spartan?", answers: ["Noble 8", "Noble SSgt. Johnson", "Master Chief", "Noble 6"].shuffled(), trueAnswer: "Noble 6"),
        Question(question: "When was the first Super Mario game?", answers: ["April 1980", "Sep. 13, 1985", "May 18, 1990", "Nov. 12, 1960"].shuffled(), trueAnswer: "Sep. 13, 1985"),
        Question(question: "When was Luigi given his name?", answers: ["Sep. 21, 2012", "Oct. 13, 1995", "Jan. 12, 2001", "Sep. 2015"].shuffled(), trueAnswer: "Sep. 2015"),
        Question(question: "What game introduced flying?", answers: ["Super Mario Bros", "Super Mario World", "Super Mario Bros 3", "Super Mario 64"].shuffled(), trueAnswer: "Super Mario Bros 3"),
        Question(question: "What game isn't even talked or remembered?", answers: ["New Super Mario Bros U", "Super Mario 3D Land", "New Super Mario Bros 2", "Super Mario Bros"].shuffled(), trueAnswer: "Super Mario 3D Land"),
        Question(question: "What character despises Sonic the most?", answers: ["Dr. Eggman", "Shadow", "Knuckles", "Amy"].shuffled(), trueAnswer: "Dr. Eggman"),
        Question(question: "What game increase max players to 4 First?", answers: ["Super Mario Bros 2", "New Super Maio Bros Wii", "Super Mario Bros 3D World", "Super Mario World"].shuffled(), trueAnswer: "Super Mario Bros 3D World"),
        Question(question: "When were Boos introduced?", answers: ["Nov. 26, 1989", "Oct. 23, 1988", "Sep. 21, 2021", "Sep. 19, 1991"].shuffled(), trueAnswer: "Oct. 23, 1988"),
        Question(question: "What game is most forgotten?", answers: ["Happy Wars", "Minecraft Legends", "Minecraft Dungeons", "Call of Duty"].shuffled(), trueAnswer: "Happy Wars"),
        Question(question: "What was Luigi once called?", answers: ["Green Jump Man", "Booger", "Green Mario", "Number 2"].shuffled(), trueAnswer: "Green Mario"),
        Question(question: "Are we the killers or is Mario the killer?", answers: ["Luigi is the killer", "Mario", "We are", "I Don't Know"].shuffled(), trueAnswer: "I Don't Know"),
        Question(question: "How many different forms does Arceus have?", answers: ["Sixty Eight", "Eighteen", "Five", "Twenty"].shuffled(), trueAnswer: "Eighteen"),
        Question(question: "Which survior gets corrupted?", answers: ["Commando", "Captain", "MEC-T", "Bandit"].shuffled(), trueAnswer: "Commando"),
        Question(question: "What game was Lavender Town's creepypasta in?", answers: ["Pokemon: Red and Green", "Pokemon: Ruby/Sapphire", "Pokemon: Black/White", "Pokemon: Red and Blue"].shuffled(), trueAnswer: "Pokemon: Red and Green"),
        Question(question: "What did Lavender Town contain?", answers: ["A Graveyard of Pokemons", "A Secret PokeCenter", "A Gym Leader", "A Hint of Depression"].shuffled(), trueAnswer: "A Graveyard of Pokemons"),
        Question(question: "How many types of pokemon are there?", answers: ["Eighteen", "Fourteen", "Twenty", "Nineteen"].shuffled(), trueAnswer: "Nineteen"),
        Question(question: "Which pokemon type stands out the most?", answers: ["Metal types", "Dark types", "Ground Types", "Stellar type"].shuffled(), trueAnswer: "Stellar type"),
        Question(question: "What team you face against in Alola Island?", answers: ["Skull Team", "Team Plasma", "Team Rocket", "Team Magma"].shuffled(), trueAnswer: "Skull Team"),
        Question(question: "What level hasn't been Verified?", answers: ["Woodkid", "Slaughterhouse", "Grief", "Tidal Wave"].shuffled(), trueAnswer: "Grief"),
        Question(question: "What is pikachu's ID?", answers: ["Twenty Two", "Twenty Six", "Twenty Five", "Twenty One"].shuffled(), trueAnswer: "Twenty Five"),
        Question(question: "What pokemon has this ID? (5^3 * 10 + 29 - 12)?", answers: ["Plusle", "Sectera", "Arceus", "Meowstic"].shuffled(), trueAnswer: "Sectera")
    ].shuffled()
    
    var body: some View {
        
        NavigationView {
            ZStack {
                Image("quizBackground")
                
                VStack {
                    // Shows the score.
                    if questionNum == questionCap && userAnswered {
                        Text("Let's see those results!")
                    } else if questionNum > questionCap - 3 {
                        if testing {
                            if questionNum > questionCap - 1 {
                                Text("Just 1 more question left!!")
                            } else {
                                Text("Only \(questionCap + 1 - questionNum) questions left!")
                            }
                        } else {
                            Text("You're almost There!")
                        }
                    } else if testing && questionNum > questionCap - 10 {
                        Text("Just a few more questions!")
                    } else if testing && questionNum > questionCap - 20 {
                        Text("You're Almost There!")
                    } else if !testing {
                        Text("Score: \(score)")
                    }
                    
                    // Puts both the question number and the question together
                    VStack {
                        // Shows question number.
                        Text("Question #\(questionNum + 1): ")
                            .padding(.top, -33)
                        // Shows the question.
                        Text("\(currentQuestions()[questionNum].question)")
                            .multilineTextAlignment(.center)
                    }
                    .frame(width: 350, height: 90)
                    .padding()
                    .background(.orange)
                    .cornerRadius(10)
                    
                    // I don't think this if statement will work but I'll leave it there in case (rather be safe than sorry). I am not putting comments inside the ForEach to keep it organized but I will leave it in the Button.
                    if questionNum != questionCap || !userAnswered {
                        ForEach(currentQuestions()[questionNum].answers.indices, id: \.self) { index in
                            Button(action: {
                                // Will not activate the answerCheck function when the user has already answered.
                                if !userAnswered {
                                    answerIndex = index
                                    answerCheck(answer: currentQuestions()[questionNum].answers[index])
                                }
                            }, label: {
                                // Shows the answers. The background changes color depending if it's right or not. The text color will change from the foregroundColor modifier if the user clicked on it (shows what the user answer). Thinking about making an if statement in here to only show the answer to be right or wrong, depending on the user's choice, but it is only for the Test part of this app.
                                if !testing {
                                    Text(currentQuestions()[questionNum].answers[index])
                                        .frame(width: 225, height: 35)
                                        .padding(20)
                                        .background(userAnswered ? (currentQuestions()[questionNum].answers[index] == currentQuestions()[questionNum].trueAnswer ? .green : .red) : .blue)
                                        .bold(true)
                                        .font(.system(size: 16))
                                        .foregroundColor(answerIndex == index ? (userAnswered ? .black : .white) : .white)
                                        .cornerRadius(25)
                                } else {
                                    Text(currentQuestions()[questionNum].answers[index])
                                        .frame(width: 225, height: 35)
                                        .padding(20)
                                        .background(userAnswered ? (answerIndex == index ? (currentQuestions()[questionNum].answers[index] == currentQuestions()[questionNum].trueAnswer ? .green : .red) : .blue) : .blue)
                                        .bold(true)
                                        .font(.system(size: 16))
                                        .foregroundColor(.white)
                                        .cornerRadius(25)
                                }
                            })
                        }
                    }
                    
                    // Creates the continue button to allow the user to move on, giving them a chance to look at the answers and the question. The else if statement creates a button to view the results (the score).
                    if userAnswered && questionNum != questionCap {
                        Button(action: {
                            moveOn()
                        }, label: {
                            Text("Continue >>")
                                .frame(width: 175, height: 30)
                                .background(.blue)
                                .foregroundColor(.white)
                                .cornerRadius(7)
                        })
                    } else if userAnswered && questionNum == questionCap {
                        HStack {
                            // Sends the user back to the StartView. This is just in case the user wants to try a different quiz and not really care about their grade. This button will only appear when the user isn't testing.
                            if !testing {
                                NavigationLink(destination: StartView().navigationBarBackButtonHidden(true), label: {
                                    Text("Go Back")
                                })
                                .frame(width: 130, height: 70)
                                .background(.blue)
                                .foregroundColor(.white)
                                .cornerRadius(7)
                            }
                            
                            // Sends the user to the EndResultsView. The EndResultsView shows the score, grade, and a text to try and motivate the user it bit or a lot.
                            NavigationLink(destination: EndResultsView(testing: testing, score: score, selectedQuizSave: selectedQuiz).navigationBarBackButtonHidden(true), label: {
                                Text("See Results")
                            })
                            .frame(width: 130, height: 70)
                            .background(.blue)
                            .foregroundColor(.white)
                            .cornerRadius(7)
                        }
                    }
                }
            }
        }
    }
    
    // Whenever the user wants to pick a different Video Game to be quized on, the questions will change and this function will change what questions will be asked of the user.
    private func currentQuestions() -> [Question] {
            switch selectedQuiz {
            case "Terraria":
                // Selects Terraria Questions
                testing = false
                questionCap = 9
                return terrariaQuestions
            case "Call of Duty":
                // Selects Call of Duty Questions
                testing = false
                questionCap = 9
                return callOfDutyQuestions
            case "Minecraft":
                // Selects Minecraft Questions
                testing = false
                questionCap = 9
                return minecraftQuestions
            case "Five Nights At Freddy's":
                // Selects Five Nights at Freddy's Questions
                testing = false
                questionCap = 9
                return fiveNightsAtFreddysQuestions
            case "Clash Royale":
                // Selects Clash Royale Questions
                testing = false
                questionCap = 9
                return clashRoyaleQuestions
            case "Dead Island":
                // Selects Dead Island Questions
                testing = false
                questionCap = 9
                return deadIslandQuestions
            case "Brawl Stars":
                // Selects Brawl Stars Questions
                testing = false
                questionCap = 9
                return brawlStarsQuestions
            case "Halo":
                // Selects Halo Questions
                testing = false
                questionCap = 9
                return haloQuestions
            case "Super Mario Bros":
                // Selects Super Mario Brothers Questions
                testing = false
                questionCap = 9
                return superMarioBrosQuestions
            case "Pokemon":
                // Selects Pokemon Questions
                testing = false
                questionCap = 9
                return pokemonQuestions
            case "Testing Time":
                // Selects the test questions
                testing = true
                questionCap = 99
                return testQuestions
            default:
                // If another was chosen, the preview (and phone) will crash
                return []
            }
        }
    
    // Depending on the question, it will change the question from index 0 to 9 which means from Question 1 to 10. Although, the questions are being shuffled to randomize the questions.
    private func currentQuestion() -> Question {
            return currentQuestions()[questionNum]
        }
    
    // Checks if the answer is correct or not. If it's correct, the score will be added.
    func answerCheck (answer: String) {
        // Checks if the answer is correct.
        if answer == currentQuestions()[questionNum].trueAnswer {
            // Adds score by 1
            score += 1
        }
        
        // This Boolean Variable will be set to true for disabling multiple choices after answering wrong. Not just that, it will also create another button which is explained with the Continue button.
        userAnswered = true
    }
    
    // Makes the user move on with the quiz, onto the next question. Activates after the user clicks on the Continue button.
    func moveOn () {
        // If the questionNum (which is an index) equals 9, the choices and continue button won't appear but a different button will. If the questionNum variable doesn't equal 9, it will be added by 1 and the userAnswered variable is set to false to allow the user to pick another answer for a different question.
        if questionNum == questionCap {
            // Immedietely returns to the body.
            return
        } else {
            // Add questionNum by 1 and changes the userAnswer to false.
            questionNum += 1
            userAnswered = false
        }
    }
}

#Preview {
    // Requires a parameter which will receive what video game the user wants to be tested on.
    ContentView(selectedQuiz: "Terraria")
}
