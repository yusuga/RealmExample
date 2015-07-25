Pod::Spec.new do |s|
  s.name = 'RealmExample'
  s.version = '0.0.1'
  s.summary = 'RealmExample'
  s.homepage = 'https://github.com/yusuga/RealmExample'
  s.license = 'MIT'
  s.author = 'Yu Sugawara'
  s.source = { :git => 'https://github.com/yusuga/RealmExample.git', :tag => s.version.to_s }
  s.platform = :ios, '7.0'
  s.ios.deployment_target = '7.0'
  s.source_files = 'Classes/RealmExample/*.{h,m}'
  s.requires_arc = true
  s.compiler_flags = '-fmodules'
  
  s.dependency 'YSRealmStore'
end