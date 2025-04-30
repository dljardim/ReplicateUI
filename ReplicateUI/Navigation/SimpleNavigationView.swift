import SwiftUI

struct EzNav: View {
    var body: some View {
        
        NavigationStack {
            NavigationLink("Red"){
                Text("thi sis adetail page")
            }
            
        }.navigationTitle("Home")
    }
}


struct EzNavBackground: View {
    var body: some View {
        
        
        NavigationStack {
            // parent page with link to detail view
            NavigationLink("Red"){
                // detail view
//                Text("detail page")
                EzNavDetailView(bgColor: Color.red, textColor: Color.white)
            }
            
        }.navigationTitle("Home")
    }
    
}

struct EzNavDetailView: View {
    let bgColor:Color
    let textColor:Color
    
    var body: some View {
        ZStack{
            bgColor.ignoresSafeArea()
            
            VStack{
                Text("detail view - \(bgColor.description)")
            }
        }
    }
}


struct NavWithDestinationModifier: View {
    var body: some View {
        NavigationStack {
            VStack{
                NavigationLink("Go to detail", value: "DetailView")
            }
            .navigationDestination(for: String.self){value in
                    Text("Detail View: \(value)")
            }
            .navigationTitle("Home")
        }
    }
}


enum Route {
    case profile
    case settings
    case help
}

struct BasicNavigationExample: View {
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            List {
                NavigationLink("Profile", value: Route.profile)
                NavigationLink("Settings", value: Route.settings)
                NavigationLink("Help", value: Route.help)
            }
            .navigationDestination(for: Route.self) { route in
                switch route {
                    case .profile:
                        Text("Profile View")
                    case .settings:
                        Text("Settings View")
                    case .help:
                        Text("Help View")
                }
            }
            .navigationTitle("Home")
        }
    }
}

#Preview {

//    EzNav()
//    EzNavBackground()
//    NavWithDestinationModifier()
    BasicNavigationExample()
}

/*
 ## GRADIENT
 ## BACKGROUND
 */
