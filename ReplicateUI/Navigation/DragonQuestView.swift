//
//  DragonQuestView.swift
//  ReplicateUI
//
//  Created by Damian Jardim on 4/22/25.
//

/*
 
 Real-World Exercise #1: (🎮 GAME MODE ACTIVATED)
 
 🎯 STORY: You're building “Dragon Quest Jr.” – a SwiftUI storybook app. The hero starts on a “Home” page with a big shiny sword 🗡️ button. Tapping it should take you to the "BattleView", where the dragon awaits! 😱
 👉 Task:
 Build this in SwiftUI using NavigationStack and NavigationLink. Use an image or a styled button instead of the default blue text link. Make it feel fun and magical.
 🎨 Bonus: Add a title on the second screen that says “The Dragon Appears!”
 Write your SwiftUI code for this small app (just two views),
 
 
 3. Customizable Color (Stretch Goal!)
 Let’s say you want the fallback to look different, or allow the tint color to be passed in.
 
 4. add a fallback image
 
 fix:
 Missing .aspectRatio = Squished Symbol Risk
 
 6. adding light and dark variants in the assset catalog
 
 7. set image to universal or IOS in asset properties
 
 8. check the checkbox next to your apps target in the inspector
 
 9. extract into component / View
 
 Other suggestions in the future
 
 You control the assets tightly
 - Image("name") is fine
 It's a user-uploaded or remote image
 - Use AsyncImage or UIImage(named:) with fallback
 You want a fallback
 - Wrap in if let with UIImage(named:)
 You want simplicity and guaranteed rendering
 - Use Image(systemName:)
 
 -------------------------
 
 Challenge:  "sheet"
 
 Modern apps don’t always push to a new page. Sometimes they slide a new view from the bottom, like showing a spell book in battle. That’s called a sheet.
 🔮 Modify your BattleView so that a button lets you present a sheet (not push) with a new SpellBookView.
 Here’s the behavior:
 When tapped, the sheet slides in from the bottom
 The sheet has a close button (or swipe-to-dismiss)
 SpellBookView shows a list of magical spells (you can fake this with strings like "Fireball", "Freeze", etc.)
 
 */

import SwiftUI

struct DragonQuestView: View {
    var body: some View {
        
        NavigationStack(){
            VStack{
                NavigationLink{
                    BattleView()
                }label:{
                    ActionShape()
                }
            }.navigationTitle("Dragon Quest Jr.")
        }
    }
}

struct BattleView: View {
    
    var body: some View {
        VStack{
            Spacer()
            
            Section{
                Text("/\\\\--/\\")
                Text("( o.o )")
                Text("> ^ <")
            }
            .font(.system(size: 26, weight: .medium))
            .monospaced()
            
            Text("Dracarys !!!").font(.largeTitle).fontWeight(.medium).padding(.top)
            Spacer()
        }.navigationTitle("The Dragon Appears!")
    }
}

struct ActionShape: View {
    
    var body: some View {
        // ## SNIPPET
        RoundedRectangle(cornerRadius: 20)
            .fill(Color.red.opacity(1.0))
            .frame(width: 200, height: 200)
            .shadow(color: Color.black.opacity(0.2), radius: 2.0, x: 2, y: 2)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.black, lineWidth: 1)
            )
            .overlay {
                ResilientImage(imageName: "sword3", fallbackSystemName: "exclamationmark.triangle")
                    .tint(Color.white)
                    .scaledToFit()
                    .padding(40)
                
            }
    }
}

// UIImage vs Image - why use it like this ?
struct ResilientImage: View {
    let imageName: String
    let fallbackSystemName: String
    var tint: Color = .white
    
    var body: some View {
        
        if let uiImage = UIImage(named: imageName) {
            Image(uiImage: uiImage)
                .resizable()
        } else {
            // show fallback or warning
            Image(systemName: fallbackSystemName)
                .resizable()
                .scaledToFit()
                .foregroundColor(tint)
        }
        
    }
}


/*
 challenge what is wrong with this code -
 */
struct MagicButton: View {
    var body: some View {
        
        
        Button {
            // action
        } label: {
            Image(systemName: "swift")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height:200)
        }
    }
}

struct MagicButtonContainerView: View {
    
    @State private var shouldPresentSheet = false
    
    var body: some View {
        
        VStack{
            Text("MagicButtonContainerView")
            Button("toggle"){
                shouldPresentSheet.toggle()
            }
            
            .sheet(isPresented: $shouldPresentSheet){
                print("Sheet dismissed")
            } content: {
                Circle().scaledToFit().frame(width: 200, height: 200)
            }
        }
        .padding()

    }
    
}

struct AddArticleView: View {
    @Environment(\.dismiss) private var dismiss
    
    @State var title: String = ""
    
    var body: some View {
        VStack(spacing: 10) {
            Text("Add a new article")
                .font(.title)
            TextField(text: $title, prompt: Text("Title of the article")) {
                Text("Title")
            }
            
            HStack {
                Button("Cancel") {
                    // Cancel saving and dismiss.
                    dismiss()
                }
                Spacer()
                Button("Confirm") {
                    // Save the article and dismiss.
                    dismiss()
                }
            }
        }
        .padding(20)
        .frame(width: 300, height: 200)
    }
}



#Preview {
//    DragonQuestView()
    MagicButtonContainerView()
    
}
