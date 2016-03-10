Pod::Spec.new do |s|
  s.name         	        = 'FatSecretKit'
  s.version      	        = '0.0.3'
  s.summary      	        = 'Client for interacting with the FatSecret API.'
  s.homepage     	        = 'https://github.com/mysterioustrousers/FatSecretKit'
  s.license      	        = 'BSD'
  s.author       	        = { 'Parker Wightman' => 'parkerwightman@gmail.com' }
  s.source       	        = { :git => 'https://github.com/mysterioustrousers/FatSecretKit.git', :tag => '0.0.3' }
  s.source_files 	        = 'FatSecretKit/FatSecret/*.{h,m}'
  s.platform                    = :ios, '7.0'
  s.requires_arc 	        = true
end
