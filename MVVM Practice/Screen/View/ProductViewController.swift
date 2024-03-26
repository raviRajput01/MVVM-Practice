//
//  ProductViewController.swift
//  MVVM Practice
//
//  Created by Ravi Kumar Singh on 24/03/24.
//

import UIKit

class ProductViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    private var viewModel = ProductViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        configuration()
       
        // Do any additional setup after loading the view.
    }

}
extension ProductViewController {
    
    func configuration() {
        tableView.register(UINib(nibName: "ProductCell", bundle: nil), forCellReuseIdentifier: "ProductCell")
        initViewModel()
        observeEvent()
    }
    
    func initViewModel(){
        viewModel.fetchProducts()
        
    }
    //Data binding event observe karega - communication
    func observeEvent() {
        viewModel.eventHandler = { [weak self] event in
            guard let self else {return}
            
            switch event {
            case .loading: break
            case .stopLoading: break
            case .dataLoaded:
                print(self.viewModel.products)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .error(let error):
                print(error)
            }
            
        }
        
    }
}


extension ProductViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell") as? ProductCell else {
            return UITableViewCell()
        }
        let product = viewModel.products[indexPath.row]
        cell.product = product
        return cell
        
    }
    
}
