#
# Be sure to run `pod lib lint Crittercism.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name                        = "Crittercism-MH"
  s.version                     = "5.4.5"
  s.summary                     = "A podspec for the dynamic Crittercism framework."

  s.description                 = "A podspec for Crittercism's new dynamic framework, currently only available via direct download, with current podspec hosting older static library which won't work in dynamic frameworks that themselves are dependencies."
  s.homepage                    = "http://docs.crittercism.com/ios/ios.html"
  s.license                     = { :type => "Commercial", :text => "See http://www.crittercism.com/terms-services/" }

  s.author                      = { "Ari Braginsky" => "ari.braginsky@medhelp.org" }
  s.source                      = { :http => "https://app.crittercism.com/downloads/download/Crittercism_v5_4_5.zip", :sha1 => "30c38d26f6cace6559050aad322f514129c1b54d" }
  
  s.platform                    = :ios
  s.ios.deployment_target       = "8.0"
  s.cocoapods_version           = "0.39.0"
  s.requires_arc                = false
  
  s.module_name                 = "Crittercism"
  s.header_dir                  = "Crittercism"
  s.vendored_frameworks         = "Crittercism.framework"
  s.module_map                  = "Crittercism.framework/Modules/module.modulemap"

  s.frameworks                  = "SystemConfiguration"
  
end
