//
//  XMLParser.swift
//  XMLStringParser
//
//  Created by Dave Johnson on 11/2/17.
//  Copyright © 2017 Paycom. All rights reserved.
//

import Foundation

class ParseXML {
    
    static let sharedStringDict = ParseXML()
    var notificationStringDict = [String: String] ()
    
    //static func initNotificationStringsDict(){
    private init(){
        
        //self.notificationStringDict = notificationsStringDict
        
        var childCount = 0
        
        // Retrieve XML from bundle
    
        guard let url = Bundle.main.url(forResource: "strings", withExtension: "xml") else { return }
        guard let xml = XML(contentsOf: url) else { return }
        
        // Iterate through XML and assign Key/Value to Dictionary
        
        for _ in xml[0].children {
            
            let XMLKey = xml[0][childCount].attributes
            let XMLKeyName = XMLKey["name"]
            let XMLKeyValue = xml[0][childCount].text
            
            // Store Key/Value into Dictionary
            
            notificationStringDict.updateValue(XMLKeyValue, forKey: XMLKeyName!)
            
            childCount += 1
            
        }
        
        // Testing Dictionary
        
//        for (key,value) in notificationStringDict {
//            print("Key : \(key)    Value : \(value)")
//        }
//
//        print("Total Lines : \(notificationStringDict.count)")
        
        //print(notificationStringDict["gps_network_not_enabled"]!)
        
    }
}
