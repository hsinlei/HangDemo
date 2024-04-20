//
//  ContentView.swift
//  HangDemo
//
//  Created by Charlene Wang on 4/20/24.
//

import SwiftUI
import MarkdownUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            NavigationLink(destination: MarkdownView()) {
                Text("Go")
            }
        }
    }
}
struct MarkdownView: View {
    @State private var markdownContent = ""
    var body: some View {
        VStack {
            if markdownContent.isEmpty{
                ProgressView()
            } else {
                Markdown(markdownContent)
            }
        }
        .padding()
        .onAppear {
                markdownContent = """
                    - This relatively simple markdown text
                      - containing only nested bullet points
                        - causes the markdown library
                          - to result in severe hangs
                            - the UI freezes for 2-3s during rending
                          - XCode instruments Timing Profile
                            - shows that CPU usage is at 100% during the hang
                              - the heaviest stack trace shows the following:
                              - BlockMarginsPreference.reduce()
                        - in particular
                          - 648ms for `let newValue = nextValue()`
                            - this seems to be a very deep, and recursive call
                              - Is there anyway to optimize for this?
                        - Any suggestsion would be highly appreciated
                          - thank you for looking into this
                            - also thank you for making this library
                            - it hugely improves the content rendering of my app
                              - happy to look deeper and/or open a PR for a fix if possible too
                    """
        }
    }
}

#Preview {
    ContentView()
}
