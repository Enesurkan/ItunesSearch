# Examplee

Our project is a project that can be listed after using APIs in https://developer.apple.com/library/archive/documentation/AudioVideo/Conceptual/iTuneSearchAPI/, clicking on any of the elements and seeing the details.

## Getting Started

After pulling the project, going to the directory where the project is and running the "pod install" command, development can be done.

## Used Pods

pod 'RxSwiftExt' -> Libraries used for reactive programming
pod 'Moya/ReactiveSwift', '~> 13.0' -> Libraries used for reactive programming
pod 'Moya/RxSwift', '~> 13.0.1' -> Libraries used for reactive programming
pod 'Reusable' -> used to nibs and cell load
pod 'RxDataSources', '~> 3.1.0' -> Libraries used for reactive programming
pod 'lottie-ios' -> used to show progress for requests
pod 'PINRemoteImage' -> used to download image
pod 'IQKeyboardManagerSwift' -> used to keyboard action
pod 'SnapKit', '~> 5.0.0' -> It was used to design simple screens

## Project Information

-> in the project:

*  There are appdelegate files in the Application folder.

*  Service requests and models are available in the Network folder.

*  Common files to be used by application in the Common folder.

*  Extensions used in the application in the Extension folder.

*  The screens we designed inside application  in the Scenes folder.

##  RXSwift uses with in the application

-> Search

    searchBar.textField
    .rx.text
    .orEmpty -> Empty Control
    .debounce(0.5, scheduler: MainScheduler.instance) -> 0.5 debounce into input
    .distinctUntilChanged()
    .filter { $0.count >= 0  } -> checks the number of data entered
    .subscribe(onNext: { [weak self] query in
        guard let self = self else {return}
        self.viewModel.resetOffSet()
        if query.count >= 2 {
            self.viewModel.searchRequestBody.term = query
            self.viewModel.search()
        }else{
            self.viewModel.searchRequestBody.term = nil
            self.setSection([])
        }
    })
    .disposed(by: disposeBag)
    
-> Button

    clearButton.rx.tap.bind{ [weak self] _ in
        guard let self = self else {return}
        //code
    }.disposed(by: disposeBag)
    
-> Service Request

    searchRepository.search(T.self, body: searchRequestBody)
    .subscribe(onNext: {[weak self] (response) in
        guard let self = self else {return}
        //Success
    }, onError: { (error) in
        //Error
    }).disposed(by: disposeBag)
    
    

