Pod::Spec.new do |s|
  s.name = 'Reduce'
  s.version = '0.1'
  s.authors = {'Giles Van Gruisen' => 'giles@vangruisen.com'}
  s.homepage = 'https://github.com/gilesvangruisen/Reduce'
  s.summary = 'An Objective-C category on NSArray, providing helpful array functions like `reduce`, `filter`, and `map`.'
  s.source = { :git => 'https://github.com/gilesvangruisen/Reduce.git', :tag => "master" }
  s.license = { :type => 'MIT', :file => 'LICENSE' }

  s.platform = :ios, '6.0'
  s.requires_arc = true
  s.frameworks = 'Foundation'
  s.source_files = 'Reduce'
end