//
//  HomeViewController.swift
//  test_task_second
//
//  Created by Kirill Khomytsevych on 12.06.2023.
//

import UIKit

class HomeViewController: UIViewController {

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupController()
    }
}

// MARK: - Name
private extension HomeViewController {

    func setupController() {
        setupHomeView()
        getData()
    }

    func setupHomeView() {
        view.backgroundColor = .yellow
    }

    func getData() {
        let key = "165R8M9SqtxNYvYPzCZbXgvvlftQnOQSWImcbZJ-ve8"
        let jsonString = "https://api.unsplash.com/photos/?client_id=\(key)"

        guard let url = URL(string: jsonString) else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }

//            let dataString = String(data: data, encoding: .utf8)
//            print("print \(dataString)")

            do {
                let photo = try JSONDecoder().decode(PhotoModel.self, from: data)
                 print("print 1\(photo)")
            } catch let error {
            print("print error \(error)")
            }
        }.resume()
    }
}
