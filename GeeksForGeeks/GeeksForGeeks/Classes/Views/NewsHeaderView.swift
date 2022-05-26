//
//  NewsHeaderView.swift
//  GeeksForGeeks
//
//  Created by Simran Rout on 26/05/22.
//

import SwiftUI

struct NewsHeaderView: View {
    @State var newsItem: NewsDataModelComponent?
    var body: some View {
        
        if #available(iOS 15.0, *) {
            VStack(alignment: .leading, spacing: 5.0, content: {
                Spacer()
                
                ///Image URL Data
                HStack{
                    Spacer()
                    Image(uiImage: newsItem?.image ?? UIImage(imageLiteralResourceName: "gfg")).resizable().scaledToFit().frame(width: 250.0, height: 100)
                    Spacer()
                }
                
                /// News Title Data
                if let newsItem = newsItem {
                    Text(newsItem.newsTitle ?? "N/A").font(.subheadline).fontWeight(.semibold).foregroundColor(Color.green).lineLimit(4).minimumScaleFactor(0.5)
                    
                    ///Date and Time Data
                    HStack(spacing: 5.0) {
                        Text(newsItem.newsPublishDate?.convertToDate(format:  "MMM dd yyyy") ?? "N/A").font(.caption2).fontWeight(.semibold).foregroundColor(/*@START_MENU_TOKEN@*/.gray/*@END_MENU_TOKEN@*/)
                        Text(newsItem.newsPublishDate?.convertToDate(format:  "HH:mm") ?? "N/A").font(.caption2).foregroundColor(/*@START_MENU_TOKEN@*/.gray/*@END_MENU_TOKEN@*/)
                    }
                }
                Spacer()
            }).cornerRadius(/*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/).padding()
            
                .task {
                    ///Converting URL To Image
                    self.newsItem?.image = DataManager.sharedInstance.load(url: URL(string: newsItem?.url ?? ""))
                }
            }
        }
}

struct NewsHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        NewsHeaderView()
    }
}

