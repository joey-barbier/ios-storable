Pod::Spec.new do |s|
  s.name = 'OrkaStorable'
  s.version = '1.0.0'
  s.authors = 'Joey Barbier'
  s.summary = 'Lorem ipsum dolorLorem ipsum dolorLorem ipsum dolorLorem ipsum dolor'
  s.homepage = 'https://github.com/joey-barbier/ios-storable'
  s.license = 'BSD 3'
  
  s.platform = :ios
  s.ios.deployment_target = '13.0'
  
  s.source = { :git => 'https://github.com/joey-barbier/ios-storable.git', :tag => s.version.to_s }
  s.swift_version = '5.0'
  
  s.requires_arc = true
  s.frameworks = 'Foundation'
  s.frameworks = 'CoreData'
  

  s.dependency 'OrkaCoreDataWrapper', '~> 1'


  s.source_files = 'Sources/**/*.swift'
  s.resource_bundles =
  {
    'OrkaStorable' => ['Sources/**/*.{xcdatamodeld}']
  }
end
