//
//  BaseContentLoadingView.swift
//  Recipes
//
//  Created by Brayden Harris on 2/23/25.
//

import SwiftUI

enum LoadingState<DomainModel> {
    case loading
    case error(Error)
    case loaded(DomainModel)
}

struct BaseContentLoadingView<DomainModel, ContentView: View>: View {
    @State private var loadingState: LoadingState<DomainModel> = .loading
    var loadingTask: () async throws -> DomainModel
    @ViewBuilder var loadedContent: (DomainModel) -> ContentView
    
    var body: some View {
        content
            .task {
                await performLoading()
            }
    }
    
    @ViewBuilder
    private var content: some View {
        switch loadingState {
        case .loading:
            ProgressView()
        case .error(let error):
            ScrollView {
                VStack {
                    Image(systemName: "exclamationmark.circle.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .foregroundStyle(Color.red)
                    Text("Uh Oh!")
                        .font(.title)
                    Text(error.localizedDescription)
                        .font(.headline)
                        .multilineTextAlignment(.center)
                }
            }
            .refreshable {
                await performLoading()
            }
        case .loaded(let domainModel):
            loadedContent(domainModel)
                .refreshable {
                    await performLoading()
                }
        }
    }
    
    private func performLoading() async {
        do {
            let domainModel = try await loadingTask()
            withAnimation {
                loadingState = .loaded(domainModel)
            }
        } catch {
            withAnimation {
                loadingState = .error(error)
            }
        }
    }
}
 
#Preview {
    func getString() async throws -> String {
        return "We did it!"
    }
    
    return BaseContentLoadingView(loadingTask: getString) { string in
        Text(string)
    }
}
