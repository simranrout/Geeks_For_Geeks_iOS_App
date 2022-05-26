//
//  ContentView.swift
//  GeeksForGeeks
//
//  Created by Simran Rout on 26/05/22.
//

import SwiftUI

struct ContentView: View {
    @State var newsData = [NewsDataModelComponent]()
    let dataManager = DataManager.sharedInstance
    
    var body: some View {
        if #available(iOS 15.0, *) {
            GeometryReader { geometry in
                VStack() {
                    
                    /// UI header Text
                    Text("GeeksForGeeks").foregroundColor(Color.green)
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/).frame(width: geometry.size.width, height: 40.0 , alignment: .leading)
                        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/)
                    
                    List(newsData, id: \.id) { newsItem in
                        
                        if newsItem.id == 2 {
                            ///for the first id we are showing this view
                            NewsHeaderView(newsItem: newsItem)
                        } else {
                            NewsListingView(newsItem: newsItem)
                        }
                    }
                    Spacer()
                }
            }
            
            ///loading new data from json file
            .task {
                loadNewsData()
                
            ///refreshing the page by pull down action
            }.refreshable {
                loadNewsData()
            }
        }
    }
    
    func loadNewsData() {
        self.newsData = dataManager.parseJSON() ?? [NewsDataModelComponent]()
        print(self.newsData)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
