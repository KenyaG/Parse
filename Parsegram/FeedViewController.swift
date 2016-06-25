//
//  FeedViewController.swift
//  Parsegram
//
//  Created by Kenya Gordon on 6/21/16.
//  Copyright © 2016 Kenya Gordon. All rights reserved.
//

import UIKit
import Parse

class FeedViewController: UIViewController, UITableViewDelegate,  UIScrollViewDelegate, UITableViewDataSource {
    
    
    
    @IBOutlet weak var tableView: UITableView!
    var posts: [PFObject] = []
    
    var isMoreDataLoading = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
       // let refreshControl = UIRefreshControl()
        makeQuery()
        // Do any additional setup after loading the view.
    }
    
    func makeQuery(){
        /// construct PFQuery
        let query = PFQuery(className: "Post")
        query.orderByDescending("createdAt")
        query.includeKey("author")
        query.limit = 20
        
        // fetch data asynchronously
        query.findObjectsInBackgroundWithBlock { (objects: [PFObject]?, error: NSError?) -> Void in
            if let objects = objects {
                // do something with the data fetched
                self.posts = objects
                
            }
            else {
                // handle error
                print("Error")
            }
            
            self.tableView.reloadData()
        }
    }
   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("FeedCell") as! FeedCell
        
        let post = posts[indexPath.row]
        cell.instagramPost = post
        return cell
        
    }
//    func refreshControlAction(refreshControl: UIRefreshControl) {
//        
//        makeQuery()
//        self.tableView.reloadData()
//        // Tell the refreshControl to stop spinning
//        refreshControl.endRefreshing()
//
//        
//    task.resume()
//    
//    }

    
    func loadMoreData(){
        //        // ... Create the NSURLRequest (myRequest) ...
        //
        //        // Configure session so that completion handler is executed on main UI thread
        //        let session = NSURLSession(
        //            configuration: NSURLSessionConfiguration.defaultSessionConfiguration(),
        //            delegate:nil,
        //            delegateQueue:NSOperationQueue.mainQueue()
        //        )
        //
        //       // let task:NSURLSessionDataTask = session.dataTaskWithRequest(myRequest, completionHandler: { (data, response, error) in
        //            // Update flag
        //            self.isMoreDataLoading = false
        //
        //            // ... Use the new data to update the data source ...
        //            // Reload the tableView now that there is new data
        //            self.myTableView.reloadData()
        //        });
        //        task.resume()
    }
    
    
    
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        // Handle scroll behavior here
        if (!isMoreDataLoading) {
            // Calculate the position of one screen length before the bottom of the results
            let scrollViewContentHeight = tableView.contentSize.height
            let scrollOffsetThreshold = scrollViewContentHeight - tableView.bounds.size.height
            // When the user has scrolled past the threshold, start requesting
            if(scrollView.contentOffset.y > scrollOffsetThreshold && tableView.dragging) {
                isMoreDataLoading = true
                
                // Code to load more results
                loadMoreData()
            }
        }
        
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
