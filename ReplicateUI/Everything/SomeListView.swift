//
//  SomeListView.swift
//  ReplicateUI
//
//  Created by Damian Jardim on 5/12/25.
//

import SwiftUI

struct SomeListView: View {
    let tasks = ["Task1, Task2, Task3"]
    var body: some View {
        List(tasks, id:\.self){task in
            Text("task: \(task)")
        }
    }
}

struct SomeForm: View {
    let tasks = ["Task1, Task2, Task3"]

    var body: some View
    {
        NavigationStack{
            List(tasks, id: \.self){val in
                NavigationLink(for)
            }
        }
    }
}

#Preview {
//    SomeListView()
    SomeForm()
}
