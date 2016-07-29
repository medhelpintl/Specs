#
#  hAPI-SDK.podspec (a local dev pod for hAPITracker (experimental))
#
#  Copyright (c) 2016 Medhelp International. All rights reserved.
#
#  (Started support for !use_frameworks with v2.0.0 2016/07/25:AB)
#
#  NEVER PUSH THIS VERSION TO THE PUBLIC PODSPECS REPO!! ONLY PUSH TO "MedHelp" PRIVATE REPO!
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
#  that requires iOS 8+ as well as use_frameworks! Eventually the contents of
#  this podspec will be copied into the hAPI-SDK repository, with the s.source
#  value changed to point to the hAPI-SDK Github repository.
#
#  Bumping from 2.0.0 to 2.0.1 since the 2.0.0 tag is associated with the previous
#  dynamic framework attempt at reorganizing the file folder structure. 2.0.1 is
#  associated with an in-place conversion from the static library to the dynamic
#  framework to avoid major merging to develop issues (2016/07/26:AB)
#
#  Bumping from 2.0.1 to 2.0.2 for Dean's recent timezone update (2016/07/29:AB)

version = "2.0.2"

Pod::Spec.new do |s|

  #  Spec Metadata:
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

  # Note: can't change "hAPI-SDK" to "hAPI_SDK" since it's already a public pod, but
  # all directories and files will continue to have a mix of "hAPI SDK" and "hAPI_SDK". 
  # It is preferred to have underscores to spaces or dashes.
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
  # This custom podspec is just for internal development.
  s.homepage = "https://github.com/medhelpintl/iphone_hapi_sdk_library"

  #  Spec License:
  #
  #  Licensing your code is important. See http://choosealicense.com for more info.
  #  CocoaPods will detect a license file if there is a named LICENSE*
  #  Popular ones are 'MIT', 'BSD' and 'Apache License, Version 2.0'.
  #

  s.license = { :type => "MIT", :file => "LICENSE" }
  
  #  Author Metadata:
  #
  #  Specify the authors of the library, with email addresses. Email addresses
  #  of the authors are extracted from the SCM log. E.g. $ git log. CocoaPods also
  #  accepts just a name if you'd rather not provide an email address.
  #
  #  Specify a social_media_url where others can refer to, for example a twitter
  #  profile URL.
  #

  s.author = { 'medhelp' => 'iphone@medhelp.org' }

  #  Platform Specifics: 
  #  
  #  If this Pod runs only on iOS or OS X, then specify the platform and
  #  the deployment target. You can optionally include the target after the platform.
  #

  s.platform = :ios, '8.0'

  #  When using multiple platforms
  # s.ios.deployment_target = "8.0"
  # s.watchos.deployment_target = "2.0"
  # s.tvos.deployment_target = "9.0"

  s.requires_arc = true

  #  Source Location:
  #
  #  Specify the location from where the source should be retrieved.
  #  Supports git, hg, bzr, svn and HTTP.
  #

  # -- IMPORTANT -- IMPORTANT -- IMPORTANT -- IMPORTANT -- IMPORTANT -- IMPORTANT -- 
  #
  #  The hAPI-SDK.podspec that exists in the iphone_hapi_sdk_library
  #  repo is only meant for local development and should NEVER be pushed to 
  #  the public specs repo. It should only live on the private specs repo which
  #  should always come before the public specs repo in each Podfile, unless you
  #  want to test the Jenkins built closed source version of the new Cocoa
  #  Touch Framework version of hAPI-SDK. 
  #  
  #  As a developer works on this local version of hAPI-SDK by way of 
  #  iphone_hapi_sdk_library, in order to get the latest version into one of the 
  #  iOS apps, the latest commit that was pushed to the iphone_hapi_sdk_library 
  #  repo (branch would typically be a feature branch) must be tagged with the 
  #  version matching the version in this podspec. (20151127:AB)
  #
  # -- IMPORTANT -- IMPORTANT -- IMPORTANT -- IMPORTANT -- IMPORTANT -- IMPORTANT --

  s.source = { :git => "git@github.com:medhelpintl/iphone_hapi_sdk_library.git", :tag => s.version.to_s }

  s.subspec 'hAPI_SDK' do |ss|

    #  Source Code:
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

      src.prefix_header_file = 'hAPI SDK/hAPI SDK-Prefix.pch'

      src.source_files = 'hAPI SDK/**/*.{h,m,swift}'

      # (2015/11/29:AB)
      # In order for the hAPI-SDK umbrella header for the development
      # pod to not mark all headers as public, must either explicitly
      # list the public headers in the public_header_files setting
      # or list all the private header files in the private_header_files
      # setting. If all headers are public, it leads to some issues
      # where the same classname exists in both hAPITracker and hAPI-SDK
      # (namely MHUtil).
      #
      # Note that those headers that aren't included in the
      # public_header_files list will be marked as having PROJECT framework
      # membership by default.
      #
      # Note that the existing framework header membership settings set in 
      # the project itself are correct and the exported public framework
      # has the correct headers in both the public and private header folders.

      # TODO: Remove MTSampleHAPIObjC.h once framework is stable 20151129:AB

      src.public_header_files = 'hAPI SDK/hAPI_SDK.h', 'hAPI SDK/MedHelp.h', 'hAPI SDK/GlobalConstants.h', 'hAPI SDK/MHLoginManager.h', 'hAPI SDK/MHOAuthManager.h', 'hAPI SDK/MHSessionManager.h', 'hAPI SDK/MHHealthData.h', 'hAPI SDK/MHQuery.h', 'hAPI SDK/MHBatch.h', 'hAPI SDK/MHError.h', 'hAPI SDK/MHHapiOperationQueueManager.h', 'hAPI SDK/MHObject.h', 'hAPI SDK/_Framework-Examples/MTSampleHAPIObjC.h'

      # src.private_header_files = ''

    end

    # TODO: determine if we need to make certain headers private or just make
    # everything public (by continuing to comment out the next line) (20151120:AB)
    #
    # Only those headers we're marking as public and including in the umbrella
    # header should be public. Normal framework header memberhip is ok for the
    # Framework aggregate target export process, but when hAPI_SDK is a local
    # development pod, all headers become public by default, leading to some
    # duplicate definition errors (MHUtil.h, etc.) (20151129:AB)
    # s.public_header_files = "hAPI SDK/**/*.h"


    #  Resources:
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

  # -- 3rd party libraries that are either static (.a) or composed of source files (.m/.h) that aren't Pods --

  # Note: while these lib headers are marked "project" in order
  # to build, they won't be included with the public framework.
  #
  # CocoaPods will turn these into "public" headers in order
  # for the development pod or private specs repo hosted version
  # of hAPI-SDK to build from the source.

  s.subspec 'Libs' do |lb|

    # TODO: Errors with `pod lib lint` and `pod spec lint` when
    # we have subspecs for the 3rd party libraries. Copying podspec
    # directly to private specs repo and committing is ok, but
    # can't currently deploy via "pod repo push MedHelp hAPI-SDK.podspec". (20151129:AB)

    lb.subspec 'AFNetworking' do |af|
      af.source_files = 'AFNetworking/**/*.{h,m,c}'

      # af.public_header_files = ''
      # af.private_header_files = 'AFNetworking/**/*.h'

    end

    # JSONKit will always need a separate subspec due to non-ARC
    # requirement (20151129:AB)

    lb.subspec 'JSONKit' do |js|
      js.source_files = 'JSONKit/**/*.{h,m,c}'
      js.requires_arc = false

      #js.public_header_files = ''
      #js.private_header_files = 'JSONKit/**/*.h'

    end

  end

  #  Project Linking:
  #
  #  Link your library with frameworks, or libraries. Libraries do not include
  #  the lib prefix of their name.
  #

  # s.framework  = "SomeFramework"
  # s.frameworks = "SomeFramework", "AnotherFramework"

  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"


  #  Project Settings:
  #
  #  If your library depends on compiler flags you can set them in the xcconfig hash
  #  where they will only apply to your library. If you depend on other Podspecs
  #  you can include multiple dependencies to ensure it works.

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }

  # hAPI_SDK currently has no 3rd party pod dependencies. It just has
  # static libraries for AFNetworking and JSONKit.

  # what versions?  
  #s.dependency 'AFNetworking'
  #s.dependency 'JSON-Kit'
  
end
