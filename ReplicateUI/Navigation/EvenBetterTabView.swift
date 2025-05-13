//
//  EvenBetterTabView.swift
//  ReplicateUI
//
//  Created by Damian Jardim on 5/6/25.
//

import SwiftUI


struct ResponsiveTabView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        GeometryReader { geometry in
            let isCompact = geometry.size.width < 400
            
            TabView(selection: $selectedTab) {
                Text("Home View")
                    .tag(0)
                
                Text("Profile View")
                    .tag(1)
                
                Text("Settings View")
                    .tag(2)
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .overlay(alignment: .bottom) {
                HStack(spacing: isCompact ? 10 : 40) {
                    tabButton(index: 0, icon: "house.fill", label: "Home", isCompact: isCompact)
                    tabButton(index: 1, icon: "person.crop.circle", label: "Profile", isCompact: isCompact)
                    tabButton(index: 2, icon: "gearshape", label: "Settings", isCompact: isCompact)
                }
                .padding()
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding(.horizontal)
            }
        }
    }
    
    func tabButton(index: Int, icon: String, label: String, isCompact: Bool) -> some View {
        Button {
            withAnimation {
                selectedTab = index
            }
        } label: {
            VStack {
                Image(systemName: icon)
                    .font(.system(size: isCompact ? 18 : 24))
                if !isCompact {
                    Text(label)
                        .font(.caption)
                }
            }
            .foregroundColor(selectedTab == index ? .blue : .gray)
        }
        .frame(maxWidth: .infinity)
    }
}


struct AnimatedTabView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        ZStack {
            Group {
                switch selectedTab {
                    case 0:
                        Text("Home View")
                            .transition(.opacity)
                    case 1:
                        Text("Profile View")
                            .transition(.opacity)
                    case 2:
                        Text("Settings View")
                            .transition(.opacity)
                    default:
                        EmptyView()
                }
            }
            .animation(.easeInOut, value: selectedTab)
            
            VStack {
                Spacer()
                HStack {
                    animatedTabButton(index: 0, icon: "house", label: "Home")
                    animatedTabButton(index: 1, icon: "person", label: "Profile")
                    animatedTabButton(index: 2, icon: "gear", label: "Settings")
                }
                .padding()
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .padding()
            }
        }
    }
    
    func animatedTabButton(index: Int, icon: String, label: String) -> some View {
        Button {
            withAnimation {
                selectedTab = index
            }
        } label: {
            VStack {
                Image(systemName: icon)
                Text(label)
                    .font(.caption)
            }
            .foregroundColor(selectedTab == index ? .blue : .gray)
        }
        .frame(maxWidth: .infinity)
    }
}


#Preview {
    ResponsiveTabView()
    AnimatedTabView()
}
