//
//  DetailsPresenter.swift
//  CleanSwiftTest
//
//  Created by anoop mohanan on 27/03/17.
//  Copyright (c) 2017 anoop mohanan. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit

protocol DetailsPresenterInput
{
  func presentSomething(response: Details.Something.Response)
}

protocol DetailsPresenterOutput: class
{
  func displaySomething(viewModel: Details.Something.ViewModel)
}

class DetailsPresenter: DetailsPresenterInput
{
  weak var output: DetailsPresenterOutput!
  
  // MARK: - Presentation logic
  
  func presentSomething(response: Details.Something.Response)
  {
    // NOTE: Format the response from the Interactor and pass the result back to the View Controller
    
    let viewModel = Details.Something.ViewModel()
    output.displaySomething(viewModel: viewModel)
  }
}
