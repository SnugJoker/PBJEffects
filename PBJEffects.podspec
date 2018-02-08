#
# Be sure to run `pod lib lint PBJEffects.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
s.name             = 'PBJEffects'
s.version          = '1.0.0'
s.summary          = 'Effects framework.'
s.description      = 'PBJEffects is a simple framework for adding eddects in no time.'
s.homepage         = 'https://github.com/SnugJoker/PBJEffects'
s.license          = { :type => 'MIT', :file => 'LICENSE' }
s.author           = { 'Joseph Razon' => 'razonjoe@gmail.com' }
s.source           = { :git => 'https://github.com/SnugJoker/PBJEffects.git', :tag => s.version.to_s }

s.ios.deployment_target = '8.0'

s.source_files = 'PBJEffects/Classes/PBJEffects/*'
s.public_header_files = 'PBJEffects/Classes/PBJEffects/*.h'


end

