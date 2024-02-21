//
//  TodoListView.swift
//  ArchitectureAndBiolerPlate
//
//  Created by Puneet jhurani  on 28/07/23.
//

import SwiftUI

struct ArticleListView: View {
    
    @ObservedObject private var viewModel = (articleListModule.resolver.resolve(ArticleViewModel.self))!
    
    var body: some View {
        
        GeometryReader { proxy in
            VStack {
                HStack{
                    Image(systemName:"list.dash")
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 20.0, height: 20.0)
                        .foregroundColor(.white)
                    Spacer().frame(width: 15.0,height: 10.0)
                    Text("NY Times Most Popular")
                        .font(.system(size: 25.0))
                        .foregroundColor(.white)
                        .accessibilityIdentifier("Heading")
                    Spacer().frame(width: 15.0,height: 10.0)
                    Image(systemName: "magnifyingglass")
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 20.0, height: 20.0)
                        .foregroundColor(.white)
                }.frame(width: proxy.size.width,height: 80.0)
                    .background(Color.green)
                NavigationView{
                    VStack {
                        if !viewModel.isLoading {
                            if viewModel.articles.count > 0 {
                                List(viewModel.articles){article in
                                    NavigationLink(destination: DetailView(article: article)) {
                                        HStack {
                                            Image(systemName: "circle.fill")
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 30, height: 30)
                                                .clipShape(Circle())
                                            
                                            VStack(alignment: .leading){
                                                Text(article.title ?? " ")
                                                    .font(.headline)
                                                HStack {
                                                    Text(article.byline ?? " ")
                                                        .font(.subheadline)
                                                    Spacer()
                                                    Image(systemName: "calendar")
                                                        .frame(width: 10, height: 10)
                                                    Text(article.publishedDate ?? " ")
                                                        .font(.footnote)
                                                    
                                                }
                                            }
                                        }
                                    }
                                    
                                }
                                .listStyle(.plain)
                                .accessibilityIdentifier("ArticleList")
                            }else {
                                Text(viewModel.errorMessage)
                            }
                            
                        }
                        else {
                            HStack(spacing: 15) {
                                ProgressView()
                                Text("Loading…")
                            }
                        }
                    }.frame(maxWidth: .infinity)
                }
                .onAppear {
                    self.viewModel.fetchArticleList()
                }
            }
        }
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleListView()
    }
}
