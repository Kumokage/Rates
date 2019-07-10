//
//  ViewController.swift
//  Rates
//
//  Created by Alex Glushko on 07/07/2019.
//  Copyright © 2019 Alex Glushko. All rights reserved.
//

import UIKit

class RatePageViewController: UIViewController {

  @IBOutlet weak var tableView: UITableView!
  
  var pairesOfCurrency: [(
    firstRateRedustion: String,
    firstRateFullName: String,
    secondRateredustion: String,
    secondRateFullName: String,
    rate: Double
    )] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.dataSource = self
  }
  
//  func loadRate(){
//    for pair in pairesOfCurrency{
//    let url = "https://api.exchangeratesapi.io/latest?base="
//      + pair.firstRateRedustion+"&symbols="
//      + pair.firstRateRedustion+"," + pair.secondRateredustion
//    Alamofire.request(url).responseJSON{
//    response in
//    switch response.result {
//    case .failure(let error):
//      assertionFailure(error.localizedDescription)
//    case .success(let data):
//      let json = JSON(data)
//      let newRate = json["rates"].dictionary![pair.secondRateredustion]!.doubleValue
//      print(newRate)
//      self.newRates.append(newRate)
//      }
//    }
//    }
//    self.rates = self.newRates
//  }
  
  @IBAction func PlusButtonPress(_ sender: Any) {
    let ViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FirstCurrency") as! FirstCurrencyViewController
    ViewController.loadViewIfNeeded()
    show(ViewController, sender: nil)
  }
}

extension RatePageViewController: UITableViewDataSource{
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return pairesOfCurrency.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let rateCell = tableView.dequeueReusableCell(withIdentifier: "RateCell") as! RateTableViewCell
    rateCell.firstRateTitel.text = "1 " + pairesOfCurrency[indexPath.row].firstRateRedustion
    rateCell.firstRateFullName.text = pairesOfCurrency[indexPath.row].firstRateFullName
    rateCell.SecondRateFullName.text = pairesOfCurrency[indexPath.row].secondRateFullName + "・" + pairesOfCurrency[indexPath.row].secondRateredustion
    rateCell.SecondRateTitel.text = String(format: "%.3f", pairesOfCurrency[indexPath.row].rate)
    return rateCell
  }
}

extension RatePageViewController: UITableViewDelegate{
  //delegate for deleting
  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == .delete {
      pairesOfCurrency.remove(at: indexPath.row)
      tableView.deleteRows(at: [indexPath], with: .fade)
    }
  }
}
