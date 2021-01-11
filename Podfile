# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

def pods
  pod 'Alamofire', '~> 5.2'
  pod 'AlamofireImage', '~> 4.1'
  pod 'RxSwift', '6.0.0'
  pod 'RxCocoa', '6.0.0'
  pod 'ObjectMapper', '~> 4.2.0'
  pod 'IGListKit'
  pod 'RxAlamofire'
end

target 'Brastlewark' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Brastlewark
  pods

  target 'BrastlewarkTests' do
    inherit! :search_paths
    # Pods for testing
    pods
    pod 'Mockingjay', '3.0.0-alpha.1'
    pod 'RxBlocking'
  end

  target 'BrastlewarkUITests' do
    # Pods for testing
  end

end
