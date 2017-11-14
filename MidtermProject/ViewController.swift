//
//  ViewController.swift
//  MidtermProject
//
//  Created by Matheu DeWitt on 10/3/16.
//  Copyright © 2016 Matheu DeWitt. All rights reserved.
//

import UIKit

class ViewController: UIViewController, NSXMLParserDelegate{
    @IBOutlet weak var tableView: UITableView!
    @IBAction func backButton(sender: UIButton) {
        navigationController!.popViewControllerAnimated(true)
    }
    var newsStories = NSMutableDictionary()
    var element = NSString()
    var parser = NSXMLParser()
    var posts = NSMutableArray()
    var title1 = NSMutableString()
    var subtitle = NSMutableString()
    var state = ""
//    var descriptions:[String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        beginParsing()

        // Do any additional setup after loading the view, typically from a nib.
    }
    func beginParsing()
    {
        posts = []
        parser = NSXMLParser(contentsOfURL:(NSURL(string:"https://alerts.weather.gov/cap/"+state+".php?x=0"))!)!
        parser.delegate = self
        parser.parse()
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
        let destination = segue.destinationViewController as? DetailsViewController
        let index = (sender as! NSIndexPath).row
        destination?.details = posts.objectAtIndex(index).valueForKey("cap:event") as! NSString as String
        
        
    }
    func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String])
    {
        element = elementName
        if (elementName as NSString).isEqualToString("entry")
        {
            newsStories = NSMutableDictionary()
            newsStories = [:]
            title1 = NSMutableString()
            title1 = ""
            subtitle = NSMutableString()
            subtitle = ""
        }
    }
    func parser(parser: NSXMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?)
    {
        if (elementName as NSString).isEqualToString("entry") {
            if !title1.isEqual(nil) {
                newsStories.setObject(title1, forKey: "cap:event")
            }
            if !subtitle.isEqual(nil) {
                newsStories.setObject(subtitle, forKey: "cap:expires")
            }
            
            posts.addObject(newsStories)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func parser(parser: NSXMLParser, foundCharacters string: String)
    {
        if element.isEqualToString("cap:event") {
            title1.appendString(string)
        } else if element.isEqualToString("cap:expires") {
            subtitle.appendString(string)
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return posts.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        var cell : UITableViewCell = tableView.dequeueReusableCellWithIdentifier("customCell")!
        if(cell.isEqual(NSNull)) {
            cell = NSBundle.mainBundle().loadNibNamed("customCell", owner: self, options: nil)[0] as! UITableViewCell;
        }
        print(posts.count)
//        let severity:String? = posts.objectAtIndex(indexPath.row).valueForKey("cap:severity")as! NSString as String
        
        cell.textLabel?.text = posts.objectAtIndex(indexPath.row).valueForKey("cap:event") as! NSString as String
        cell.detailTextLabel?.text = posts.objectAtIndex(indexPath.row).valueForKey("cap:expires") as! NSString as String
//        if (severity == "Moderate"){
//            cell.backgroundColor = UIColor.yellowColor()
//        }
//        if (severity == "Severe"){
//            cell.backgroundColor = UIColor.orangeColor()
//        }
//        if (severity == "Extreme"){
//            cell.backgroundColor = UIColor.redColor()
//        }
        
        return cell as UITableViewCell
    }
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
//        let destination = segue.destinationViewController as? DetailsViewController
//        let index = (sender as! NSIndexPath).row
//        destination?.detailsLabel.text = newsStories[index]
//    }


}

