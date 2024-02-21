//
//  DetailView.swift
//  ArchitectureAndBiolerPlate
//
//  Created by Puneet jhurani  on 01/08/23.
//

import SwiftUI

struct DetailView: View {
    
    var article: Article?
    init(article: Article?) {
        self.article = article
    }
    
    var body: some View {
        HStack {
            Spacer().frame(maxWidth: 30.0, alignment: .leading)
            VStack {
                VStack(alignment: .leading, spacing: 20.0) {
                    HStack {
                        Text(article?.title ?? " ")
                            .font(.title)
                            .fontWeight(.heavy)
                        
                        Spacer()
                    }
                    Divider()
                    HStack {
                        Text(article?.abstract ?? "  ")
                            .font(.body)
                    Spacer()
                    }
                    Divider()
                    HStack {
                        if let linkUrl = article?.url {
                            Link(destination: URL(string: linkUrl)!, label: {
                                Text("Go to Website")
                            })
                            Spacer()
                        }else {
                            Text("Link not avilable currently")
                        }
                        
                        
                    }
                    Divider()
                    HStack {
                        Text("Published On \(article?.publishedDate ?? "")")
                            .font(.system(size: 20.0))
                        Spacer()
                    }
                    Divider()
                }
                Spacer()
                Spacer().frame(width: 100.0, height: 50.0, alignment: .center)

            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }.frame(
            minWidth: 0, maxWidth: .infinity,minHeight: 0.0,maxHeight: .infinity)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(article: nil)
    }
}
