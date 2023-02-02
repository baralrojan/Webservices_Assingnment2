//
//  DogBreedTableViewController.swift
//  A2_WebServices
//
//  Created by user231854 on 2/1/23.
//

import UIKit

class DogBreedTableViewController: UITableViewController {
    //var allDog : [DogBreed]!
    var dogs = [Dog]()

    //var dogBredd : DogBreed
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        Task{
            do{
                let results = try await DogAPI_Helper.fetchDogData()
                self.dogs = results.message.keys.map { Dog(name: $0) }
             //   print(allDog.message)
                tableView.reloadData()
            }
            
            catch let err{
                print("Unable to fetch data: \(err)")
            }
            
        }
    }
    
    

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dogs.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dog", for: indexPath)
           let dog = dogs[indexPath.row]
           cell.textLabel?.text = dog.name
        
        //fetch dogImage using dog name
        let dogImageURL = URL(string: "https://dog.ceo/api/breed/\(dog.name.lowercased())/images/random")!
            let task = URLSession.shared.dataTask(with: dogImageURL) { (data, response, error) in
              if let data = data, let image = UIImage(data: data) {
                // Update the image view on the main thread
                DispatchQueue.main.async {
                  cell.imageView?.image = image
                  cell.setNeedsLayout()
                }
              }
            }
            task.resume()
            
            return cell
          }
        
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
