//
//  DetailsConfigurator.swift
//  CleanSwiftTest
//
//  Created by anoop mohanan on 27/03/17.
//  Copyright (c) 2017 anoop mohanan. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit

// MARK: - Connect View, Interactor, and Presenter

extension DetailsViewController: DetailsPresenterOutput
{
  override func prepare(for segue: UIStoryboardSegue, sender: Any?)
  {
    router.passDataToNextScene(segue: segue)
  }
}

extension DetailsInteractor: DetailsViewControllerOutput
{
}

extension DetailsPresenter: DetailsInteractorOutput
{
}

class DetailsConfigurator
{
  // MARK: - Object lifecycle
  
  static let sharedInstance = DetailsConfigurator()
  
  private init() {}
  
  // MARK: - Configuration
  
  func configure(viewController: DetailsViewController)
  {
    let router = DetailsRouter()
    router.viewController = viewController
    
    let presenter = DetailsPresenter()
    presenter.output = viewController
    
    let interactor = DetailsInteractor()
    interactor.output = presenter
    
    viewController.output = interactor
    viewController.router = router
  }
}