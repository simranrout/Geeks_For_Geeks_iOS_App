//
//  NewsListingView.swift
//  GeeksForGeeks
//
//  Created by Simran Rout on 26/05/22.
//

import SwiftUI

struct NewsListingView: View {
    
    @State var newsItem: NewsDataModelComponent?
    
    var body: some View {
        if #available(iOS 15.0, *) {
            HStack {
                VStack(alignment: .leading, spacing: 5.0, content: {
                    
                    /// News Title Data
                    if let newsItem = newsItem {
                        Text(newsItem.newsTitle ?? "N/A").font(.subheadline).fontWeight(.semibold).foregroundColor(Color.green).lineLimit(4).minimumScaleFactor(0.5)
                        
                        ///Date and Time Data
                        HStack(spacing: 5.0) {
                            Text(newsItem.newsPublishDate?.convertToDate(format:  "MMM dd yyyy") ?? "N/A").font(.caption2).fontWeight(.semibold).foregroundColor(/*@START_MENU_TOKEN@*/.gray/*@END_MENU_TOKEN@*/)
                            Text(newsItem.newsPublishDate?.convertToDate(format:  "HH:mm") ?? "N/A").font(.caption2).foregroundColor(/*@START_MENU_TOKEN@*/.gray/*@END_MENU_TOKEN@*/)
                        }
                    }
                }).padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                
                ///Image URL Data
                Image(uiImage: newsItem?.image ?? UIImage(imageLiteralResourceName: "gfg")).resizable().padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/).scaledToFit()
                
            }.cornerRadius(40).frame(height: 150.0)
                .task {
                    ///Converting url to image
                    self.newsItem?.image = DataManager.sharedInstance.load(url: URL(string: newsItem?.url ?? ""))
                }
        }
    }
}

struct NewsListingView_Previews: PreviewProvider {
    static var previews: some View {
        NewsListingView()
    }
}
