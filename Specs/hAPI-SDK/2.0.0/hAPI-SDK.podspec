#
#  hAPI-SDK.podspec (a local dev pod for hAPITracker (experimental))
#
#  Be sure to run `pod spec lint hAPI-SDK.podspec` to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

#
#  Warning: This podspec will fail to lint, for at least the attributes, description
#  url and license properties since this is only intended to be used as a "local dev pod"
#  for each of the iOS apps.
#

#  Bumping from 1.0.23 to 2.0.0 since this version is the first one
#  that requires iOS 8+ as well as use_frameworks!
version = "2.0.0"

Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

  # Note: can't change "hAPI-SDK" to "hAPI_SDK" since it's already a public pod, but
  # all directories and files will have "hAPI_SDK" instead as previously they were a 
  # mix of "hAPI SDK" and "hAPI_SDK". Preferred to have underscores to spaces or
  # dashes.
  s.name = "hAPI-SDK"
  s.version = version
  s.summary = "hAPI-SDK" 

  # This description is used to generate tags and improve search results.
  #   * Think: What does it do? Why did you write it? What is the focus?
  #   * Try to keep it short, snappy and to the point.
  #   * Write the description between the DESC delimiters below.
  #   * Finally, don't worry about the indent, CocoaPods strips it!
  s.description = "iOS Helper Methods for interacting with MedHelp's 'Health' API or 'hAPI'" 

  # Note: public pod version is under https://github.com/medhelpintl/iphone_hAPI_SDK.git
  # This custom podspec is just for internal developemnt.
  s.homepage = "https://github.com/medhelpintl/iphone_hAPI-SDK.git" # "https://github.com/medhelpintl/iphone_hapi_sdk_library"

  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Licensing your code is important. See http://choosealicense.com for more info.
  #  CocoaPods will detect a license file if there is a named LICENSE*
  #  Popular ones are 'MIT', 'BSD' and 'Apache License, Version 2.0'.
  #

  s.license = { :type => "MIT", :file => "LICENSE" }
  

  # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Specify the authors of the library, with email addresses. Email addresses
  #  of the authors are extracted from the SCM log. E.g. $ git log. CocoaPods also
  #  accepts just a name if you'd rather not provide an email address.
  #
  #  Specify a social_media_url where others can refer to, for example a twitter
  #  profile URL.
  #

  s.author = { 'medhelp' => 'iphone@medhelp.org' }
  
  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If this Pod runs only on iOS or OS X, then specify the platform and
  #  the deployment target. You can optionally include the target after the platform.
  #

  s.platform            = :ios, '8.0'

  #  When using multiple platforms
  # s.ios.deployment_target = "8.0"
  # s.watchos.deployment_target = "2.0"
  # s.tvos.deployment_target = "9.0"


  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Specify the location from where the source should be retrieved.
  #  Supports git, hg, bzr, svn and HTTP.
  #

  # s.source = { :git => "https://github.com/medhelpintl/iphone_hAPI-SDK.git", :tag => s.version.to_s }
  s.source = { :git => "git@github.com:medhelpintl/iphone_hapi_sdk_library.git", :tag => s.version.to_s }

  s.subspec 'hAPI_SDK' do |ss|

    # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
    #
    #  CocoaPods is smart about how it includes source code. For source files
    #  giving a folder will include any swift, h, m, mm, c & cpp files.
    #  For header files it will include any header in the folder.
    #  Not including the public_header_files will make all headers public.
    #

    ss.subspec 'Source' do |src|

      # A path to a prefix header file to inject in the prefix header of the pod 
      # project. This attribute is not recommended as Pods shouldn't pollute the 
      # prefix header of other libraries or of the user project, but since it's a 
      # local dev pod...

      src.prefix_header_file = 'hAPI_SDK/hAPI_SDKLib/hAPI_SDK-Prefix.pch'

      src.source_files = 'hAPI_SDK/hAPI_SDKLib/**/*.{h,m,swift}'

    end

    # TODO: determine if we need to make certain headers private or just make
    # everything public (by continuing to comment out the next line) (20151120:AB)
    # s.public_header_files = "hAPI_SDK/hAPI_SDKLib/Classes/**/*.h"


    # ――― Resources ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
    #
    #  A list of resources included with the Pod. These are copied into the
    #  target bundle with a build phase script. Anything else will be cleaned.
    #  You can preserve files from being cleaned, please don't preserve
    #  non-essential files like tests, examples and documentation.
    #

    # s.resource  = "icon.png"
    # s.resources = "Resources/*.png"

    # s.preserve_paths = "FilesToSave", "MoreFilesToSave"

  end

  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Link your library with frameworks, or libraries. Libraries do not include
  #  the lib prefix of their name.
  #

  # s.framework  = "SomeFramework"
  # s.frameworks = "SomeFramework", "AnotherFramework"

  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"


  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If your library depends on compiler flags you can set them in the xcconfig hash
  #  where they will only apply to your library. If you depend on other Podspecs
  #  you can include multiple dependencies to ensure it works.

  s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }

  # hAPI_SDK currently has no 3rd party pod dependencies. It just has
  # static libraries for AFNetworking and JSONKit.

  # what versions?  
  #s.dependency 'AFNetworking'
  #s.dependency 'JSON-Kit'
  
end
